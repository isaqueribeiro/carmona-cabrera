<%
	
	
		session("bco")=request.Form("cmbbco")
		session("sUsu") = request.form("txtusu")
		session("sSenha")=trim(request.form("txtsenha"))
		response.Redirect("autentica.asp")
'response.Write(session("bco"))
%>