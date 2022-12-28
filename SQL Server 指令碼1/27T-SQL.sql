--°j°é while
--¥[Á`1~100
declare @i int=1, @sum int=0
set @i=1
while @i<=100
begin
set @sum+=@i
set @i+=1
end
print @sum 
go

--¦L*
declare @i int=1,@star varchar(max)=''
while @i<=5
begin set @star+='*'
	  print @star
	  set @i+=1
end