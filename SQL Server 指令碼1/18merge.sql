--merge
--�ݱ���M�w�n�s�W�B�ק�ΧR��
--���Ȥ��ƪ�P�s�Ȥ��ƪ�
--�Y�H�s�b���Ȥ�ק���ơA�Y�ݩ�s�Ȥ�h�s�W���
merge �Ȥ� as c
using �s�Ȥ� as nc
on c.�Ȥ�s��=nc.�Ȥ�s��
when matched then
update set �m�W=nc.�m�W,�q��=nc.�q��
when not matched then
insert (�Ȥ�s��,�m�W,�q��) values(nc.�Ȥ�s��,nc.�m�W,nc.�q��)
;
--�Y��~�Z�ؼ�>=250�A�R���Ȥ᪺�~�Z�ؼи��
--�Y��~�Z�ؼ�<250�A�N�Ȥ᪺�~�Z�ؼ�+25
--�|�����~�Z�ؼСA�N�Ȥ᪺�~�Z�ؼи�Ƴ]�w��100
--���ǧR��>�ק�>�s�W

merge �Ȥ�~�Z as cs
using �Ȥ� as c
on cs.�Ȥ�s��=c.�Ȥ�s��
when matched and cs.�~�Z�ؼ�>=250 then
delete 
--�W���z�粒>=250�A�ѤU���N�|�O<250
when matched then
update set �~�Z�ؼ�=cs.�~�Z�ؼ�+25
when not matched then
insert (�Ȥ�s��,�~�Z�ؼ�)values(c.�Ȥ�s��,100);