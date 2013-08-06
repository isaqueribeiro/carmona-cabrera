<%

	
	'if session("gb_Login")="" then 
	'	response.Redirect("index.asp?erro=log")
	'end if
	
Function TrataString(sTexto)
	
	sTexto = trim(UCASE(sTexto))
	sTexto = replace(sTexto,"'","`")
	sTexto = replace(sTexto,";","")
	sTexto = replace(sTexto,"(","")
	sTexto = replace(sTexto,")","")
	sTexto = replace(sTexto,"--","")
	sTexto = replace(sTexto,"*","")
	sTexto = replace(sTexto,"""","")
	sTexto = replace(sTexto,"UNION","")     :sTexto = replace(sTexto,"FROM","")  	:sTexto = replace(sTexto,"ALL","")
	sTexto = replace(sTexto,"TABLE","")     :sTexto = replace(sTexto,"SELECT","")	:sTexto = replace(sTexto,"UPDATE","")
	sTexto = replace(sTexto,"INSERT","")    :sTexto = replace(sTexto,"DROP","")  	:sTexto = replace(sTexto,"ALTER","")
	sTexto = replace(sTexto,"CREATE","")    :sTexto = replace(sTexto,"WHERE","") 	:sTexto = replace(sTexto,"LEFT","")
	sTexto = replace(sTexto,"NOT","")       :sTexto = replace(sTexto,"LIKE","")  	:sTexto = replace(sTexto,"DROP","")
	sTexto = replace(sTexto,"ALTER","")     :sTexto = replace(sTexto,"JOIN","")  	:sTexto = replace(sTexto,"INNER","")	
	sTexto = replace(sTexto,"HAVING","")    :sTexto = replace(sTexto,"IN ","")   	:sTexto = replace(sTexto,"TRUNCATE","")
	sTexto = replace(sTexto,"ALTER","")     :sTexto = replace(sTexto,"JOIN","")  	:sTexto = replace(sTexto,"INNER","")
	sTexto = replace(sTexto,"DELIMITER","") :sTexto = replace(sTexto,"ORDER","") 	:sTexto = replace(sTexto,"GROUP","")			
	sTexto = replace(sTexto," AND","")      :sTexto = replace(sTexto,"AND ","")     :sTexto = replace(sTexto," OR","")				
	sTexto = replace(sTexto,"'OR'1'='1'",""):sTexto = replace(sTexto,"'OR '1=1'",""):sTexto = replace(sTexto,"OR '1=1'","")				
	sTexto = replace(sTexto,"OR '1 = 1'","")
	TrataString=sTexto
	
	
End function


%>