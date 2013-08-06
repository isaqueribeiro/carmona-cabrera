<!--#include file="recursos/p_conexaobanco.asp" -->
<!--#include file="recursos/p_verificaLogin.asp" -->
<!--#include file="recursos/p_funcoesasp.asp" -->
<%
	session("sNmOrigem")=""
	if request.QueryString("ope")<>"" then 
		select case request.QueryString("ope")
			case "novo"
				RecuperaCtaBancaria 
			case "edita"
				session("idCtaBancaria")=request.QueryString("idlan")
				response.Redirect("pg_alteracaoCtaBancaria.asp?idlanc=" & request.QueryString("idlan")) 

			case "excluir"
				session("opExclusao") = "DELETE  * from mny_conta_corrente  WHERE ccr_codigo=" & request.QueryString("idlan")
				CancelarRegistro session("opExclusao"),"pg_cancelaRegistro.asp","pg_consultaCtaBancaria.asp"
		end select 
	end if



Function RecuperaCtaBancaria()
	
	set rsMax = conexao.execute("select max(ccr_codigo) AS ULT  from mny_conta_corrente")
	IF ISNULL(rsmax("ULT")) THEN i_iDMov =1 ELSE i_iDMov = cdbl(rsmax("ULT")) + 1
	conexao.execute("insert  into mny_conta_corrente (ccr_codigo) VALUES (" & i_iDMov  & ")")
   	session("idCtaBancaria")=i_iDMov
	
	if request.QueryString("origem")="cadpes" then session("sNmOrigem")="cadpes"
	response.Redirect("pg_alteracaoCtaBancaria.asp?idlanc=" & i_iDMov) 

end function

	

%>