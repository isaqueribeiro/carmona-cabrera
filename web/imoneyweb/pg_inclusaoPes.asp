<% @ LANGUAGE="VBSCRIPT" %>
<%
'*******************************************************************
' Página gerada pelo sistema Dataform 2 - http://www.dataform.com.br
'*******************************************************************
' Altere os valores das variáveis indicadas abaixo se necessário

'String de conexão para o banco de dados do Microsoft Access
strCon = "DBQ=E:\Projetos\charles\imoneyweb\dados\DB_IMONEY.mdb;Driver={Microsoft Access Driver (*.mdb)};"

'Nome da página de consulta
pagina_consulta = "pg_consultaPes.asp"

'Nome da página de alteração
pagina_alteracao = "pg_alteracaoPes.asp"

'Nome da página de inclusão
pagina_inclusao = "pg_inclusaoPes.asp"

'Nome da página de login
pagina_login = "df_login.asp"

'*******************************************************************

If Session("admin") <> "" And Session("ip_admin") = Request.ServerVariables("REMOTE_ADDR") Then
%>

<HTML>
<HEAD>
<TITLE>Incluir Registro</TITLE>
<meta name="copyright" content="Dataform">
<meta name="keywords" content="dataform, asp dataform, aspdataform, asp-dataform">
<meta name="robots" content="ALL">
<style type="text/css">
<!--
.campo_alerta
{
font-family: Tahoma, Verdana, Arial;
font-size: 11px;
border: 1px solid black;
background-color: #ffff99;
}
.texto_pagina
{
font-family: Tahoma, Verdana, Arial;
font-size: 11px;
color: dimgray;
}

.tabela_formulario
{
width: 200;
background-color: white;
}

.titulo_campos
{
font-family: Tahoma, Verdana, Arial;
font-size: 11px;
color: dimgray;
background-color: whitesmoke;
}

.campos_formulario
{
font-family: Tahoma, Verdana, Arial;
font-size: 11px;
color: dimgray;
background-color: gainsboro;
border: 1px inset;
}

.botao_enviar
{
font-family: Tahoma, Verdana, Arial;
font-size: 11px;
color: white;
background-color: gray;
}
-->
</style>
<script language="JavaScript" type="text/javascript">
<!--
function abre_janela(width, height, nome) {
var top; var left;
top = ( (screen.height/2) - (height/2) )
left = ( (screen.width/2) - (width/2) )
window.open('',nome,'width='+width+',height='+height+',scrollbars=no,toolbar=no,location=no,status=no,menubar=no,resizable=no,left='+left+',top='+top);
}
function recebe_imagem(campo, imagem){
var foto = 'img_' + campo
document.form_incluir[campo].value = imagem;
document.form_incluir[foto].src = imagem;
}
function verifica_form(form) {
var passed = false;
var ok = false
var campo
for (i = 0; i < form.length; i++) {
  campo = form[i].name;
  if (form[i].df_verificar == "sim") {
    if (form[i].type == "text"  | form[i].type == "textarea" | form[i].type == "select-one") {
      if (form[i].value == "" | form[i].value == "http://") {
		form[campo].className='campo_alerta'
        form[campo].focus();
        alert("Preencha corretamente o campo");
        return passed;
        stop;
      }
    }
    else if (form[i].type == "radio") {
      for (x = 0; x < form[campo].length; x++) {
        ok = false;
        if (form[campo][x].checked) {
          ok = true;
          break;
        }
      }
      if (ok == false) {
        form[campo][0].focus();
		form[campo][0].select();
        alert("Informe uma das opcões");
        return passed;
        stop;
      }
    }
    var msg = ""
    if (form[campo].df_validar == "cpf") msg = checa_cpf(form[campo].value);
    if (form[campo].df_validar == "cnpj") msg = checa_cnpj(form[campo].value);
    if (form[campo].df_validar == "cpf_cnpj") {
	  msg = checa_cpf(form[campo].value);
	  if (msg != "") msg = checa_cnpj(form[campo].value);
	}
    if (form[campo].df_validar == "email") msg = checa_email(form[campo].value);
    if (form[campo].df_validar == "numerico") msg = checa_numerico(form[campo].value);
    if (msg != "") {
	  if (form[campo].df_validar == "cpf_cnpj") msg = "informe corretamente o número do CPF ou CNPJ";
	  form[campo].className='campo_alerta'
      form[campo].focus();
      form[campo].select();
      alert(msg);
      return passed;
      stop;
    }
  }
}
passed = true;
return passed;
}
function desabilita_cor(campo) {
campo.className='campos_formulario'
}
function checa_numerico(String) {
var mensagem = "Este campo aceita somente números"
var msg = "";
if (isNaN(String)) msg = mensagem;
return msg;
}
function checa_email(campo) {
var mensagem = "Informe corretamente o email"
var msg = "";
var email = campo.match(/(\w+)@(.+)\.(\w+)$/);
if (email == null){
  msg = mensagem;
  }
return msg;
}
function checa_cpf(CPF) {
var mensagem = "informe corretamente o número do CPF"
var msg = "";
if (CPF.length != 11 || CPF == "00000000000" || CPF == "11111111111" ||
  CPF == "22222222222" ||	CPF == "33333333333" || CPF == "44444444444" ||
  CPF == "55555555555" || CPF == "66666666666" || CPF == "77777777777" ||
  CPF == "88888888888" || CPF == "99999999999")
msg = mensagem;
soma = 0;
for (y=0; y < 9; y ++)
soma += parseInt(CPF.charAt(y)) * (10 - y);
resto = 11 - (soma % 11);
if (resto == 10 || resto == 11)resto = 0;
if (resto != parseInt(CPF.charAt(9)))
  msg = mensagem; soma = 0;
for (y = 0; y < 10; y ++)
  soma += parseInt(CPF.charAt(y)) * (11 - y);
resto = 11 - (soma % 11);
if (resto == 10 || resto == 11) resto = 0;
if (resto != parseInt(CPF.charAt(10)))
  msg = mensagem;
return msg;
}
function checa_cnpj(s) {
var mensagem = "informe corretamente o número do CNPJ"
var msg = "";
var y;
var c = s.substr(0,12);
var dv = s.substr(12,2);
var d1 = 0;
for (y = 0; y < 12; y++)
{
d1 += c.charAt(11-y)*(2+(y % 8));
}
if (d1 == 0) msg = mensagem;
d1 = 11 - (d1 % 11);
if (d1 > 9) d1 = 0;
if (dv.charAt(0) != d1)msg = mensagem;
d1 *= 2;
for (y = 0; y < 12; y++)
{
d1 += c.charAt(11-y)*(2+((y+1) % 8));
}
d1 = 11 - (d1 % 11);
if (d1 > 9) d1 = 0;
if (dv.charAt(1) != d1) msg = mensagem;
return msg;
}
function mascara_data(data){ 
var mydata = ''; 
mydata = mydata + data; 
if (mydata.length == 2){ 
mydata = mydata + '/'; 
} 
if (mydata.length == 5){ 
mydata = mydata + '/'; 
} 
return mydata; 
} 
function verifica_data(data) { 
if (data.value != "") {
dia = (data.value.substring(0,2));
mes = (data.value.substring(3,5)); 
ano = (data.value.substring(6,10)); 
situacao = ""; 
if ((dia < 01)||(dia < 01 || dia > 30) && (  mes == 04 || mes == 06 || mes == 09 || mes == 11 ) || dia > 31) { 
situacao = "falsa"; 
} 
if (mes < 01 || mes > 12 ) { 
situacao = "falsa"; 
}
if (mes == 2 && ( dia < 01 || dia > 29 || ( dia > 28 && (parseInt(ano / 4) != ano / 4)))) { 
situacao = "falsa"; 
} 
if (situacao == "falsa") { 
data.focus();
data.select();
alert("Data inválida!"); 
}
} 
}
//-->
</script>
</HEAD>
<BODY class=texto_pagina>
Links: <a href="<%=pagina_consulta%>" class="texto_pagina">Página de Consulta</a> | <a href="<%=pagina_inclusao%>" class="texto_pagina">Página de Inclusão<hr size=1 color=gainsboro></a><br>

<%
If Not IsEmpty(Request.Form) Then
  Set objCon = Server.CreateObject("ADODB.Connection")
  objCon.Open strCon

  campo_duplicado = false
  campo_msg = ""

  If campo_duplicado = false Then
    Set objRS= Server.CreateObject("ADODB.Recordset")
    objRS.CursorLocation = 3
    objRS.CursorType = 0
    objRS.LockType = 3
    strQ = "SELECT * FROM mny_pessoa Where 1 <> 1"
    objRS.Open strQ, objCon, , , &H0001
    objRS.Addnew()
    If objRS.Fields("pes_codigo").properties("IsAutoIncrement") = False Then
      objRS("pes_codigo") = Trim(Request.Form("pes_codigo"))
    End If
    If objRS.Fields("tip_codigo").properties("IsAutoIncrement") = False Then
      objRS("tip_codigo") = Trim(Request.Form("tip_codigo"))
    End If
    If objRS.Fields("pes_documento").properties("IsAutoIncrement") = False Then
      objRS("pes_documento") = Trim(Request.Form("pes_documento"))
    End If
    If objRS.Fields("pes_razao_social").properties("IsAutoIncrement") = False Then
      objRS("pes_razao_social") = Trim(Request.Form("pes_razao_social"))
    End If
    If objRS.Fields("pes_nome_fantasia").properties("IsAutoIncrement") = False Then
      objRS("pes_nome_fantasia") = Trim(Request.Form("pes_nome_fantasia"))
    End If
    If objRS.Fields("pes_insc_municipal").properties("IsAutoIncrement") = False Then
      objRS("pes_insc_municipal") = Trim(Request.Form("pes_insc_municipal"))
    End If
    If objRS.Fields("pes_insc_estadual").properties("IsAutoIncrement") = False Then
      objRS("pes_insc_estadual") = Trim(Request.Form("pes_insc_estadual"))
    End If
    If objRS.Fields("pes_end_logra").properties("IsAutoIncrement") = False Then
      objRS("pes_end_logra") = Trim(Request.Form("pes_end_logra"))
    End If
    If objRS.Fields("pes_end_uf").properties("IsAutoIncrement") = False Then
      objRS("pes_end_uf") = Trim(Request.Form("pes_end_uf"))
    End If
    If objRS.Fields("pes_end_cidade").properties("IsAutoIncrement") = False Then
      objRS("pes_end_cidade") = Trim(Request.Form("pes_end_cidade"))
    End If
    If objRS.Fields("pes_end_bairro").properties("IsAutoIncrement") = False Then
      objRS("pes_end_bairro") = Trim(Request.Form("pes_end_bairro"))
    End If
    If objRS.Fields("pes_end_cep").properties("IsAutoIncrement") = False Then
      objRS("pes_end_cep") = Trim(Request.Form("pes_end_cep"))
    End If
    If objRS.Fields("pes_contato").properties("IsAutoIncrement") = False Then
      objRS("pes_contato") = Trim(Request.Form("pes_contato"))
    End If
    If objRS.Fields("pes_fones").properties("IsAutoIncrement") = False Then
      objRS("pes_fones") = Trim(Request.Form("pes_fones"))
    End If
    If objRS.Fields("pes_obs").properties("IsAutoIncrement") = False Then
      objRS("pes_obs") = Trim(Request.Form("pes_obs"))
    End If
    If objRS.Fields("pes_email").properties("IsAutoIncrement") = False Then
      objRS("pes_email") = Trim(Request.Form("pes_email"))
    End If
    If objRS.Fields("ccr_codigo").properties("IsAutoIncrement") = False Then
      objRS("ccr_codigo") = Trim(Request.Form("ccr_codigo"))
    End If
    objRS.Update
    objRS.Close
    Set objRS = Nothing
%>

<BR><B>Registro salvo</B><BR>O registro foi cadastrado 
com sucesso.<BR><BR>

<%
  Else
%>

    <BR><B>Atenção!</B><BR><BR>
    O campo <%=campo_msg%> <i>"<%=valor_msg%>"</i> não pode ser salvo, pois já está cadastrado na tabela.
    <BR><A href="javascript:history.go(-1)">Clique aqui</a> para voltar ao cadastro</A><BR><BR>

<%
  End If

  objCon.Close
  Set objCon = Nothing
Else
  Set objCon = Server.CreateObject("ADODB.Connection")
  objCon.Open strCon

  Set objRS= Server.CreateObject("ADODB.Recordset")
  objRS.CursorLocation = 2
  objRS.CursorType = 0
  objRS.LockType = 3
  strQ = "SELECT * FROM mny_pessoa Where 1 <> 1"
  objRS.Open strQ, objCon, , , &H0001
%>

<B>Incluir um novo registro</B><BR>Preencha corretamente 
os dados abaixo:<BR>
<form name="form_incluir" method="post" action="<%=Request.ServerVariables("SCRIPT_NAME")%>" onsubmit="return verifica_form(this);">
<TABLE border=0 cellpadding=2 cellspacing=1 class=tabela_formulario>
  <TR class=titulo_campos><TD>Codigo:<br>
<%If objRS.Fields("pes_codigo").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=350" type="text" name="pes_codigo" maxlength="255" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Tipo:<BR>
    <SELECT style="width=350" name="tip_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
      <OPTION value=""></OPTION>

<%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1
  strQ = "SELECT tip_codigo FROM mny_tipo_pessoa ORDER BY tip_codigo ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("tip_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("tip_codigo").Value) & "'>" & (objRS2.Fields.Item("tip_codigo").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>

    </SELECT>
  </TD></TR>
  <TR class=titulo_campos><TD>CPF/CNPJ:<br>
<%If objRS.Fields("pes_documento").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=150" type="text" name="pes_documento" maxlength="20" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" df_validar="cpf_cnpj" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Razão:<br>
<%If objRS.Fields("pes_razao_social").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=350" type="text" name="pes_razao_social" maxlength="255" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Nome:<br>
<%If objRS.Fields("pes_nome_fantasia").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=350" type="text" name="pes_nome_fantasia" maxlength="255" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Insc. Municipal:<br>
<%If objRS.Fields("pes_insc_municipal").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=150" type="text" name="pes_insc_municipal" maxlength="20" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Insc.Estadual:<br>
<%If objRS.Fields("pes_insc_estadual").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=150" type="text" name="pes_insc_estadual" maxlength="20" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Endereço:<br>
<%If objRS.Fields("pes_end_logra").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=350" type="text" name="pes_end_logra" maxlength="255" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>UF:<br>
<%If objRS.Fields("pes_end_uf").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=100" type="text" name="pes_end_uf" maxlength="2" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Cidade:<br>
<%If objRS.Fields("pes_end_cidade").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=150" type="text" name="pes_end_cidade" maxlength="255" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Bairro:<br>
<%If objRS.Fields("pes_end_bairro").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=150" type="text" name="pes_end_bairro" maxlength="255" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>CEP:<br>
<%If objRS.Fields("pes_end_cep").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=100" type="text" name="pes_end_cep" maxlength="12" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Contato:<br>
<%If objRS.Fields("pes_contato").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=350" type="text" name="pes_contato" maxlength="255" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Fone:<br>
<%If objRS.Fields("pes_fones").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=350" type="text" name="pes_fones" maxlength="255" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Obs:<br>
<%If objRS.Fields("pes_obs").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=350" type="text" name="pes_obs" maxlength="255" value="" onKeyPress="desabilita_cor(this)"  df_verificar="sim" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Email:<br>
<%If objRS.Fields("pes_email").properties("IsAutoIncrement") = False Then%>
<INPUT style="width=350" type="text" name="pes_email" maxlength="255" value="" onKeyPress="desabilita_cor(this)" df_validar="email" class=campos_formulario>
<%
Else
  Response.Write "<B>(Automático)</B>"
End If
%>
  </TD></TR>
  <TR class=titulo_campos><TD>Conta Corrente:<BR>
    <SELECT style="width=350" name="ccr_codigo" df_verificar="sim" onChange="desabilita_cor(this)" class=campos_formulario>
      <OPTION value=""></OPTION>

<%
  Set objRS2 = Server.CreateObject("ADODB.Recordset")
  objRS2.CursorLocation = 3
  objRS2.CursorType = 3
  objRS2.LockType = 1
  strQ = "SELECT ccr_codigo FROM mny_conta_corrente ORDER BY ccr_codigo ASC"
  objRS2.Open strQ, objCon, , , &H0001
  If Not objRS2.EOF Then
    While Not objRS2.EOF
	  If Trim(objRS2.Fields.Item("ccr_codigo").Value) <> "" Then
	    Response.Write "      <OPTION value='" & (objRS2.Fields.Item("ccr_codigo").Value) & "'>" & (objRS2.Fields.Item("ccr_codigo").Value) & "</OPTION>"
	  End If
      objRS2.MoveNext
    Wend
  End If
  Response.Write("ok")
%>

    </SELECT>
  </TD></TR>
</TABLE>
<input type="submit" name="submit" value="Enviar" class=botao_enviar>
</form>

<%
  objCon.Close
  Set objCon = Nothing
End If
%>

</BODY>
</HTML>

<%
Else
  Response.Write "<B>Acesso negado...</B> somente o administrador do site tem acesso a esta página."
  Response.Write "<BR><a href=""" & pagina_login & """ class=""texto_pagina"">Clique aqui</a> para efetuar login no sitema"
End If
%>
