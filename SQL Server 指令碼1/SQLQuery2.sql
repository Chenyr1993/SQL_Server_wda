use aaa


CREATE TABLE table1 (
user_ID INTEGER NOT NULL PRIMARY KEY, 
user_name CHAR(50) NOT NULL)
GO

CREATE TABLE table2 (
author_ID INTEGER NOT NULL PRIMARY KEY, 
author_name CHAR(50) NOT NULL, 
lastModifiedBy INTEGER NOT NULL, 
addedby INTEGER NOT NULL)
GO

ALTER TABLE table2 
ADD CONSTRAINT fk_one 
FOREIGN KEY (lastModifiedby)REFERENCES table1 (user_ID) ON DELETE CASCADE ON UPDATE cascade
GO

ALTER TABLE table2 
ADD CONSTRAINT fk_two 
FOREIGN KEY (addedby) REFERENCES table1(user_ID) ON DELETE NO ACTION ON UPDATE cascade
GO
--this fails with the error because it provides a second cascading path to table2.

ALTER TABLE table2 
ADD CONSTRAINT fk_two 
FOREIGN KEY (addedby) REFERENCES table1 (user_ID) ON DELETE NO ACTION ON UPDATE NO ACTION
GO
