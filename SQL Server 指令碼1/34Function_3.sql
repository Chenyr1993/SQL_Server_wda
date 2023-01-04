--函式：自動產生具規則的編號
create function getStuID()
	returns char(4)
	begin
	declare @id char(4),@newId char(4),@tempId varchar(4),@len tinyint
	select top 1 @id=學號 from 學生
	order by 學號 desc
	--取長度(轉型(抓取字串 substring(變數,從幾個字，抓幾個)as型態) 
	
	set @len=len(cast((substring(@id,2,3)+1) as varchar))
	--判斷要補幾個0
	set @tempId=
	case when @len=2 then 'S0'
		 when @len=1 then 'S00'
		 else 'S'
	end

	--把處理好的id 放在@newId
	
	set @newId= @tempId + cast((substring(@id,2,3)+1) as varchar)
	--print @newId
	return @newId
	end
	go
	--新增一筆學生資料
	insert into 學生(學號,生日,電話,姓名,性別)
	values(dbo.getStuID(),'1999-9-9','07-1245678','東方不敗','男')