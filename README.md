# LocalGossip Database Migration Tool

A command-line tool for initializing and populating the LocalGossip database with test data. This tool helps developers quickly set up a development environment with realistic test data while maintaining referential integrity.

This project was created as part of a Data Modelling assignment at SEGI University. While the schema demonstrates good database design principles, it is primarily for educational purposes. The schema is suitable for learning and small projects but lacks many features needed for production use (such as comprehensive indexing, security features, and data validation). Please use it as a reference and exercise caution if adapting for production use.

## Features

- Database schema initialization
- Automated fake data generation
- Malaysian localization support
- Maintains referential integrity during data generation
- Detailed progress logging
- Configurable generation quantities

## Dependencies

The tool requires the following:

- **MySQL**: Version 8.0 or higher (recommended for full UTF8MB4 support)
- **Python packages**:
  - **click**: Command-line interface creation kit
  - **mysql-connector-python**: MySQL database connector for Python
  - **faker**: Library for generating fake data

## Installation

1. Clone the repository:
```bash
git clone https://github.com/lunzai/segi-data-model-local-gossip local-gossip
cd local-gossip
```

2. (Optional) Create and activate a virtual environment:
```bash
# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate
```

3. Install the required Python packages:
```bash
pip install -r requirements.txt
```

4. Create the database schema with proper character set:
```sql
CREATE SCHEMA `local_gossip` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

5. Configure database connection:
   
   Edit the `DB_CONFIG` in `localgossip.py`:
   ```python
   DB_CONFIG = {
       'host': 'localhost',
       'user': 'root',
       'password': '',
       'database': 'localgossip'
   }
   ```

6. Make the script executable:
```bash
chmod +x localgossip.py
```

## Usage

### Test Database Connection

To test your database connection and configuration:

```bash
python localgossip.py test
```

This command will:
- Test MySQL server connection
- Check if the database exists
- Verify database connection credentials
- Check if schema file exists and is readable
- Provide helpful debugging information and suggestions if any tests fail

### Initialize Database Schema

To create or reset the database schema:

```bash
python localgossip.py init
```

This command will:
- Prompt for confirmation before proceeding
- Drop all existing tables
- Create new tables according to the schema
- Display progress information

### Generate Test Data

To populate the database with test data:

```bash
python localgossip.py generate
```

This command will:
- Generate fake data for all tables
- Maintain referential integrity
- Use Malaysian localization where possible
- Display progress information

### Full Migration

To perform both initialization and data generation in one command:

```bash
python localgossip.py migrate
```

This command will:
- Run the init command (with confirmation)
- If successful, run the generate command
- Display combined progress information

### Customizing Data Generation

You can modify the number of records generated for each table by editing the `GEN_CONSTANTS` dictionary in `localgossip.py`:

```python
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
```

## Notes

- Always backup your database before running the `init` command as it will drop all existing tables
- The tool requires an existing MySQL database specified in `DB_CONFIG`
- Generated data maintains referential integrity, so parent records are always created before child records
- Some operations may take longer depending on the quantity of records being generated

## Troubleshooting

If you encounter errors:

1. Ensure MySQL is running and accessible
2. Verify database credentials in `DB_CONFIG`
3. Check if the database exists
4. Ensure `LocalGossip.sql` is in the same directory as `localgossip.py`
