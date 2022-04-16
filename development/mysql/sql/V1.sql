alter table session add index (value);

alter table record add index (record_id);

alter table group_member add index (user_id);

alter table user add index (user_id);

alter table group_info add index (group_id);