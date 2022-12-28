--�w�s�{�� Stored Procedure
--�N�q�G�w���g�@�q�{���A���ݭn�A�I�s�A�D�`�������,�i�H�b�̭��g�j��...

--create Procedure(�Y�gProc) �R�W
create Proc StudentCourseOrders
as
begin
	SELECT          �ǥ�.�Ǹ�, �ǥ�.�m�W, �ҵ{.�W��, �ҵ{.�Ǥ�, �Z��.�W�Үɶ�, �Z��.�Ы�, ���u.�m�W AS �Ѯv
	FROM              ���u INNER JOIN
                            �б� ON ���u.�����Ҧr�� = �б�.�����Ҧr�� INNER JOIN
                            �Z�� ON �б�.�б½s�� = �Z��.�б½s�� INNER JOIN
                            �ҵ{ ON �Z��.�ҵ{�s�� = �ҵ{.�ҵ{�s�� INNER JOIN
                            �ǥ� ON �Z��.�Ǹ� = �ǥ�.�Ǹ�
end
--���ըϥιw�s�{��
--execute(�Y�gexec) �w�s�{�ǦW
exec StudentCourseOrders
go
--�ǥͿ�Ҽ�
create Proc StudentsCourse
as
begin
	SELECT          �ǥ�.�Ǹ�, �ǥ�.�m�W,count(*) as ��Ҽ�,sum(�ҵ{.�Ǥ�) as �`�Ǥ�
	FROM              ���u INNER JOIN
                            �б� ON ���u.�����Ҧr�� = �б�.�����Ҧr�� INNER JOIN
                            �Z�� ON �б�.�б½s�� = �Z��.�б½s�� INNER JOIN
                            �ҵ{ ON �Z��.�ҵ{�s�� = �ҵ{.�ҵ{�s�� INNER JOIN
                            �ǥ� ON �Z��.�Ǹ� = �ǥ�.�Ǹ�
							group by �ǥ�.�Ǹ�, �ǥ�.�m�W
end
--����ǥͿ�Ҽ�
exec StudentsCourse
go
---------------------------------
--�ǥͿ�Ҽ�(���Ѽƪ��w�s�{��)
create Proc queryStudentsCourse
@name varchar(12)
as
begin
	SELECT          �ǥ�.�Ǹ�, �ǥ�.�m�W,count(*) as ��Ҽ�,sum(�ҵ{.�Ǥ�) as �`�Ǥ�
	FROM              ���u INNER JOIN
                            �б� ON ���u.�����Ҧr�� = �б�.�����Ҧr�� INNER JOIN
                            �Z�� ON �б�.�б½s�� = �Z��.�б½s�� INNER JOIN
                            �ҵ{ ON �Z��.�ҵ{�s�� = �ҵ{.�ҵ{�s�� INNER JOIN
                            �ǥ� ON �Z��.�Ǹ� = �ǥ�.�Ǹ�
							where �ǥ�.�m�W=@name
							group by �ǥ�.�Ǹ�, �ǥ�.�m�W
end
--����z�Ǿǥ�
exec queryStudentsCourse '�O���R'
