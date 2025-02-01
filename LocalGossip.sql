SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;
SET character_set_client = utf8mb4;
SET character_set_connection = utf8mb4;
SET character_set_results = utf8mb4;
SET collation_connection = utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `post_like`;
DROP TABLE IF EXISTS `post_mention_user`;
DROP TABLE IF EXISTS `post_tag`;
DROP TABLE IF EXISTS `post_file`;
DROP TABLE IF EXISTS `comment_file`;
DROP TABLE IF EXISTS `file`;
DROP TABLE IF EXISTS `comment`;
DROP TABLE IF EXISTS `post`;
DROP TABLE IF EXISTS `flag`;
DROP TABLE IF EXISTS `flag_category`;
DROP TABLE IF EXISTS `group_user`;
DROP TABLE IF EXISTS `group`;
DROP TABLE IF EXISTS `tag`;
DROP TABLE IF EXISTS `user`;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `user` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `email` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin UNIQUE NOT NULL,
  `nickname` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin UNIQUE NOT NULL,
  `nickname_slug` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin UNIQUE NOT NULL,
  `password_hash` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email_verification_token` VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email_verified_at` INT DEFAULT NULL,
  `jwt_token` TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `jwt_token_expired_at` INT DEFAULT NULL,
  `status` ENUM ('Active', 'Inactive') NOT NULL,
  `role` ENUM ('Admin', 'Normal') NOT NULL,
  `last_login_at` INT DEFAULT NULL,
  `created_at` INT DEFAULT NULL,
  `updated_at` INT DEFAULT NULL
);

CREATE TABLE `group` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) UNIQUE NOT NULL,
  `name_slug` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin UNIQUE NOT NULL,
  `status` ENUM ('Active', 'Inactive') NOT NULL,
  `is_public` TINYINT DEFAULT 0,
  `created_at` INT DEFAULT NULL,
  `updated_at` INT DEFAULT NULL
);

CREATE TABLE `group_user` (
  `user_id` INT,
  `group_id` INT,
  `is_admin` TINYINT DEFAULT 0,
  `created_at` INT DEFAULT NULL,
  PRIMARY KEY (`user_id`, `group_id`)
);

CREATE TABLE `flag` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `ref_id` INT NOT NULL,
  `type` ENUM ('Post', 'Comment') NOT NULL,
  `flag_category_id` INT NOT NULL,
  `raised_by` INT NOT NULL,
  `description` TEXT NOT NULL,
  `status` ENUM ('Pending', 'Resolved', 'Unable to resolve', 'Dismissed') NOT NULL,
  `resolved_note` TEXT DEFAULT NULL,
  `resolved_by` INT DEFAULT NULL,
  `resolved_at` INT DEFAULT NULL,
  `created_at` INT DEFAULT NULL,
  `updated_at` INT DEFAULT NULL
);

CREATE TABLE `flag_category` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `name_slug` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `status` ENUM ('Active', 'Inactive') NOT NULL,
  `created_at` INT DEFAULT NULL,
  `updated_at` INT DEFAULT NULL
);

CREATE TABLE `post` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `group_id` INT DEFAULT NULL,
  `visibility` ENUM ('Public', 'Private') NOT NULL,
  `place_name` VARCHAR(250) DEFAULT NULL,
  `place_lat` DECIMAL(10,8) DEFAULT NULL,
  `place_lon` DECIMAL(11,8) DEFAULT NULL,
  `content` TEXT NOT NULL,
  `status` ENUM ('Active', 'Inactive') NOT NULL,
  `is_pinned` TINYINT DEFAULT 0,
  `pinned_by` INT DEFAULT NULL,
  `pinned_at` INT DEFAULT NULL,
  `created_at` INT DEFAULT NULL,
  `updated_at` INT DEFAULT NULL
);

CREATE TABLE `comment` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `content` TEXT NOT NULL,
  `created_at` INT DEFAULT NULL,
  `updated_at` INT DEFAULT NULL
);

CREATE TABLE `comment_file` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `comment_id` INT NOT NULL,
  `file_id` INT NOT NULL,
  `weight` INT NOT NULL DEFAULT 0,
  `created_at` INT DEFAULT NULL
);

CREATE TABLE `post_file` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `file_id` INT NOT NULL,
  `weight` INT NOT NULL DEFAULT 0,
  `created_at` INT DEFAULT NULL
);

CREATE TABLE `file` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `path` VARCHAR(250) NOT NULL,
  `size` INT NOT NULL,
  `file_name` VARCHAR(100) NOT NULL,
  `mime_type` VARCHAR(100) NOT NULL,
  `is_image` TINYINT NOT NULL DEFAULT 0,
  `created_at` INT DEFAULT NULL
);

CREATE TABLE `post_tag` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  `created_at` INT DEFAULT NULL
);

CREATE TABLE `tag` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) UNIQUE NOT NULL,
  `name_slug` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin UNIQUE NOT NULL,
  `status` ENUM ('Active', 'Inactive') NOT NULL,
  `created_at` INT DEFAULT NULL,
  `updated_at` INT DEFAULT NULL
);

CREATE TABLE `post_mention_user` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `created_at` INT DEFAULT NULL
);

CREATE TABLE `post_like` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `post_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `value` TINYINT NOT NULL DEFAULT 1,
  `created_at` INT DEFAULT NULL
);

CREATE INDEX `idx-user-email` ON `user` (`email`);
CREATE INDEX `idx-user-status` ON `user` (`status`);
CREATE INDEX `idx-group-email-status` ON `user` (`email`, `status`);
CREATE UNIQUE INDEX `uk-group-name-status` ON `group` (`name`, `status`);
CREATE INDEX `idx-group-status` ON `group` (`status`);
CREATE INDEX `idx-group-status-is_public` ON `group` (`status`, `is_public`);
CREATE INDEX `idx-group_user-user_id` ON `group_user` (`user_id`);
CREATE INDEX `idx-group_user-group_id` ON `group_user` (`group_id`);
CREATE INDEX `idx-flag-status` ON `flag` (`status`);
CREATE INDEX `idx-flag-ref_id-type` ON `flag` (`ref_id`, `type`);
CREATE UNIQUE INDEX `uk-flag_category-name-status` ON `flag_category` (`name`, `status`);
CREATE INDEX `idx-comment-post_id` ON `comment` (`post_id`);
CREATE INDEX `idx-comment_file-comment_id` ON `comment_file` (`comment_id`);
CREATE INDEX `idx-comment_file-comment_id-weight` ON `comment_file` (`comment_id`, `weight`);
CREATE UNIQUE INDEX `uk-comment_file-comment_id-file_id` ON `comment_file` (`comment_id`, `file_id`);
CREATE INDEX `idx-post_file-post_id` ON `post_file` (`post_id`);
CREATE INDEX `idx-post_file-post_id-weight` ON `post_file` (`post_id`, `weight`);
CREATE UNIQUE INDEX `uk-post_file-post_id-file_id` ON `post_file` (`post_id`, `file_id`);
CREATE UNIQUE INDEX `uk-post_tag-post_id-tag_id` ON `post_tag` (`post_id`, `tag_id`);
CREATE UNIQUE INDEX `uk-tag-name-status` ON `tag` (`name`, `status`);
CREATE INDEX `idx-tag-status` ON `tag` (`status`);
CREATE UNIQUE INDEX `uk-post_mention_user-post_id-user_id` ON `post_mention_user` (`post_id`, `user_id`);
CREATE UNIQUE INDEX `uk-post_like-post_id-user_id` ON `post_like` (`post_id`, `user_id`);
ALTER TABLE `group_user` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `group_user` ADD FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `flag` ADD FOREIGN KEY (`ref_id`) REFERENCES `post` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `flag` ADD FOREIGN KEY (`ref_id`) REFERENCES `comment` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE `flag` ADD FOREIGN KEY (`flag_category_id`) REFERENCES `flag_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `flag` ADD FOREIGN KEY (`raised_by`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `flag` ADD FOREIGN KEY (`resolved_by`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `post` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `post` ADD FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `post` ADD FOREIGN KEY (`pinned_by`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `comment` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `comment` ADD FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `comment_file` ADD FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `comment_file` ADD FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `post_file` ADD FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `post_file` ADD FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `file` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `post_tag` ADD FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `post_tag` ADD FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `post_mention_user` ADD FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `post_mention_user` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `post_like` ADD FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE `post_like` ADD FOREIGN KEY (`post_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;