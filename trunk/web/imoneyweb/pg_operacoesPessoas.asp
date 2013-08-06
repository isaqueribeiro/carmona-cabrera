<!--#include file="recursos/p_conexaobanco.asp" -->
<!--#include file="recursos/p_verificaLogin.asp" -->
<!--#include file="recursos/p_funcoesasp.asp" -->
<%

	if request.QueryString("ope")<>"" then 
		select case request.QueryString("ope")
			case "novo"
				RecuperaPessoa 
			case "edita"
				session("idPes")=request.QueryString("idlan")
				response.Redirect("pg_alteracaoPes.asp?idlanc=" & request.QueryString("idlan")) 
			case "excluir"
				session("opExclusao") = "DELETE * from mny_pessoa  WHERE pes_codigo=" & request.QueryString("idlan")
				CancelarRegistro session("opExclusao"),"pg_cancelaRegistro.asp","pg_consultaPes2.asp"
		end select 
	end if



Function RecuperaPessoa()
	
	set rsMax = conexao.execute("select max(pes_codigo) AS ULT  from mny_pessoa")
	IF ISNULL(rsmax("ULT")) THEN i_iDMov =1 ELSE i_iDMov = cdbl(rsmax("ULT")) + 1
	conexao.execute("insert  into mny_pessoa (pes_codigo) VALUES (" & i_iDMov  & ")")
   	session("idPes")=i_iDMov
	response.Redirect("pg_alteracaoPes.asp?idlanc=" & i_iDMov) 

end function

	

%>