<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="recursos/p_funcoesasp.asp" -->
<%
	session("gS_nmCriterio")=""
	session("gS_CriterioMovimento")=""
	session("dDtIni")="":session("dDtFim")=""
	
	'if request.form("btnlimpar")="Limpar" then response.Redirect("pg_consultaAceite.asp")
	if request.QueryString("acao")="limpar" then response.Redirect("pg_consultaAceite.asp")
	
	
	if request.Form("txtDtIni")<>"" then session("dDtIni")=request.Form("txtDtIni")
	if request.Form("txtDtFim")<>"" then session("dDtFim")=request.Form("txtDtFim")
	if session("dDtIni")<>"" or session("dDtFim")<>"" then 
		if not isdate(session("dDtIni")) then Mensagem "Data","Data Inicial informada e invalida!"
		if not isdate(session("dDtFim")) then Mensagem "Data","Data Final informada e invalida!"
		if request.Form("chkInclusao")="1" then sCampoData="mny_movimento.mov_data_inclusao" else sCampoData="mny_movimento_item.mov_data_prev"
		sCrit = " and " & sCampoData & ">='" & FormataData(session("dDtIni"),"yyyy/mm/dd") & "'"
		sCrit = sCrit  & " and " & sCampoData & "<='" & FormataData(session("dDtFim"),"yyyy/mm/dd") & "'"
		session("gS_nmCriterio") = "Data Pesquisada:" & FormataData(session("dDtIni"),"dd/mm/yyyy") & " a " & FormataData(session("dDtFim"),"dd/mm/yyyy")
	end if
	if trim(request.Form("txtnome")) <>"" then 
		sNome= TrataString(request.Form("txtnome"))
		if sCrit<>"" then session("gS_nmCriterio") = session("gS_nmCriterio") & "<br>"
		sCrit = sCrit  & " and upper(pes_nome_fantasia) like '%" & ucase(sNome) & "%'"
		session("gS_nmCriterio") = session("gS_nmCriterio") & "Nome:" & ucase(sNome)		
	end if	
	
	session("gS_CriterioMovimento")=sCrit
	response.Redirect("pg_consultaAceite.asp")
		


%>
