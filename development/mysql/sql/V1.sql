ALTER TABLE session ADD INDEX (value);

ALTER TABLE group_member ADD INDEX (user_id);

ALTER TABLE user ADD INDEX (user_id);

ALTER TABLE group_info ADD INDEX (group_id);

ALTER TABLE category ADD INDEX (category_id);

ALTER TABLE record_item_file ADD INDEX (linked_record_id);

ALTER TABLE file ADD INDEX (file_id);

ALTER TABLE category_group ADD INDEX (group_id);

ALTER TABLE record_comment ADD INDEX (linked_record_id);

ALTER TABLE record_last_access ADD INDEX (user_id);

ALTER TABLE record ADD INDEX (record_id, created_by, status);
