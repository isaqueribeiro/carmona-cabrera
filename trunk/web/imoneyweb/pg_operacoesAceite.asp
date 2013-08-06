<!--#include file="recursos/p_conexaobanco.asp" -->
<!--#include file="recursos/p_verificaLogin.asp" -->
<!--#include file="recursos/p_funcoesasp.asp" -->
<%

	if request.QueryString("ope")<>"" then 
		select case request.QueryString("ope")
			case "novo"
				RecuperaMovimento 
			case "edita"
				session("idLancamento")=request.QueryString("idlan")
				response.Redirect("pg_alteracaoAceite.asp?idlanc=" & request.QueryString("idlan")) 
		end select 
	end if



Function RecuperaMovimento()
	
	set rsMax = conexao.execute("select max(mov_codigo) AS ULT  from mny_movimento")
	IF ISNULL(rsmax("ULT")) THEN i_iDMov =1 ELSE i_iDMov = cdbl(rsmax("ULT")) + 1
	conexao.execute("insert  into mny_movimento (mov_codigo) VALUES (" & i_iDMov  & ")")
   	session("idLancamento")=i_iDMov
	response.Redirect("pg_alteracaoAceite.asp?idlanc=" & i_iDMov) 

end function

	

%>