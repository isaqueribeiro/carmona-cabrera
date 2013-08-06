
<!--#include file="recursos/p_funcoesasp.asp" -->
<!--#include file="recursos/p_conexaobanco.asp" -->


<%	

	sUsu = trataString(session("sUsu"))
	sSenha = session("sSenha")
	Set rsLog = Conexao.execute("SELECT * FROM sys_usuario WHERE usr_nome = '" & trim(sUsu) & "'")
'	response.Write("qqqq" & sUsu)
	if rslog.eof then 
		response.Redirect("index.asp?erro=usunaoloc")
	else
		if Trim(rslog("usr_senha") = cstr(sSenha)) then 
			session("gI_NivelUsu") = CDBL(rsLog("usr_nivel"))
			Session("admin")       = "admin"
			Session("ip_admin")    = Request.ServerVariables("REMOTE_ADDR")
			session("gI_IdUsu")    = 1		
			session("gI_CodUsu")   = rsLog("usr_codigo")
			session("gS_nmUsu")    = ucase(sUsu)
			
			'Dados da Empresa
			session("gS_NmEmpresa") = "CARMONA CABRERA" 
			session("gS_NrCnpj")    = "00.000.0000/0000-00"			
			response.Redirect("index1.asp")
		ELSE
			response.Redirect("index.asp?erro=senha&usu=" & sUsu)
		end if
	end if
	

	


%>