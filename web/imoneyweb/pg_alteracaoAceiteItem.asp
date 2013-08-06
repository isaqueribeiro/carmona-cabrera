<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="recursos/p_conexaobanco.asp" -->
<!--#include file="recursos/p_verificaLogin.asp" -->
<!--#include file="recursos/p_funcoesasp.asp" -->
<!--#include file="recursos/scripts.asp" -->


<%

if session("gI_NivelUsu") >= 1 then 
	
	if request.QueryString("op")="da" then 'Diretoria - OK DIRETORIA
		conexao.execute("UPDATE mny_movimento_item set mov_status=4  WHERE mov_codigo=" & session("idLancamento") & " AND mov_item=" & session("idItemLanc") )
		MsgBox1 "Operação realizada com sucesso!(OK DIRETORIA)"
	end if
	if request.QueryString("op")="ga" then 'Gerencia - OK FINANCEIRO
		conexao.execute("UPDATE mny_movimento_item set mov_status=3  WHERE mov_codigo=" & session("idLancamento") & " AND mov_item=" & session("idItemLanc") )
		MsgBox1 "Operação realizada com sucesso! (OK FINANCEIRO)"
	end if
	
	
end if

sLinkVoltar="<a  href='pg_alteracaoAceite.asp?idlanc=&" &  session("idLancamento") & "'>Lançamento</a>"
sNomedaPagina=sLinkVoltar & " >> Edição de Itens do Lançamento Nrº: " & session("idLancamento")

strCon = session("conexao")

'Nome da página de consulta
pagina_consulta = "pg_alteracaoAceite.asp"

'Nome da página de alteração
pagina_alteracao = "pg_alteracaoAceiteItem.asp"

'Nome da página de inclusão


'Nome da página de login
pagina_login = "index.asp"

'*******************************************************************


If Session("admin") <> "" And Session("ip_admin") = Request.ServerVariables("REMOTE_ADDR") Then
%>

<HTML>
<HEAD>
<TITLE>Alterar Registro</TITLE>
<link href="css/estiloSis.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
body {
	margin-top: 0px;
}
-->
</style>

</HEAD>
<BODY class="texto_pagina" onLoad="init()">
<div id="loading" style="position:absolute; width:451px; text-align:center; top:315px; left: 306px;">
<img src="imagens/loading2.gif" border=0> </div>
<script>
 var ld=(document.all);
  var ns4=document.layers;
 var ns6=document.getElementById&&!document.all;
 var ie4=document.all;
  if (ns4)
 	ld=document.loading;
 else if (ns6)
 	ld=document.getElementById("loading").style;
 else if (ie4)
 	ld=document.all.loading.style;
  function init()
 {
 if(ns4){ld.visibility="hidden";}
 else if (ns6||ie4) ld.display="none";
 }
 </script>
<span class="titulo_pagina"><br>
<%=(sNomedaPagina)%></span> <br>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="2%" height="30" background="back2.gif"><div align="center"><img src="icones/voltar.gif" width="16" height="16"></div></td>
    <td width="5%" background="back2.gif">&nbsp;<a class="LinskMenuPagina" href="pg_alteracaoAceite.asp?idlanc=<%=session("idLancamento")%>">Voltar</a></td>
    <td width="1%" background="back2.gif"><div align="right"></div></td>
    <td width="2%" background="back2.gif"><div align="center"><img src="icones/add.gif" width="16" height="16">'</div></td>
    <td width="17%" background="back2.gif"><div align="left"><a class="LinskMenuPagina" href="pg_operacoesAceiteItem.asp?ope=novo">Novo Lançamento Item</a></div></td>
    <td width="2%" background="back2.gif"><img src="icones/impressora9.gif" width="18" height="18"></td>
    <td width="10%" background="back2.gif"><%if session("gI_NivelUsu") >= 1 then %> 
    											<a href="pg_alteracaoaceiteitem.asp?idItemLanc=<%=session("idItemLanc")%>&op=da" class="LinskMenuPagina">Ok Diretoria</a>
                                           <%else	
										   	   response.Write("Ok Diretoria")
										   end if%></td>     
    <td width="3%" background="back2.gif"><div align="center"><img src="icones/impressora9.gif" width="18" height="18"></div></td>
    <td width="58%" background="back2.gif"><%if session("gI_NivelUsu") >= 1 then %> 
	   											<a href="pg_alteracaoaceiteitem.asp?idItemLanc=<%=session("idItemLanc")%>&op=ga" class="LinskMenuPagina">Ok Gerencia</a>
                                           <%else
										   		response.Write("Ok Gerencia")
										   end if%></td>   
  </tr>
</table>
<hr size=1 color=gainsboro>

<div align="center">
  <%
If Not IsEmpty(Request.Form("salvar")) Then
  Set objCon = Server.CreateObject("ADODB.Connection")
  objCon.Open strCon
  Set objRS = Server.CreateObject("ADODB.Recordset")
  objRS.CursorLocation = 3
  objRS.CursorType = 0
  objRS.LockType = 3

  strQ = Request.Form("strQ")
  indice = Trim(Request.Form("indice"))
  strQ = " SELECT * FROM mny_movimento_item WHERE mov_codigo=" & session("idLancamento") & " and mov_item=" & session("idItemLanc")

  objRS.Open strQ, objCon, , , &H0001
  'response.Write(strQ)
  'If indice = "" Then objRS.Move Request.Form("recordno") - 1

  If objRS.Fields("mov_codigo").properties("IsAutoIncrement") = False Then
   objRS("mov_codigo") =  session("idLancamento")
  End If
  If objRS.Fields("mov_item").properties("IsAutoIncrement") = False Then
   objRS("mov_item") = session("idItemLanc")
  End If
  
  sNrParcela= Trim(Request.Form("mov_parcela"))
  if not isnumeric(sNrParcela) then sNrParcela=0
  sDtVenc = Trim(Request.Form("mov_data_vencto"))
  sDtVenc = FormataData(sDtVenc,"yyyy/mm/dd")
  sDtPrev = FormataData(Trim(Request.Form("mov_data_prev")),"yyyy/mm/dd")
  
  
  sql_up=" UPDATE mny_movimento_item set mov_data_prev='" & sDtPrev & "',"
  sql_up= sql_up & " mov_data_vencto ='" & sDtVenc & "',"
  sql_up= sql_up & " fpg_codigo = " & Trim(Request.Form("fpg_codigo")) & ","
  sql_up= sql_up & " tip_doc_codigo = " & Trim(Request.Form("tip_doc_codigo")) & ","
  'sql_up= sql_up & " mov_status =" &  Trim(Request.Form("mov_status"))& ","
  valor = Replace(Request.Form("mov_valor"),",",".")
  sql_up= sql_up & " mov_valor=" & (valor)& ","
  
  valorJ = Replace(Request.Form("mov_juros"),",",".")
  sql_up= sql_up & " mov_juros=" & (valorJ)& ","
  
  valorD = Replace(Request.Form("mov_desconto"),",",".")
  sql_up= sql_up & " mov_desconto=" & (valorD)& ","

  valorR = Replace(Request.Form("mov_retencao"),",",".")
  sql_up= sql_up & " mov_retencao=" & (valorR)& ","
  
  valorAPG = Replace(Request.Form("mov_valor_pagar"),",",".")
  sql_up= sql_up & " mov_valor_pagar=" & (valorAPG)& ""
  
  sql_up= sql_up & ",mov_parcela=" & (sNrParcela)& ""
  
  sql_up= sql_up & " where mov_codigo=" & session("idLancamento")
  sql_up= sql_up & " and  mov_item=" & session("idItemLanc")
  
  'response.Write(sql_up)
  conexao.execute(sql_up)
  '  objRS("mov_data_prev") = Trim(Request.Form("mov_data_prev"))
  '  objRS("mov_data_vencto") = Trim(Request.Form("mov_data_vencto"))
  '  objRS("fpg_codigo") = Trim(Request.Form("fpg_codigo"))
  '  objRS("tip_doc_codigo") = Trim(Request.Form("tip_doc_codigo"))
  'ObjRS("mov_status") = Trim(Request.Form("mov_status"))
  If objRS.Fields("mov_valor").properties("IsAutoIncrement") = False Then

    'objRS("mov_valor") = Trim(Replace(valor, "R$",""))
  End If
  If objRS.Fields("mov_juros").properties("IsAutoIncrement") = False Then
    valor = Replace(Request.Form("mov_juros"),",",".")
    'objRS("mov_juros") = Trim(Replace(valor, "R$",""))
  End If
  If objRS.Fields("mov_desconto").properties("IsAutoIncrement") = False Then
    valor = Replace(Request.Form("mov_desconto"),",",".")
    'objRS("mov_desconto") = Trim(Replace(valor, "R$",""))
  End If
  If objRS.Fields("mov_retencao").properties("IsAutoIncrement") = False Then
    valor = Replace(Request.Form("mov_retencao"),",",".")
    'objRS("mov_retencao") = Trim(Replace(valor, "R$",""))
  End If
  If objRS.Fields("mov_valor_pagar").properties("IsAutoIncrement") = False Then
    valor = Replace(Request.Form("mov_valor_pagar"),",",".")
    'objRS("mov_valor_pagar") = Trim(Replace(valor, "R$",""))
  End If
  'On Error Resume Next
  'objRS.UpdateBatch
 ' objRS.Close
  Set objRS = Nothing
  objCon.Close
  Set objCon = Nothing
%>
  
  <BR>
  <B>Registro alterado</B><BR>
  O registro foi alterado 
  com sucesso.<BR>
  <BR>
  
  <%
Else
   sSelecao=false
  If Not IsEmpty(Request.Form("recordno")) Then
  	  sSelecao=true
	  strQ = Request.Form("strQ")
	  indice = Trim(Request.Form("indice"))
	  If indice <> "" Then strQ = " SELECT * FROM mny_movimento_item WHERE mov_codigo=" & session("idLancamento") & " and " & indice
	  
	  SET RS = conexao.execute(strQ)
	  if not rs.eof then 
	  	session("idItemLanc") = RS("mov_item")
	  end if
  else
  	IF REQUEST.QueryString("idItemLanc") <>"" then 
  		  sSelecao=true
		  strQ = "SELECT * FROM mny_movimento_item"
		  indice = " mov_item=" & Trim(REQUEST.QueryString("idItemLanc"))
		  If indice <> "" Then strQ = " SELECT * FROM mny_movimento_item WHERE mov_codigo=" & session("idLancamento") & " and " & indice
	ELSE
		sSelecao=FALSE
	end if
  end if
  'response.Write(sSelecao)
  
  if sSelecao=true then 
  
  
  'If Not IsEmpty(Request.Form("recordno")) Then
    Set objCon = Server.CreateObject("ADODB.Connection")
    objCon.Open strCon

    Set objRS = Server.CreateObject("ADODB.Recordset")
    objRS.CursorLocation = 2
    objRS.CursorType = 0
    objRS.LockType = 3


  'strQ = Request.Form("strQ")
  'indice = Trim(Request.Form("indice"))
  'If indice <> "" Then strQ = " SELECT * FROM mny_movimento_item WHERE " & indice

    objRS.Open strQ, objCon, , , &H0001
	'response.Write(strQ)
  If indice = "" Then objRS.Move Request.Form("recordno") - 1
%>
  
  <B>Alterar dados do Registro</B><BR>
  Altere os dados 
  necessários abaixo:<BR>
</div>
<table width="780" border="0" align="center" cellpadding="0" cellspacing="0" background="imagens/fdoQuadro/fdoMedio.jpg">
  <tr>
  	<td height="12" colspan="2"></td>
  </tr>
   <tr>
  	<td width="20" height="33">&nbsp;</td>
    <td width="760" valign="top" class="texto_pagina"><strong>Detalhes do Item</strong></td>
  </tr>
  <tr>
    <td colspan="2"><table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><form name="form_incluir" method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" onSubmit="return verifica_form(this);">
          <INPUT type=hidden name=recordno value="<%=Request.Form("recordno")%>">
          <INPUT type=hidden name=strQ value="<%=Request.Form("strQ")%>">
          <INPUT type="hidden" name="indice" value="<%=indice%>">
          <TABLE border=0 align="center" cellpadding=2 cellspacing=1 class=tabela_formulario>
            <TR class=titulo_campos>
              <TD width="101"><div align="right">Lan&ccedil;. Princ.:<br>
              </div></TD>
              <TD width="195"><%If objRS.Fields("mov_codigo").properties("IsAutoIncrement") = False Then%>
                  <INPUT name="mov_codigo" type="text" disabled class=campos_formulario style="width=100" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("mov_codigo").Value)%>" size="20" maxlength="255"  df_verificar="sim">
                  <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("mov_codigo").Value) & "</B>"
End If
%></TD>
              <TD width="150"><div align="right">Ident. do Lanc. Item:</div></TD>
              <TD width="283"><%If objRS.Fields("mov_item").properties("IsAutoIncrement") = False Then%>
                  <INPUT name="mov_item" type="text" disabled class=campos_formulario style="width=100" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("mov_item").Value)%>" size="20" maxlength="255"  df_verificar="sim">
                  <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("mov_item").Value) & "</B>"
End If
%></TD>
            </TR>
            <TR class=titulo_campos>
              <TD> <div align="right">Data Previs&atilde;o:</div></TD>
              <TD><%If objRS.Fields("mov_data_prev").properties("IsAutoIncrement") = False Then%>
                  <INPUT name="mov_data_prev" type="text"  class=campos_formulario style="width=200" onBlur="verifica_data(this)" onKeyPress="desabilita_cor(this)" OnKeyUp="this.value=mascara_data(this.value)" value="<%=(objRS.Fields.Item("mov_data_prev").Value)%>" size="20" maxlength="11"  df_verificar="sim">
                  <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("mov_data_prev").Value) & "</B>"
End If
%></TD>
              <TD><div align="right">Data Vencto:</div></TD>
              <TD><%If objRS.Fields("mov_data_vencto").properties("IsAutoIncrement") = False Then%>
                  <INPUT name="mov_data_vencto" type="text"  class=campos_formulario style="width=200" onBlur="verifica_data(this)" onKeyPress="desabilita_cor(this)" OnKeyUp="this.value=mascara_data(this.value)" value="<%=(objRS.Fields.Item("mov_data_vencto").Value)%>" size="20" maxlength="11"  df_verificar="sim">
                  <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("mov_data_vencto").Value) & "</B>"
End If
%></TD>
            </TR>
            <TR class=titulo_campos>
              <TD> <div align="right">Forma Pgto:</div></TD>
              <TD><SELECT style="width=200" name="fpg_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
                  <OPTION value=""></OPTION>
                  <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT fpg_codigo,fpg_nome FROM mny_forma_pagto ORDER BY fpg_nome ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("fpg_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("fpg_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("fpg_codigo").Value) = Lcase(objRS.Fields.Item("fpg_codigo").Value) then
	      Response.Write "selected"
	    End If
	    Response.Write ">" & (objRS2.Fields.Item("fpg_nome").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>
              </SELECT></TD>
              <TD><div align="right">Tipo Doc.:</div></TD>
              <TD><SELECT style="width=200" name="tip_doc_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
                  <OPTION value=""></OPTION>
                  <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT tip_codigo,tip_nome FROM mny_tipo_documento ORDER BY tip_nome ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("tip_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("tip_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("tip_codigo").Value) = Lcase(objRS.Fields.Item("tip_doc_codigo").Value) then
	      Response.Write "selected"
	    End If
	    Response.Write ">" & (objRS2.Fields.Item("tip_nome").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>
              </SELECT></TD>
            </TR>
            <TR class=titulo_campos>
              <TD><div align="right">Status:<br>
              </div></TD>
              <TD><SELECT style="width=200" name="mov_status" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
                  <%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1

  strQ = "SELECT sit_codigo,sit_nome FROM sys_situacao where sit_codigo="  & objRS.Fields.Item("mov_status") &  " ORDER BY sit_nome ASC" 
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("sit_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("sit_codigo").Value) & "'"
	    If Lcase(objRS2.Fields.Item("sit_codigo").Value) = Lcase(objRS.Fields.Item("mov_status").Value) then
	      Response.Write "selected"
	    End If
	    Response.Write ">" & (objRS2.Fields.Item("sit_nome").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>
              </SELECT></TD>
              <TD><div align="right">Nr Parcela:</div></TD>
              <TD><INPUT name="mov_parcela" type="text" class=campos_formulario style="width=100" onKeyPress="desabilita_cor(this)" value="<%=(objRS.Fields.Item("mov_parcela").Value)%>" size="20" maxlength="10"  df_verificar="sim"></TD>
            </TR>
            <TR nowrap class=titulo_campos>
              <TD><div align="right">Valor <br>
              </div></TD>
              <TD><%If objRS.Fields("mov_valor").properties("IsAutoIncrement") = False Then%>
                  <INPUT style="width=150" type="text" name="mov_valor" maxlength="12" value="<%If Trim(objRS.Fields.Item("mov_valor").Value) <> "" Then : Response.Write replace(Formatnumber(objRS.Fields.Item("mov_valor").Value,2),".","") : End If%>" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
                  <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("mov_valor").Value) & "</B>"
End If
%></TD>
              <TD><div align="right">Vl Juros</div></TD>
              <TD><%If objRS.Fields("mov_juros").properties("IsAutoIncrement") = False Then%>
                  <INPUT style="width=150" type="text" name="mov_juros" maxlength="12" value="<%If Trim(objRS.Fields.Item("mov_juros").Value) <> "" Then : Response.Write replace(Formatnumber(objRS.Fields.Item("mov_juros").Value,2),".","") : End If%>" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
                  <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("mov_juros").Value) & "</B>"
End If
%></TD>
            </TR>
            <TR nowrap class=titulo_campos>
              <TD><div align="right">Vl. Desconto:<br>
              </div></TD>
              <TD><%If objRS.Fields("mov_desconto").properties("IsAutoIncrement") = False Then%>
                  <INPUT style="width=150" type="text" name="mov_desconto" maxlength="12" value="<%If Trim(objRS.Fields.Item("mov_desconto").Value) <> "" Then : Response.Write replace(Formatnumber(objRS.Fields.Item("mov_desconto").Value,2),".","") : End If%>" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
                  <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("mov_desconto").Value) & "</B>"
End If
%></TD>
              <TD><div align="right">Vl. Reten&ccedil;&atilde;o:</div></TD>
              <TD><%If objRS.Fields("mov_retencao").properties("IsAutoIncrement") = False Then%>
                  <INPUT style="width=150" type="text" name="mov_retencao" maxlength="12" value="<%If Trim(objRS.Fields.Item("mov_retencao").Value) <> "" Then : Response.Write replace(Formatnumber(objRS.Fields.Item("mov_retencao").Value,2),".","") : End If%>" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
                  <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("mov_retencao").Value) & "</B>"
End If
%></TD>
            </TR>
            <TR nowrap class=titulo_campos>
              <TD><div align="right">Vl a Pagar:<br>
              </div></TD>
              <TD colspan="3"><%If objRS.Fields("mov_valor_pagar").properties("IsAutoIncrement") = False Then%>
                  <INPUT style="width=150" type="text" name="mov_valor_pagar" maxlength="12" value="<%If Trim(objRS.Fields.Item("mov_valor_pagar").Value) <> "" Then : Response.Write replace(Formatnumber(objRS.Fields.Item("mov_valor_pagar").Value,2),".","") : End If%>" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
                  <%
Else
  Response.Write "<B>" & (objRS.Fields.Item("mov_valor_pagar").Value) & "</B>"
End If
%></TD>
            </TR>
          </TABLE>
          <div align="center"> <br>
              <%if objRS.Fields.Item("mov_status").Value<>"6" then %>
	              <input type="submit" name="salvar" value="Gravar" class=botao_enviar>
              <%else
			  		response.Write("Registro liquidado, não é possivel realizar alterações!")
			  end if%>  
          </div>
        </form></td>
      </tr>
    </table></td>
  </tr>
</table>
<br>

<%
    If indice = "" Then
      resp=""
    End If
  End If
End If
%>
<hr size=1 color=gainsboro>
<table width="700" border="0" align="center" cellpadding="3" cellspacing="0" class="Borda_tabela">
  <tr bgcolor="#999999" class="texto_pagina">
    <td width="16">&nbsp;</td>
    <td width="56">Cod.Lanc.</td>
    <td width="121"><div align="center">Venc.</div></td>
    <td width="63"><div align="center">Prev.</div></td>
    <td width="56"><div align="right">Valor</div></td>
    <td width="45"><div align="right">Juros</div></td>
    <td width="41"><div align="right">Desc.</div></td>
    <td width="59"><div align="right">Valor a Pg</div></td>
    <td width="64"><div align="center">F.Pgto</div></td>
    <td width="63"><div align="center">T.Doc</div></td>
    <td width="48"><div align="center">Status</div></td>
  </tr>
  <%
  s_sql = " select * from mny_movimento_item i,mny_forma_pagto f,mny_tipo_documento d,sys_situacao  s "
  s_sql = s_sql  & " where i.fpg_codigo = f.fpg_codigo and i.tip_doc_codigo= d.tip_codigo and i.mov_status=s.sit_codigo"
  s_sql = s_sql  & " and mov_codigo=" & session("idLancamento")
  'response.Write(s_sql)
  set rsLista = conexao.execute (s_sql)
  while not rslista.eof %>
  <tr class="texto_pagina">
    <td><div align="center"><img src="icones/seta0001.gif" width="16" height="16"></div></td>
    <td height="32"><div align="center"><strong><a class="LinskSelacaoRegistro" title="Editar registro" href="pg_operacoesAceiteItem.asp?ope=edita&idItem=<%=rslista("mov_item")%>"><%=formataNumero(rslista("mov_item"),6)%></a></strong></div></td>
        <td><div align="center"><%=rsLista("mov_data_vencto")%></div></td>
        <td><div align="center"><%=rsLista("mov_data_prev")%></div></td>
        <td><div align="right"><%=formatNumber(rsLista("mov_valor"),2)%></div></td>
        <td><div align="right"><%=formatNumber(rsLista("mov_juros"),2)%></div></td>
        <td><div align="right"><%=formatNumber(rsLista("mov_desconto"),2)%></div></td>
        <td><div align="right"><%=formatNumber(rsLista("mov_valor_pagar"),2)%></div></td>
        <td><div align="center"><%=rsLista("fpg_nome")%></div></td>
        <td><div align="center"><%=rsLista("tip_nome")%></div></td>
        <td><div align="center"><%=rsLista("sit_nome")%></div></td>
      </tr>
    <%rsLista.movenext
	wend%>
</table>


</BODY>
</HTML>

<%
Else
  'Response.Write "<B>Acesso negado...</B> somente o administrador do site tem acesso a esta página."
  'Response.Write "<BR><a href=""" & pagina_login & """ class=""texto_pagina"">Clique aqui</a> para efetuar login no sitema"
End If
%>
