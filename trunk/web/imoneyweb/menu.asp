<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="author" content="Wagner B. Soares" />
<title>Menu</title>
<style type="text/css">
body
{
	font-size: 11px;
	font-family: Verdana, Arial, Helvetica, Garamond, sans-serif, serif;
	background-color: #EAEAEA;
}

div.menu
{
	width: 200px;
	border: 1px solid #000000;
	background-image:url(back.gif);
	background-repeat:repeat-x;
}

div.menu a
{
	display: block;
	padding-left: 5px;
	line-height: 25px;
	color: #000000;
	text-decoration: none;
	outline: none;
}

* html div.menu a { height: 1%; }

div.menu a:hover
{

    color: #FFFFFF;
	background-image:url(icones/back2.gif);
	background-repeat:repeat-x;
	
}

ul.corpo
{
	margin: 0px;
	padding: 0px;
	width: 200px;
}

ul.corpo li
{
	display: block;
	margin: 0px;
	padding: 0px;
	list-style: none;
}

span.imagem
{	
	display: block;
	width: 198px;
	position : absolute;
	text-align: right;
}

span.imagem img
{
	padding: 3px 2px;
	cursor: pointer;
}

span.header
{
	z-index:1;
	display: block;
	margin: 0px;
	padding: 0px;
	padding-left: 5px;
	line-height: 22px;
	color: #FFFFFF;
	font-weight: bold;
	
}

</style>
<script type="text/javascript">
up_down = function(img,body)
{
		if(img.src.indexOf("up") > -1)
		{
			img.src="menu/arrow_down.gif";
			document.getElementById(body).style.display = "none";
		}
		else
		{
			img.src="menu/arrow_up.gif";
			document.getElementById(body).style.display = "block";
		}
};
</script>
</head>
<body>
	<div id="menu0" class="menu">
		<span class="imagem"><img src="menu/arrow_down.gif" onclick="up_down(this,'menuBody0');" alt="" title="" /></span>
		<span class="header">Inicio</span>
		<ul id="menuBody0" class="corpo">
			<li><a href="pg_home.asp" target="principal"><img src="icones/ic_home.gif" width="16" height="16" border="0" /> Home</a></li>
		  <li><a href="pg_logout.asp" target="_parent"><img src="icones/exitl.gif" width="16" height="16" border="0" /> Sair</a></li>
	  </ul>
</div>
<br />
	<div id="menu1" class="menu">
		<span class="imagem"><img src="menu/arrow_up.gif" onclick="up_down(this,'menuBody1');" alt="" title="" /></span>
		<span class="header">Cadastro</span>
		<ul id="menuBody1" class="corpo">
			<li><a href="pg_consultaAceite.asp" target="principal" ><img src="icones/ic_doc1.gif" width="16" height="16" border="0" /> Lan&ccedil;amentos</a></li>
          <li><a href="pg_consultaPes2.asp" target="principal"><img src="icones/icn_moradores.gif" width="16" height="16" border="0" /> Pessoas</a></li>
          <li><a href="pg_consultaCtaBancaria.asp" target="principal"><img src="icones/icn_not.JPG" width="16" height="16" border="0" /> Contas Banc&aacute;rias</a></li>
      </ul>
</div>
<br />
	<div id="menu2" class="menu">
		<span class="imagem"><img src="menu/arrow_up.gif" onclick="up_down(this,'menuBody2');" alt="" title="" /></span>
		<span class="header">Gerência</span>
		<ul id="menuBody2" class="corpo">
          <li><a href="pg_consultaProgramacaoPagto.asp" target="principal"><img src="icones/icn_not.JPG" width="16" height="16" border="0" /> Programação de Pagtos.</a></li>
      </ul>
</div>

<br />
<br />
	
</body>
</html>