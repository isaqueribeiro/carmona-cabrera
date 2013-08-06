<% 

' Variáveis com os valores de sua base de dados. 
if ( session("bco") = 1 ) then 
	' Produção
	strDataSoure = "dbmy0035.whservidor.com" 'colocar a localização de sua base de dados,preferenciamente o dominio, tipo dbmy0002.whservidor.com
	strDataBase = "tkce" 'Colocar o nome da base 
	strUser = "tkce"     'Colocar nome do usuário 
	strPWD = "450021afg" 'Colocar a senha '
elseif ( session("bco") = 2 ) then 
	' Desenvolvimento
	' Variáveis com os valores de sua base de dados. 
	strDataSoure = "dbmy0102.whservidor.com" 'colocar a localização de sua base de dados,preferenciamente o dominio, tipo dbmy0002.whservidor.com
	strDataBase = "tkce_1" ' Colocar o nome da base 
	strUser = "tkce_1"     ' Colocar nome do usuário 
	strPWD = "450021afg"   ' Colocar a senha 
elseif ( session("bco") = 3 ) then 
	' Local
	' Variáveis com os valores de sua base de dados. 
	strDataSoure = "localhost" 'colocar a localização de sua base de dados,preferenciamente o dominio, tipo dbmy0002.whservidor.com
	strDataBase = "tkce" ' Colocar o nome da base 
	strUser = "root"     ' Colocar nome do usuário 
	strPWD = "admin"     ' Colocar a senha 
end if

' Definir String de conexao para base MySQL
strConexao = "Driver=MySQL ODBC 5.1 Driver;SERVER=" & strDataSoure 
strConexao = strConexao & "; DATABASE=" & strDataBase 
strConexao = strConexao & ";Uid="& strUser 
strConexao = strConexao & ";Pwd="& strPWD 
  
session("conexao") = strConexao
set Conexao = Server.CreateObject("ADODB.Connection")
Conexao.ConnectionString = session("conexao")
Conexao.Open session("conexao")
	
%>
