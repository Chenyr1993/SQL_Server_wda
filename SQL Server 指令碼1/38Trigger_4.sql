--��ƮwDDL��Trigger
create trigger readOnlyTable on database
for drop_table,alter_table
as
begin
rollback
end

--�ǥ�2���L��ƪ�S�����p�A�ҥH�i�H�z�Ltriiger����Q�R��
drop table �ǥ�2

--�����θ�Ʈwtrigger
	disable trigger readOnlyTable on database

--�~�i�H���θ�ƪ�trigger
alter table �ҵ{
	disable trigger showCourse
--�ҥ�trigger
alter table �ҵ{
	enable trigger showCourse
