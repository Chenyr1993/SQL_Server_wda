--Instead Trigger
--���Ӫ��ާ@���N��

--��ڭn�s�W�ҵ{,�Y�s�W�ɵo�{�ӽҵ{�w�s�b,�ڴN��H�u�ק�ҵ{��ơv���N��Ӫ��s�W�ʧ@

--after trigger
--instead trigger

create trigger add_Course on �ҵ{
instead of insert
as 
	begin
--�ˬd�s�W���ҵ{�O�_�w�g�s�b(PK�O�_����)
	if exists(select * from �ҵ{ where �ҵ{�s��=(select �ҵ{�s�� from inserted))
		begin
	--p.k���� �A��insert���N��update
		update �ҵ{
		set �W��=inserted.�W��,�Ǥ�=inserted.�Ǥ�
	--����ϥΤ@��update���g�k
	--where �ҵ{�s��=inserted.�ҵ{�s��
		from �ҵ{ inner join inserted on �ҵ{.�ҵ{�s��=inserted.�ҵ{�s��
		end
	else--�n�O�o�g
		begin
		--���M�n����insert
			insert into �ҵ{
			select * from inserted
		end
	end

	--����
	insert into �ҵ{
	values('CS888','bbb','2')
	select * from �ҵ{
	--����Instaed trigger��A��o��PK���ơA���e�|�qinsert�אּupdate�w�s�b���
	
	--update trigger�i�H�g�ܦh�ӡAInstead trigger�C�Ӹ�ƪ�u��g�@��
