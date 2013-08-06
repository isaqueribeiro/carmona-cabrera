<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<html >
<head>
<link href="css/estiloSis.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Mensagem</title>
</head>

<body>
<div align="center"><img src="imagens/184.jpg" alt="" width="48" height="48"><br>
</div>
<table width="500" border="0" align="center" cellpadding="0" cellspacing="0" class="Borda_tabela">
  <tr>
    <td height="33" bgcolor="#CCCCCC"><div align="center" class="texto_pagina"><strong><%=session("sTitMen")%></strong></div>      <div align="center"></div></td>
  </tr>
  <tr>
    <td height="34"><div align="center" class="texto_pagina"><strong><%=session("sMen")%></strong></div></td>
  </tr>
  <tr>
    <td height="34"><div align="center">
      <input type="button" name="Button" value="Voltar" class="botao_enviar" onClick="history.go(-1)">
    </div></td>
  </tr>
</table>
</body>
</html>
