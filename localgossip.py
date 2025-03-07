#!/usr/bin/env python3

import click
import mysql.connector
from mysql.connector import Error
import os
from faker import Faker
import random
from datetime import datetime, timedelta
import time
import re
import bcrypt
from secrets import token_urlsafe

# Configuration
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': 'root',
    'database': 'local_gossip'
}

# Generation constants - edit these to control how many rows to generate
GEN_CONSTANTS = {
    'users': 50,
    'groups': 10,
    'group_users': 50,
    'posts': 100,
    'comments': 150,
    'files': 100,
    'post_files': 50,
    'comment_files': 50,
    'tags': 25,
    'post_likes': 150,
    'post_mentions': 50,
    'post_flags': 5,
    'comment_flags': 5,
    'post_tags': 100
}

def log(message, level='INFO'):
    """Unified logging format with padded level strings"""
    # Pad level string to 7 characters (longest level is 'SUCCESS')
    padded_level = level.ljust(7)
    print(f"[ {padded_level} ] {datetime.now().strftime('%Y-%m-%d %H:%M:%S')} - {message}")

def get_db_connection():
    """Create and return database connection"""
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        return conn
    except Error as e:
        log(f"⚠️  Error connecting to database: {e}", "ERROR")
        exit(1)

def read_schema():
    """Read the SQL schema file"""
    try:
        with open('LocalGossip.sql', 'r') as file:
            return file.read()
    except FileNotFoundError:
        log("⚠️  Schema file 'LocalGossip.sql' not found", "ERROR")
        exit(1)

def convert_to_slug(text):
    """Convert text to slug format"""
    # Convert to lowercase and trim
    slug = text.lower().strip()
    # Combine multiple spaces into single space
    slug = re.sub(r'\s+', ' ', slug)
    # Remove all symbols except hyphens and underscores
    slug = re.sub(r'[^\w\s\-_]', '', slug)
    # Replace spaces with hyphens
    slug = slug.replace(' ', '-')
    return slug

def generate_password_hash():
    """Generate a random password and hash it with bcrypt"""
    password = token_urlsafe(24)  # Generate 24-char random string
    salt = bcrypt.gensalt()
    password_hash = bcrypt.hashpw(password.encode(), salt)
    return password_hash.decode()

def generate_timestamp(index, total, years_back=3):
    """Generate a unix timestamp between now and years_back ago, distributed based on index"""
    now = datetime.now()
    years_ago = now - timedelta(days=years_back * 365)
    
    # Calculate a relative position between 0 and 1 based on the index
    position = index / total
    
    # Generate timestamp between years_ago and now, ensuring it's not in the future
    timestamp = years_ago + (now - years_ago) * position
    if timestamp > now:
        timestamp = now
    
    return int(timestamp.timestamp())

@click.group()
def cli():
    """LocalGossip Database Migration Tool"""
    pass

@cli.command()
def init():
    """Initialize database schema"""
    print()
    if not click.confirm('⚠️  This will drop all existing tables and data. Are you sure?'):
        log("⚠️  Operation cancelled by user")
        return

    conn = get_db_connection()
    cursor = conn.cursor()
    schema = read_schema()

    try:
        print()
        log("⌛ Starting schema initialization...")
        
        # Execute each SQL statement
        for statement in schema.split(';'):
            if statement.strip():
                cursor.execute(statement)
                
        conn.commit()
        log("✅  Schema initialization completed successfully", "SUCCESS")

    except Error as e:
        log(f"⚠️  Error during schema initialization: {e}", "ERROR")
        conn.rollback()
    finally:
        cursor.close()
        conn.close()

@cli.command()
def generate():
    """Generate fake data for the database"""
    fake = Faker(['en_MS'])
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    try:
        print()
        log("⌛ Starting data generation...")

        # Generate Users
        print()
        log(f"⌛ Generating {GEN_CONSTANTS['users']} users...")
        total_users = GEN_CONSTANTS['users']
        for i in range(total_users):
            email = fake.email()
            nickname = fake.user_name()
            # Determine role based on count
            role = 'Normal'
            if total_users >= 20:
                if i < 3:  # First 5 users are admin
                    role = 'Admin'
            else:
                if i == 0:  # Only first user is admin
                    role = 'Admin'
            
            cursor.execute("""
                INSERT INTO user (email, nickname, nickname_slug, password_hash, status, role, created_at, updated_at)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
            """, (
                email,
                nickname,
                convert_to_slug(nickname),
                generate_password_hash(),
                'Active' if random.random() < 0.90 else 'Inactive',
                role,
                timestamp := generate_timestamp(i, total_users),
                timestamp  # updated_at same as created_at
            ))
        conn.commit()
        log(f"✅  Generated {GEN_CONSTANTS['users']} users", "SUCCESS")

        # Generate Groups
        print()
        log(f"⌛ Generating {GEN_CONSTANTS['groups']} groups...")
        for i in range(GEN_CONSTANTS['groups']):
            name = fake.company()
            cursor.execute("""
                INSERT INTO `group` (name, name_slug, status, is_public, created_at, updated_at)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (
                name,
                convert_to_slug(name),
                'Active' if random.random() < 0.90 else 'Inactive',
                random.choice([0, 1]),
                timestamp := generate_timestamp(i, GEN_CONSTANTS['groups']),
                timestamp
            ))
        conn.commit()
        log(f"✅  Generated {GEN_CONSTANTS['groups']} groups", "SUCCESS")

        # Get existing user and group IDs
        cursor.execute("SELECT id FROM user")
        user_ids = [row['id'] for row in cursor.fetchall()]
        
        cursor.execute("SELECT id FROM `group`")
        group_ids = [row['id'] for row in cursor.fetchall()]

        # Generate Group Users
        print()
        log(f"⌛ Generating {GEN_CONSTANTS['group_users']} group users...")
        group_user_count = {}  # Track users per group
        for _ in range(GEN_CONSTANTS['group_users']):
            try:
                group_id = random.choice(group_ids)
                # Initialize counter for this group if not exists
                if group_id not in group_user_count:
                    group_user_count[group_id] = 0
                    
                is_admin = 1 if group_user_count[group_id] < 2 else 0
                group_user_count[group_id] += 1
                
                cursor.execute("""
                    INSERT INTO group_user (user_id, group_id, is_admin, created_at)
                    VALUES (%s, %s, %s, %s)
                """, (
                    random.choice(user_ids),
                    group_id,
                    is_admin,
                    generate_timestamp(_, GEN_CONSTANTS['group_users'])
                ))
            except Error:
                continue  # Skip if duplicate
        conn.commit()
        log(f"✅  Generated group users", "SUCCESS")

        # Generate Flag Categories
        print()
        log(f"⌛ Generating flag categories...")
        categories = ['Spam', 'Harassment', 'Inappropriate', 'Violence', 'Other']
        for category in categories:
            cursor.execute("""
                INSERT INTO flag_category (name, name_slug, status, created_at, updated_at)
                VALUES (%s, %s, %s, %s, %s)
            """, (
                category,
                convert_to_slug(category),
                'Active',
                timestamp := generate_timestamp(_, 5),
                timestamp
            ))
        conn.commit()
        log(f"✅  Generated flag categories", "SUCCESS")

        # Generate Posts
        print()
        log(f"⌛ Generating {GEN_CONSTANTS['posts']} posts...")
        for _ in range(GEN_CONSTANTS['posts']):
            # Determine if post should have location (20% chance)
            has_location = random.random() < 0.20
            place_data = {
                'place_name': fake.street_address() if has_location else None,
                'place_lat': float(fake.local_latlng()[0]) if has_location else None,
                'place_lon': float(fake.local_latlng()[1]) if has_location else None,
            }
            
            # Determine if post should be pinned (10% chance)
            is_pinned = random.random() < 0.10
            timestamp = generate_timestamp(_, GEN_CONSTANTS['posts'])
            pinned_data = {
                'is_pinned': 1 if is_pinned else 0,
                'pinned_by': random.choice(user_ids) if is_pinned else None,
                'pinned_at': timestamp + 3600 if is_pinned else None,  # Pinned 1 hour after creation
            }
            
            cursor.execute("""
                INSERT INTO post (user_id, group_id, visibility, place_name, place_lat, place_lon, 
                                 content, status, is_pinned, pinned_by, pinned_at, created_at, updated_at)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            """, (
                random.choice(user_ids),
                random.choice(group_ids) if random.random() < 0.25 else None,  # 25% chance of group post
                'Private' if random.random() < 0.05 else 'Public',  # 5% chance of private
                place_data['place_name'],
                place_data['place_lat'],
                place_data['place_lon'],
                fake.paragraph(),
                'Active' if random.random() < 0.90 else 'Inactive',  # 90% chance of being active
                pinned_data['is_pinned'],
                pinned_data['pinned_by'],
                pinned_data['pinned_at'],
                timestamp,
                timestamp
            ))
        conn.commit()
        log(f"✅  Generated {GEN_CONSTANTS['posts']} posts", "SUCCESS")

        # Get post IDs
        cursor.execute("SELECT id FROM post")
        post_ids = [row['id'] for row in cursor.fetchall()]

        # Generate Comments
        print()
        log(f"⌛ Generating {GEN_CONSTANTS['comments']} comments...")
        for _ in range(GEN_CONSTANTS['comments']):
            cursor.execute("""
                INSERT INTO comment (post_id, user_id, content, created_at, updated_at)
                VALUES (%s, %s, %s, %s, %s)
            """, (
                random.choice(post_ids),
                random.choice(user_ids),
                fake.sentence(),
                timestamp := generate_timestamp(_, GEN_CONSTANTS['comments']),
                timestamp
            ))
        conn.commit()
        log(f"✅  Generated {GEN_CONSTANTS['comments']} comments", "SUCCESS")

        # Get comment IDs
        cursor.execute("SELECT id FROM comment")
        comment_ids = [row['id'] for row in cursor.fetchall()]

        # Get flag category IDs
        cursor.execute("SELECT id FROM flag_category")
        flag_category_ids = [row['id'] for row in cursor.fetchall()]

        # Generate Post Flags
        print()
        log(f"⌛ Generating {GEN_CONSTANTS['post_flags']} post flags...")
        for _ in range(GEN_CONSTANTS['post_flags']):
            try:
                created_at = generate_timestamp(_, GEN_CONSTANTS['post_flags'])
                is_resolved = random.random() < 0.50  # 50% chance of being resolved
                
                # For resolved flags, pick a random resolution status
                status = 'Pending'
                resolved_at = None
                resolved_by = None
                resolved_note = None
                
                if is_resolved:
                    status = random.choice(['Resolved', 'Unable to resolve', 'Dismissed'])
                    resolved_at = min(created_at + 86400, int(datetime.now().timestamp()))  # 1 day after created_at, capped at now
                    resolved_by = random.choice(user_ids)
                    resolved_note = fake.text(max_nb_chars=200)
                
                cursor.execute("""
                    INSERT INTO flag (ref_id, type, flag_category_id, raised_by, description, 
                                    status, resolved_at, resolved_by, resolved_note, created_at, updated_at)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """, (
                    random.choice(post_ids),
                    'Post',
                    random.choice(flag_category_ids),
                    random.choice(user_ids),
                    fake.text(max_nb_chars=200),
                    status,
                    resolved_at,
                    resolved_by,
                    resolved_note,
                    created_at,
                    created_at
                ))
            except Error:
                continue
        conn.commit()
        log(f"✅  Generated {GEN_CONSTANTS['post_flags']} post flags", "SUCCESS")

        # Generate Comment Flags
        print()
        log(f"⌛ Generating {GEN_CONSTANTS['comment_flags']} comment flags...")
        for _ in range(GEN_CONSTANTS['comment_flags']):
            try:
                created_at = generate_timestamp(_, GEN_CONSTANTS['comment_flags'])
                is_resolved = random.random() < 0.50  # 50% chance of being resolved
                
                # For resolved flags, pick a random resolution status
                status = 'Pending'
                resolved_at = None
                resolved_by = None
                resolved_note = None
                
                if is_resolved:
                    status = random.choice(['Resolved', 'Unable to resolve', 'Dismissed'])
                    resolved_at = min(created_at + 86400, int(datetime.now().timestamp()))  # 1 day after created_at, capped at now
                    resolved_by = random.choice(user_ids)
                    resolved_note = fake.text(max_nb_chars=200)
                
                cursor.execute("""
                    INSERT INTO flag (ref_id, type, flag_category_id, raised_by, description, 
                                    status, resolved_at, resolved_by, resolved_note, created_at, updated_at)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
                """, (
                    random.choice(comment_ids),
                    'Comment',
                    random.choice(flag_category_ids),
                    random.choice(user_ids),
                    fake.text(max_nb_chars=200),
                    status,
                    resolved_at,
                    resolved_by,
                    resolved_note,
                    created_at,
                    created_at
                ))
            except Error:
                continue
        conn.commit()
        log(f"✅  Generated {GEN_CONSTANTS['comment_flags']} comment flags", "SUCCESS")

        # Generate Tags
        print()
        log(f"⌛ Generating {GEN_CONSTANTS['tags']} tags...")
        for _ in range(GEN_CONSTANTS['tags']):
            name = f"{fake.word()} {fake.word()}"
            cursor.execute("""
                INSERT INTO tag (name, name_slug, status, created_at, updated_at)
                VALUES (%s, %s, %s, %s, %s)
            """, (
                name,
                convert_to_slug(name),
                'Active' if random.random() < 0.90 else 'Inactive',
                timestamp := generate_timestamp(_, GEN_CONSTANTS['tags']),
                timestamp
            ))
        conn.commit()
        log(f"✅  Generated {GEN_CONSTANTS['tags']} tags", "SUCCESS")

        # Get tag IDs
        cursor.execute("SELECT id FROM tag")
        tag_ids = [row['id'] for row in cursor.fetchall()]

        # Generate Post Tags
        print()
        log(f"⌛ Generating {GEN_CONSTANTS['post_tags']} post tags...")
        for _ in range(GEN_CONSTANTS['post_tags']):
            try:
                cursor.execute("""
                    INSERT INTO post_tag (post_id, tag_id, created_at)
                    VALUES (%s, %s, %s)
                """, (
                    random.choice(post_ids),
                    random.choice(tag_ids),
                    generate_timestamp(_, GEN_CONSTANTS['post_tags'])
                ))
            except Error:
                continue  # Skip if duplicate
        conn.commit()
        log(f"✅  Generated post tags", "SUCCESS")

        # Generate Post Likes
        print()
        log(f"⌛ Generating {GEN_CONSTANTS['post_likes']} post likes...")
        for _ in range(GEN_CONSTANTS['post_likes']):
            try:
                cursor.execute("""
                    INSERT INTO post_like (post_id, user_id, value, created_at)
                    VALUES (%s, %s, %s, %s)
                """, (
                    random.choice(post_ids),
                    random.choice(user_ids),
                    -1 if random.random() < 0.15 else 1,  # 10% chance of dislike
                    generate_timestamp(_, GEN_CONSTANTS['post_likes'])
                ))
            except Error:
                continue  # Skip if duplicate
        conn.commit()
        log(f"✅  Generated post likes", "SUCCESS")

        # Generate Post Mentions
        print()
        log(f"⌛ Generating {GEN_CONSTANTS['post_mentions']} post mentions...")
        for _ in range(GEN_CONSTANTS['post_mentions']):
            try:
                cursor.execute("""
                    INSERT INTO post_mention_user (post_id, user_id, created_at)
                    VALUES (%s, %s, %s)
                """, (
                    random.choice(post_ids),
                    random.choice(user_ids),
                    generate_timestamp(_, GEN_CONSTANTS['post_mentions'])
                ))
            except Error:
                continue  # Skip if duplicate
        conn.commit()
        log(f"✅  Generated post mentions", "SUCCESS")

        # Generate Post Files
        print()
        log(f"⌛ Generating {GEN_CONSTANTS['post_files']} post files...")
        for i in range(GEN_CONSTANTS['post_files']):
            # First create a file
            is_image = random.random() < 0.75  # 75% chance of being an image
            
            if is_image:
                file_name = fake.file_name(category='image')
                mime_type = random.choice(['image/jpeg', 'image/png', 'image/gif'])
            else:
                file_name = fake.file_name(category='text')
                mime_type = random.choice(['text/plain', 'application/pdf', 'application/msword'])
            
            cursor.execute("""
                INSERT INTO file (user_id, path, size, file_name, mime_type, is_image, created_at)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
            """, (
                random.choice(user_ids),
                f"/uploads/posts/{file_name}",
                random.randint(1000, 10000000),  # Random file size between 1KB and 10MB
                file_name,
                mime_type,
                1 if is_image else 0,
                timestamp := generate_timestamp(i, GEN_CONSTANTS['post_files'])
            ))
            
            # Get the last inserted file ID
            file_id = cursor.lastrowid
            
            # Create post_file association
            cursor.execute("""
                INSERT INTO post_file (post_id, file_id, weight, created_at)
                VALUES (%s, %s, %s, %s)
            """, (
                random.choice(post_ids),
                file_id,
                0,  # Default weight
                timestamp
            ))
        conn.commit()
        log(f"✅  Generated post files", "SUCCESS")

        # Generate Comment Files
        print()
        log(f"⌛ Generating {GEN_CONSTANTS['comment_files']} comment files...")
        for i in range(GEN_CONSTANTS['comment_files']):
            # First create a file
            is_image = random.random() < 0.75  # 75% chance of being an image
            
            if is_image:
                file_name = fake.file_name(category='image')
                mime_type = random.choice(['image/jpeg', 'image/png', 'image/gif'])
            else:
                file_name = fake.file_name(category='text')
                mime_type = random.choice(['text/plain', 'application/pdf', 'application/msword'])
            
            cursor.execute("""
                INSERT INTO file (user_id, path, size, file_name, mime_type, is_image, created_at)
                VALUES (%s, %s, %s, %s, %s, %s, %s)
            """, (
                random.choice(user_ids),
                f"/uploads/comments/{file_name}",
                random.randint(1000, 10000000),  # Random file size between 1KB and 10MB
                file_name,
                mime_type,
                1 if is_image else 0,
                timestamp := generate_timestamp(i, GEN_CONSTANTS['comment_files'])
            ))
            
            # Get the last inserted file ID
            file_id = cursor.lastrowid
            
            # Create comment_file association
            cursor.execute("""
                INSERT INTO comment_file (comment_id, file_id, weight, created_at)
                VALUES (%s, %s, %s, %s)
            """, (
                random.choice(comment_ids),
                file_id,
                0,  # Default weight
                timestamp
            ))
        conn.commit()
        log("✅  Generated comment files", "SUCCESS")

        print()
        log("✅  Data generation completed successfully", "SUCCESS")

    except Error as e:
        log(f"⚠️  Error during data generation: {e}", "ERROR")
        conn.rollback()
    finally:
        cursor.close()
        conn.close()

@cli.command()
def test():
    """Test database connection and configuration"""
    print()
    log("⌛ Testing database connection...")
    
    # Test MySQL connection without database
    try:
        test_config = DB_CONFIG.copy()
        test_config.pop('database', None)  # Remove database from config
        conn = mysql.connector.connect(**test_config)
        log("✅  MySQL connection successful", "SUCCESS")
        
        # Test if database exists
        cursor = conn.cursor()
        cursor.execute("SHOW DATABASES LIKE %s", (DB_CONFIG['database'],))
        database_exists = cursor.fetchone() is not None
        
        if database_exists:
            log(f"✅  Database '{DB_CONFIG['database']}' exists", "SUCCESS")
            
            # Test database connection
            try:
                test_conn = mysql.connector.connect(**DB_CONFIG)
                log("✅  Database connection successful", "SUCCESS")
                test_conn.close()
            except Error as e:
                log(f"⚠️  Database connection failed: {e}", "ERROR")
                log("Please check your database permissions", "INFO")
        else:
            log(f"⚠️  Database '{DB_CONFIG['database']}' does not exist", "ERROR")
            log("\nTo create the database, run this SQL command:", "INFO")
            log("\nCREATE SCHEMA `local_gossip` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;\n", "INFO")
            
        cursor.close()
        conn.close()
        
        # Test SQL file existence and readability
        print()
        log("⌛ Testing schema file...")
        try:
            with open('LocalGossip.sql', 'r') as file:
                log("✅  Schema file exists and is readable", "SUCCESS")
        except FileNotFoundError:
            log("⚠️  Schema file 'LocalGossip.sql' not found", "ERROR")
            log("Please ensure LocalGossip.sql is in the same directory", "INFO")
        except PermissionError:
            log("⚠️  Cannot read schema file due to permissions", "ERROR")
            log("Please check file permissions for LocalGossip.sql", "INFO")
        
    except Error as e:
        log("⚠️  MySQL connection failed", "ERROR")
        log(f"⚠️  Error details: {e}", "ERROR")
        log("\nPlease check:", "INFO")
        log("1. MySQL server is running", "INFO")
        log("2. Host and port are correct", "INFO")
        log("3. Username and password are correct", "INFO")
        log("4. User has sufficient privileges", "INFO")

@cli.command()
def migrate():
    """Initialize schema and generate test data"""
    print()
    log("⌛ Starting migration...")
    
    # Run init command
    init.callback()
    
    # Run generate command if init was successful
    if click.get_current_context().info_name == 'migrate':
        print()
        generate.callback()
        
        print()
        log("✅  Migration completed successfully", "SUCCESS")

if __name__ == '__main__':
    cli() 