<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cabeçalho</title>
<style type="text/css">
<!--
body {
	background-image: url(imagens/fdocabecalho3.jpg);
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	color: #333333;
	font-weight: bold;
}
.style11 {color: #000000}
.style12 {font-size: 10px; font-weight: bold; font-family: Arial, Helvetica, sans-serif;}
.style14 {
	font-size: 12px;
	font-weight: bold;
	font-family: Arial, Helvetica, sans-serif;
	color: #000000;
}
.style16 {
	font-size: 17px;
	color: #FFFFFF;
}
.style18 {
	font-size: 10px;
	color: #000000;
}
-->
</style></head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="22%"><table width="224" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="224" height="50" valign="top" background="imagens/imgtopo3.jpg">
        <table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr height="10">
            <td height="8"></td>
          </tr>
          <tr>
            <td><span class="style1"><span class="style16">&nbsp;iMoney - Web</span><br />
                <span class="style18">&nbsp;&nbsp;&nbsp;Versão:1.0.1</span></span></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
    <td width="1%"><div align="center">|</div></td>
    <td width="51%"><span class="style14"><%=session("gS_NmEmpresa") & " &nbsp;&nbsp; CNPJ:" & session("gS_NrCnpj")%></span><br />
    <%
	  if ( session("bco")= "1" ) then 
	    response.Write("<span class='style18'>Banco: Produção</span>") 
	  elseif ( session("bco")= "2" ) then
	    response.Write("<span class='style18'>Banco: Desenvolvimento</span>") 
	  elseif ( session("bco")= "3" ) then
	    response.Write("<span class='style18'>Banco: Local (Desenvolvimento)</span>")
	  end if	
	%></td>
    <td width="26%"><table width="100%" border="0" cellspacing="0" cellpadding="0"> 
      <tr>
        <td width="31%"><div align="right" class="style11"><span class="style12">Usuário:</span></div></td>
        <td width="69%"  class="style12"><%=session("gS_nmUsu")%></td>
      </tr>
      <tr>
        <td><div align="right" class="style11"><span class="style12">Data:</span></div></td>
        <td  class="style12"><%=now%></td>
      </tr>
    </table></td>
  </tr>
</table>



</body>
</html>
