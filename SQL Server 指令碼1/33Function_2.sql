--��ƪ�Ȩ��
create function fnGetStudentCourse()
returns table
--�i�H��select�X�Ӫ����breturn
return(
SELECT          �ǥ�.�Ǹ�, �ǥ�.�m�W, �ҵ{.�W��, �ҵ{.�Ǥ�, �б�.�б½s��, ���u.�m�W AS �б©m�W
FROM              �Z�� INNER JOIN
                            �б� ON �Z��.�б½s�� = �б�.�б½s�� INNER JOIN
                            �ҵ{ ON �Z��.�ҵ{�s�� = �ҵ{.�ҵ{�s�� INNER JOIN
                            �ǥ� ON �Z��.�Ǹ� = �ǥ�.�Ǹ� INNER JOIN
                            ���u ON �б�.�����Ҧr�� = ���u.�����Ҧr��
							)
--������
select * from dbo.fnGetStudentCourse()

--�d�߬Y��ǥͪ���Ҹ��
create function fnGetStudentCourseResult(@id char(4))
returns table
--�i�H��select�X�Ӫ����breturn
return(
SELECT          �ǥ�.�Ǹ�, �ǥ�.�m�W, �ҵ{.�W��, �ҵ{.�Ǥ�, �б�.�б½s��, ���u.�m�W AS �б©m�W
FROM              �Z�� INNER JOIN
                            �б� ON �Z��.�б½s�� = �б�.�б½s�� INNER JOIN
                            �ҵ{ ON �Z��.�ҵ{�s�� = �ҵ{.�ҵ{�s�� INNER JOIN
                            �ǥ� ON �Z��.�Ǹ� = �ǥ�.�Ǹ� INNER JOIN
                            ���u ON �б�.�����Ҧr�� = ���u.�����Ҧr��
							where �ǥ�.�Ǹ�=@id
							)
--������
select * from dbo.fnGetStudentCourseResult('S002')