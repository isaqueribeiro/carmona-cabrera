<!--#include file="p_conexaobanco.asp" -->
<%

	'Session("admin") = "admin"
    'Session("ip_admin") = Request.ServerVariables("REMOTE_ADDR")
	'session("gI_IdUsu")=""
	
	set rs = conexao.execute("Select * from sys_empresa")
	if not rs.eof then 
		session("gS_NmEmpresa")    = RS("emp_razao_social")
		session("gS_NmCondominio") = RS("emp_fantasia")
		nr = RS("emp_cnpj")
		'04201372000130
		session("gS_NrCnpj") = left(Nr,2) & "." & mid(Nr,3,3) & "." & mid(Nr,6,3) & "/" & mid(Nr,9,4) & "-" & right(Nr,2)
		session("gS_http")   = "http://www.carmonacabrera.com.br/imoneyweb/"
		
		
	'	if session("gB_Login")= ""  then 
		if ( Trim(Session("admin")) = "" ) then 
			response.Write("<script language='JavaScript'>window.open('index.asp','_parent'); </script>")
		end if
	end if
	
	if ( Trim(session("gI_IdUsu")) = "" ) then 
		response.Write("<script language='JavaScript'>window.open('index.asp','_parent'); </script>")
	end if

%>
