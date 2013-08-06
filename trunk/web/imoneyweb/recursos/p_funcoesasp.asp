
<!--#include file="p_conexaobanco.asp" -->

<%
Function NovoReg(f_tabela , f_campo  )
  Dim RsMax 
  Set RsMax = conexao.execute("Select max(" & f_campo & ") as maior  from " & f_tabela & "")

  If IsNull(RsMax("maior")) Then
    NovoReg = 1
  Else
    NovoReg = cdbl(RsMax("maior")) + cdbl(1)
  End If
End function



Function BuscaNome (f_tipo,f_id)

	select case f_tipo

		case "M"

			s_Sql = "select nmmedico as nome from tbmedico where idmedico = " & f_id

		case "P"

			s_Sql = "select nmpaci as nome  from tbpaciente where idpaci = " & f_id

		case "C"

			s_Sql = "select nmconvenio as nome  from tbconvenio where idconvenio = " & f_id

		case "U"

			s_Sql = "select nmusu as nome  from tbusuario where idusu = " & f_id

		case "E"

				s_Sql = "select NMEMPRESA as nome  from tbempresa where IDEMPRESA = " & f_id

	end select

		Set RsNome = conexao.execute(s_Sql)

		if not rsnome.eof then 

			BuscaNome = rsnome("Nome")

		else

			BuscaNome =""

		end if



End function



Function BuscaDados(f_tabela, f_campo, f_where)
  s_Sql = "select " & f_campo & " as campo1  from " & f_tabela & f_where
  'response.Write(s_Sql)

  Set RsFuncao = conexao.execute(s_Sql)
  if not RsFuncao.eof then 
	BuscaDados = RsFuncao("Campo1")
  else
    BuscaDados =""
  end if
End function


Function PodeIncluir(f_tabela, F_campo, f_valorAchecar)
	Set RsCheca = conexao.execute("select *  from " & f_tabela & " where " & f_campo & " = " & f_valorAchecar)

	if rscheca.eof then 

		PodeIncluir	= true

	else

		PodeIncluir	= false

	end if
end function

Function ValidaInclusao(f_tabela,f_where)
	Set RsCheca = conexao.execute("select *  from " & f_tabela &  f_where)

	if rscheca.eof then 

		ValidaInclusao	= true

	else

		ValidaInclusao	= false

	end if
end function

Function ValidaExclusao(f_tabela,f_valorAchecar)
	Set RsCheca = conexao.execute("select *  from " & f_tabela & " where " & f_valorAchecar )

	if rscheca.eof then 

		ValidaExclusao	= true

	else

		ValidaExclusao	= false

	end if

	

	

end function



Function ValidaNomeLogin(f_tabela,F_campo,f_valorAchecar)



	Set RsCheca = conexao.execute("select *  from " & f_tabela & " where UCASE(" & f_campo & ") = '" & f_valorAchecar & "'")

	if rscheca.eof then 

		ValidaNomeLogin	= true

	else

		ValidaNomeLogin	= false

	end if

	

	

end function

Function UltDia(Mes )

    Dim PriDia

    PriDia = DateAdd("m", 1, "01/" & Mes)

    UltDia = DateAdd("d", -1, PriDia)

End Function	



'#####################################################################

'Retorna a data por extenso a partir do seu correspondente numérico.

function retornaDataExtenso(Data)

	retornaDataExtenso=CompletaZero(day(data),2) & " de " & retornaMesExtenso(month(data)) & " de " & year(data)

end function


	Public Function RetornaMesExtenso (mes) 

	 Select Case mes 

		 Case 1 

		 RetornaMesExtenso = "janeiro" 

		 Case 2 

		 RetornaMesExtenso = "fevereiro" 

		 Case 3 

		 RetornaMesExtenso = "março" 

		 Case 4 

		 RetornaMesExtenso = "abril" 

		 Case 5 

		 RetornaMesExtenso = "maio" 

		 Case 6 

		 RetornaMesExtenso = "junho" 

		 Case 7 

		 RetornaMesExtenso = "julho" 

		 Case 8 

		 RetornaMesExtenso = "agosto" 

		 Case 9 

		 RetornaMesExtenso = "setembro" 

		 Case 10 

		 RetornaMesExtenso = "outubro" 

		 Case 11  

		 RetornaMesExtenso = "novembro" 

		 Case 12 

		 RetornaMesExtenso = "dezembro" 

	 End Select 

	End Function






FUNCTION VERIFICA_SE_DATA_ESTA_LIBERADA(fS_Data)

	fS_Data = month(fS_Data) & "/" & year(fS_Data)

	s_Sql= " select * from TBFECHAMENTOCONTAS where SREF='" & fS_Data & "'"

	set RsData = Conexao.execute(s_Sql)

	if rsData.eof then 

		VERIFICA_SE_DATA_ESTA_LIBERADA=true

	else

		VERIFICA_SE_DATA_ESTA_LIBERADA=false

	end if

	



END FUNCTION





Function EnviaEmail2 (fS_Mensagem,fS_NmEmailDest,fS_NomeDest,fS_Titulo)

		Set Mailer = Server.CreateObject("Persits.MailSender") 

		Mailer.FromName = "Delicias do Pão"                               				'Nome do Remetente

		Mailer.From = "deliciasdopao@deliciasdopao.com.br"							'Endereço do Remetente

		Mailer.Host = "smtp.deliciasdopao.com.br"	 

		Mailer.ishtml=true

		Mailer.AddAddress  fS_NmEmailDest, fS_NomeDest 	'Endereço, Nome do Destinatário

		Mailer.Subject =  fS_Titulo      		'Assunto do E-mail 

		Mailer.Body = fS_Mensagem 

		Mailer.Username = "pagseguro@deliciasdopao.com.br" 

		Mailer.Password = "del123"

		

									'Corpo da Mensagem (Possível em HTML)

		'On Error Resume Next

		Mailer.Send			

end function



Function EnviaEmail3 (fS_Destinatario,fS_Titulo,fS_CorpotEMail)

	

			Set Mailer = Server.CreateObject("Persits.MailSender") 

			Mailer.FromName = "Delicias do Pao"

			Mailer.From = "pagseguro@deliciasdopao.com.br"                'Endereço do Remetente

			Mailer.Host = "smtp.deliciasdopao.com.br"

			Mailer.Username = "pagseguro@deliciasdopao.com.br" 

			Mailer.Password = "del123"

			Mailer.AddAddress  fS_Destinatario,fS_Destinatario '"atendimento@sigveiculos.com.br", "atendimento@sigveiculos.com.br" 	'Endereço, Nome do Destinatário

			Mailer.Subject =  fS_Titulo      		'Assunto do E-mail

			mailer.ishtml=true

			Mailer.Body = fS_CorpotEMail				'Corpo da Mensagem (Possível em HTML)

			On Error Resume Next

			Mailer.Send 			

			

			If Err <> 0 Then 

				Response.Write "Ocorreu o seguinte erro: " & Err.Description  & "-" & fS_Destinatario & "<br>"

				'Response.Write (err.number & "<br>")

				if left( Err.Description,3)="450" or left( Err.Description,3)="501" then 

					CONEXAO.EXECUTE("DELETE * FROM tbemail where NMEMAIL='" & fS_Destinatario & "'")

				end if

			else

				response.Write("Sua mensagem foi enviada com sucesso para o email" & fS_Destinatario & "<br>")

				conexao.execute("update tbemail set FLRECEBE=2 where NMEMAIL='" & fS_Destinatario & "'")

			End If

	

	

End function









FUNCTION VERIFICA_SE_REF_ESTA_LIBERADA(fS_Data)

	'fS_Data 'MM/AAAA

	s_Sql= " select * from TBFECHAMENTOCONTAS where SREF='" & fS_Data & "'"

	set Rs = Conexao.execute(s_Sql)

	if rs.eof then 

		VERIFICA_SE_REF_ESTA_LIBERADA=true

	else

		VERIFICA_SE_REF_ESTA_LIBERADA=false

	end if

	



END FUNCTION

FUNCTION ENVIAEMAIL (fS_NomeRemetente,fS_EmailRemetente,fS_Assunto,fS_Mensagem,fS_TituloEmail,fS_Destinatario)



Set eObjMail = Server.CreateObject("SMTPsvg.Mailer")

eObjMail.FromName =fS_NomeRemetente

eObjMail.FromAddress = fS_EmailRemetente

eObjMail.RemoteHost = "mail.deliciasdopao.com.br"

'eObjMail.AddRecipient "CONTATOS", "contatos@thiagoliborio.com.br"

eObjMail.AddRecipient fS_TituloEmail, fS_Destinatario

eObjMail.Subject = fS_Assunto

eObjMail.ContentType = "text/html"

eObjMail.BodyText = fS_Mensagem

eObjMail.SendMail

Set eObjMail = nothing





END FUNCTION



Function IsEmail(strEmail)

Set regEx = New RegExp ' Cria o Objeto Expressão

regEx.IgnoreCase = True ' Sensitivo ou não

regEx.Global = True ' Não sei exatamente o que faz



'Caracteres Excluidos

regEx.Pattern = "[^@\-\.\w]|^[_@\.\-]|[\._\-]{2}|[@\.]{2}|(@)[^@]*\1"

ResultadoHum = RegEx.Test(strEmail)

'Caracteres validos

regEx.Pattern = "@[\w\-]+\."

ResultadoDois = RegEx.Test(strEmail)

'Caracteres de fim

regEx.Pattern = "\.[a-zA-Z]{2,3}$"

ResultadoTres = RegEx.Test(strEmail)

Set regEx = Nothing



If Not (ResultadoHum) And ResultadoDois And ResultadoTres Then

IsEmail = True

Else

IsEmail = False

End If



End Function




Function Validar_EMail(EMail)

Dim Con

If EMail = "" Then

    Validar_EMail = 0

    Exit Function

End If

EMail = LCase(EMail)

If (Left(EMail, 1) = "." Or Left(EMail, 1) = "@") Then

    Validar_EMail = 1

    Exit Function

End If

If (Right(EMail, 1) = "." Or Right(EMail, 1) = "_" Or _

    Right(EMail, 1) = "@") Then

    Validar_EMail = 1

    Exit Function

End If

Con = 0

For i = 1 To Len(EMail)

    If (Mid(EMail, i, 1)) = "@" Then

       Con = Con + 1

    End If

Next

If Con > 1 Or Con = 0 Then

    Validar_EMail = 1

    Exit Function

End If

Con = 0

For i = 1 To Len(EMail)

    If (Mid(EMail, i, 1)) = "@" Then

       For j = i To Len(EMail)

          If (Mid(EMail, j, 1)) = "." Then

             Con = Con + 1

          End If

       Next

    End If

Next

If Con < 1 Then

    Validar_EMail = 1

    Exit Function

End If

Con = 0

For i = 1 To Len(EMail)

    If (Mid(EMail, i, 1) = ".") Or (Mid(EMail, i, 1) = "@") Then

       If (Mid(EMail, i + 1, 1) = ".") Or (Mid(EMail, i + 1, 1) = "@") Then

          Validar_EMail = 1

          Exit Function

       End If

    End If

Next

For i = 1 To Len(EMail)

    If (Mid(EMail, i, 1) < "a" Or Mid(EMail, i, 1) > "z") And _

       (Mid(EMail, i, 1) < "0" Or Mid(EMail, i, 1) > "9") And _

       Mid(EMail, i, 1) <> "." And Mid(EMail, i, 1) <> "_" And _

       Mid(EMail, i, 1) <> "@" and Mid(EMail, i, 1) <> "-" Then



			  Validar_EMail = 1



		  Exit Function

    End If

Next

Validar_EMail = 2

End Function


Function TrataString(sTexto)
	
	sTexto = trim(UCASE(sTexto))
	sTexto = replace(sTexto,"'","`")
	sTexto = replace(sTexto,";","")
	sTexto = replace(sTexto,"(","")
	sTexto = replace(sTexto,")","")
	sTexto = replace(sTexto,"--","")
	sTexto = replace(sTexto,"*","")
	sTexto = replace(sTexto,"""","")
	sTexto = replace(sTexto,"UNION","")     :sTexto = replace(sTexto,"FROM","")  	:sTexto = replace(sTexto,"ALL","")
	sTexto = replace(sTexto,"TABLE","")     :sTexto = replace(sTexto,"SELECT","")	:sTexto = replace(sTexto,"UPDATE","")
	sTexto = replace(sTexto,"INSERT","")    :sTexto = replace(sTexto,"DROP","")  	:sTexto = replace(sTexto,"ALTER","")
	sTexto = replace(sTexto,"CREATE","")    :sTexto = replace(sTexto,"WHERE","") 	:sTexto = replace(sTexto,"LEFT","")
	sTexto = replace(sTexto,"NOT","")       :sTexto = replace(sTexto,"LIKE","")  	:sTexto = replace(sTexto,"DROP","")
	sTexto = replace(sTexto,"ALTER","")     :sTexto = replace(sTexto,"JOIN","")  	:sTexto = replace(sTexto,"INNER","")	
	sTexto = replace(sTexto,"HAVING","")    :sTexto = replace(sTexto,"IN ","")   	:sTexto = replace(sTexto,"TRUNCATE","")
	sTexto = replace(sTexto,"ALTER","")     :sTexto = replace(sTexto,"JOIN","")  	:sTexto = replace(sTexto,"INNER","")
	sTexto = replace(sTexto,"DELIMITER","") :sTexto = replace(sTexto,"ORDER","") 	:sTexto = replace(sTexto,"GROUP","")			
	sTexto = replace(sTexto," AND","")      :sTexto = replace(sTexto,"AND ","")     :sTexto = replace(sTexto," OR","")				
	sTexto = replace(sTexto,"'OR'1'='1'",""):sTexto = replace(sTexto,"'OR '1=1'",""):sTexto = replace(sTexto,"OR '1=1'","")				
	sTexto = replace(sTexto,"OR '1 = 1'","")
	TrataString=sTexto
	
	
End function



Function FormataNumero(sNumero,sTamanho)
	
	if len(sNumero)<cdbl(sTamanho) then 
		for i=1 to cdbl(sTamanho)
			sComp = sComp & "0"
		next
	end if
	FormataNumero = sComp & sNumero
End function

Function CancelarRegistro(sOperacao,sPaginaSim,sPaginaNao)
	session("opExclusao")=sOperacao
	session("pgnao")=sPaginaNao
	session("pgsim")=sPaginaSim
	response.Redirect("pg_cancelaRegistro.asp")						
	
end function


Sub Mensagem (sTitulo,sMensagem)
	
	session("sTitMen")=sTitulo
	session("sMen")=sMensagem
	response.Redirect("./pg_Mensagem.asp")

end sub

Function FormataData(sValorData,sTipoFormatacao)
	if len(day(sValorData)) < 2   then sDia="0" & day(sValorData) else sDia = day(sValorData)
	if len(month(sValorData)) < 2 then sMes="0" & month(sValorData) else sMes = month(sValorData)
	sAno = year(sValorData)	

	select case sTipoFormatacao
		case "dd/mm/yyyy"
			FormataData = sDia & "/" & sMes & "/" & sAno
		case "mm/dd/yyyy"
			FormataData = sMes & "/" & sDia & "/" & sAno
		case "yyyy/mm/dd"
			FormataData = sAno & "/" & sMes & "/" & sDia
	end select
	
End Function

Function MsgBox1 (sMensagem)
	response.Write("<script language='JavaScript'>alert('" & sMensagem &"');</script>")
	
end Function


%>