<!--#include file="recursos/p_conexaobanco.asp" -->
<!--#include file="recursos/p_verificaLogin.asp" -->
<!--#include file="recursos/p_funcoesasp.asp" -->
<%

	if request.QueryString("ope")<>"" then 
		select case request.QueryString("ope")
			case "novo"
				RecuperaMovimento 
			case "edita"
				session("idItemLanc")=request.QueryString("idItem")
				response.Redirect("pg_alteracaoAceiteItem.asp?idItemLanc=" & request.QueryString("idItem")) 
			case "edita2"
				session("idLancamento")=request.QueryString("idlan")
				session("idItemLanc")=request.QueryString("idItem")
				response.Redirect("pg_alteracaoAceiteItem.asp?idItemLanc=" & request.QueryString("idItem")) 
			case "excluir"
				session("opExclusao") = "UPDATE mny_movimento_item SET mov_status=2 WHERE mov_codigo=" & request.QueryString("idlan") & " AND mov_item=" & request.QueryString("idItem")
				CancelarRegistro session("opExclusao"),"pg_cancelaRegistro.asp","pg_ConsultaAceite.asp"
		end select 
	end if
	'response.Redirect("pg_consultaAceite.asp")


Function RecuperaMovimento()
	
	set rsMax = conexao.execute("select max(mov_item) AS ULT  from mny_movimento_item")
	IF ISNULL(rsmax("ULT")) THEN i_iDMov =1 ELSE i_iDMov = cdbl(rsmax("ULT")) + 1
	conexao.execute("insert  into mny_movimento_item (mov_codigo,mov_item,mov_status,mov_valor,mov_juros,mov_desconto,mov_retencao,mov_valor_pagar) VALUES (" & session("idLancamento") & "," & i_iDMov  & ",1,0,0,0,0,0)")
   	session("idItemLanc")=i_iDMov
	response.Redirect("pg_alteracaoAceiteItem.asp?idItemLanc=" & i_iDMov) 

end function

	

%>