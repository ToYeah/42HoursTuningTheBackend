CREATE TABLE `user` (
    `user_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `kana` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`user_id`)
);

CREATE TABLE `group_info` (
    `group_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `kana` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`group_id`)
);

CREATE TABLE `group_member` (
    `group_id` mediumint unsigned NOT NULL,
    `user_id` mediumint unsigned NOT NULL,
    `is_primary` BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY (`group_id`, `user_id`)
);

CREATE TABLE `record` (
    `record_id` VARCHAR(64) NOT NULL,
    `status` VARCHAR(16) NOT NULL,
    `title` VARCHAR(128) NOT NULL,
    `detail` VARCHAR(512) NOT NULL,
    `category_id` mediumint unsigned NOT NULL,
    `application_group` mediumint unsigned NOT NULL,
    `created_by` mediumint unsigned NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    PRIMARY KEY (`record_id`)
);

CREATE TABLE `record_item_file` (
    `item_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
    `linked_record_id` VARCHAR(64) NOT NULL,
    `linked_file_id` VARCHAR(64) NOT NULL,
    `linked_thumbnail_file_id` VARCHAR(64) NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    PRIMARY KEY (`item_id`)
);

CREATE TABLE `record_last_access` (
    `record_id` VARCHAR(64) NOT NULL,
    `user_id` mediumint unsigned NOT NULL,
    `access_time` TIMESTAMP NOT NULL,
    PRIMARY KEY (`record_id`, `user_id`)
);

CREATE TABLE `record_comment` (
    `comment_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
    `linked_record_id` VARCHAR(64) NOT NULL,
    `value` VARCHAR(512) NOT NULL,
    `created_by` mediumint unsigned NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    PRIMARY KEY (`comment_id`)
);

CREATE TABLE `category` (
    `category_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`category_id`)
);

CREATE TABLE `category_group` (
    `group_id` mediumint unsigned NOT NULL,
    `category_id` mediumint unsigned NOT NULL,
    `application_group` mediumint unsigned NOT NULL,
    PRIMARY KEY (`group_id`,`category_id`, `application_group`)
);

CREATE TABLE `session` (
    `session_id` mediumint unsigned NOT NULL AUTO_INCREMENT,
    `value` VARCHAR(256) NOT NULL,
    `linked_user_id` mediumint unsigned NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    PRIMARY KEY (`session_id`)
);

CREATE TABLE `file` (
    `file_id` VARCHAR(64) NOT NULL,
    `path` VARCHAR(1024) NOT NULL,
    `name` VARCHAR(256) NOT NULL,
    PRIMARY KEY (`file_id`)
);