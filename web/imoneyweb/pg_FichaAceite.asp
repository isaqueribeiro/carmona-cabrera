<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="recursos/p_conexaobanco.asp" -->
<!--#include file="recursos/p_verificaLogin.asp" -->
<!--#include file="recursos/p_funcoesasp.asp" -->


<%
sIdMov     = request.QueryString("idlan")
sIdMovItem = request.QueryString("idItem")

if not isnumeric(sIdMov) or not isnumeric(sIdMovItem) then 
	Mensagem "Dados inválidos" ,"Selecione um registro válido para visualizar a Ficha de Aceite!"
end if



sComplemento =  " and mny_movimento.mov_codigo=" & sIdMov & " and mov_item=" & sIdMovItem

strQ = "SELECT mny_movimento.*,cta.con_nome as conta,setor.set_nome,cc.cen_nome as centro_custo,uni_nome,TC.cus_nome,neg_nome,com_nome,pes_documento,fpg_nome,ta.tip_nome as tip_nome_aceite, d.tip_nome,mov_data_vencto,mov_valor_pagar,mov_item,ta.tip_nome as aceite,pes_nome_fantasia as fantasia,pes_razao_social,SI.sit_nome as sitItem ,mov_data_prev,"
strQ = strQ  & " mov_juros,mov_desconto,mov_retencao,mov_valor,mny_movimento_item.mov_parcela "
strQ = strQ  & " FROM mny_movimento ,mny_movimento_item , "
strQ = strQ  & " mny_tipo_aceite ta, "
strQ = strQ  & " mny_pessoa , "
strQ = strQ  & " sys_competencia c, "
strQ = strQ  & " sys_situacao SM, "
strQ = strQ  & " mny_custo TC, "
strQ = strQ  & " mny_centro_negocio CN, "
strQ = strQ  & " mny_unidade UN, "
strQ = strQ  & " mny_centro_custo cc, "
strQ = strQ  & " mny_conta cta, "
strQ = strQ  & " mny_setor setor, "
strQ = strQ  & " mny_forma_pagto f, "
strQ = strQ  & " mny_tipo_documento d, "
strQ = strQ  & " sys_situacao SI "
strQ = strQ  & " where mny_movimento_item.fpg_codigo = f.fpg_codigo and mny_movimento_item.tip_doc_codigo= d.tip_codigo and mny_movimento_item.mov_status=SI.sit_codigo"
strQ = strQ  & " and mny_movimento.mov_codigo=mny_movimento_item.mov_codigo"
strQ = strQ  & " and mny_movimento.tip_ace_codigo=ta.tip_codigo"
strQ = strQ  & " and mny_movimento.pes_codigo =mny_pessoa.pes_codigo"
strQ = strQ  & " and mny_movimento.com_codigo =c.com_codigo"
strQ = strQ  & " and mny_movimento.sit_codigo =SM.sit_codigo"
strQ = strQ  & " and mny_movimento.cus_codigo =TC.cus_codigo"
strQ = strQ  & " and mny_movimento.neg_codigo =CN.neg_codigo"
strQ = strQ  & " and mny_movimento.uni_codigo =UN.uni_codigo"
strQ = strQ  & " and mny_movimento.cen_codigo=cc.cen_codigo"
strQ = strQ  & " and mny_movimento.con_codigo=cta.con_codigo"
strQ = strQ  & " and mny_movimento.set_codigo=setor.set_codigo"
strQ = strQ  & " and mny_movimento.set_codigo=setor.set_codigo" & sComplemento

Set rsDados = conexao.execute(strQ)
if not rsDados.eof then
	'--QUADRO 1
	sTipNomeAceite= rsDados("tip_nome_aceite"):	sdtEmssisao   = rsDados("mov_data_emissao"):sdtInclusao=rsDados("mov_data_inclusao"): sNmFornecedor = rsDados("fantasia")
	sCPFCNPJ      = rsDados("pes_documento")  :	sTipoDoc      = rsDados("tip_nome") :	sParcelaPlano = rsDados("mov_parcela")  & "/" & rsDados("mov_parcelas")
	sNrDoc        = rsDados("mov_documento") & "." & rsDados("mov_item") :	sFichaAceite  = rsDados("mov_codigo") & "." & rsDados("mov_item") 
	sNrContrato   = rsDados("mov_contrato") :	sNmFormapag   = rsDados("fpg_nome"):	sDtVencto     = rsDados("mov_data_vencto")
	sDtProrrog    = rsDados("mov_data_prev"):	sCompet       = rsDados("com_nome") 
	
	'--QUADRO 2
	sValor    = cdbl(rsDados("mov_valor")) : sValJuros = cdbl(rsDados("mov_juros")) : sValDesconto = cdbl(rsDados("mov_desconto"))
	sMovRet   = cdbl(rsDados("mov_retencao")): sValMovOutros = 0: sValDev=0
	sValTotBruto = sValor + sValJuros
	sValTotDesc  = sValDesconto
	sValLiquido  =  cdbl(sValTotBruto) - cdbl(sValTotDesc)
	sValPago     =  cdbl(sValTotBruto) - cdbl(sValTotDesc)
	
	sValor = formatnumber(sValor,2):sValJuros = formatnumber(sValJuros,2):sValDesconto = formatnumber(sValDesconto,2)
	sMovRet = formatnumber(sMovRet,2):sValMovOutros = formatnumber(sValMovOutros,2):sValDev = formatnumber(sValDev,2)
	sValTotBruto = formatnumber(sValTotBruto,2):sValTotDesc = formatnumber(sValTotDesc,2):sValLiquido = formatnumber(sValLiquido,2)
	sValPago = formatnumber(sValPago,2)
	
	'--QUADRO 3
	sNmSolicitante = mid(rsDados("MOV_INC"),19,len(rsDados("MOV_INC")))
	sDtSolicitacao = left(rsDados("MOV_INC"),10)
	'---APROPRIAÇÃO
	'cta_con_nome as conta,setor.set_nome,cc.cen_nome as centro_custo,uni_nome	
	sTipoCusto = rsDados("cus_nome")
	sCentroNeg = rsDados("neg_nome")
	sUndNegocio= rsDados("uni_nome")
	sCentroCus = rsDados("centro_custo")
	sSetor     = rsDados("set_nome")
	sConta     = rsDados("conta") 
	
end if

%>



<html >
<head>
<link href="css/estiloSis.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

<title>FICHA DE ACEITE</title>
</head>

<body>
<div align="center"><span class="titulo_pagina">FICHA DE ACEITE</span></div>
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="53"><table width="750" border="0" align="center" cellpadding="0" cellspacing="0" class="Borda_tabela">
      <tr>
        <td width="290" height="43"><img src="imagens/Cabreira.png" width="287" height="54"></td>
        <td width="160" class="titulo_pagina"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ACEITE</div></td>
        <td width="209"><div align="center" class="texto_pagina"><strong><%=sTipNomeAceite%></strong></div></td>
        <td width="89" class="texto_pagina">Revis&atilde;o:</td>
      </tr>
    </table>      </td>
  </tr>
  <tr>
    <td valign="top"><table width="750" border="0" align="center" cellpadding="0" cellspacing="0" class="Borda_tabela">
      <tr>
        <td width="343" height="167" valign="top"><table width="339" border="0" cellpadding="3" cellspacing="1" class="texto_pagina">
            <tr>
              <td width="96" class="texto_pagina_11">DT.EMISS&Atilde;O:</td>
              <td width="70" bgcolor="#E9E9E9" class="texto_pagina_11">&nbsp;<%=sdtEmssisao%></td>
              <td width="74" class="texto_pagina_11">DT.INCLUS&Atilde;O:</td>
              <td width="70" bgcolor="#E9E9E9" class="texto_pagina_11"><%=sdtInclusao%></td>
            </tr>
            <tr>
              <td class="texto_pagina_11">FORNECEDOR:</td>
              <td colspan="3" bgcolor="#E9E9E9" class="texto_pagina_11">&nbsp;<%=sNmFornecedor%></td>
            </tr>
            <tr>
              <td class="texto_pagina_11">CNPJ/CPF:</td>
              <td colspan="3" bgcolor="#E9E9E9" class="texto_pagina_11">&nbsp;<%=sCPFCNPJ%></td>
            </tr>
            <tr>
              <td class="texto_pagina_11">TIPO DOC.:</td>
              <td colspan="3" bgcolor="#E9E9E9" class="texto_pagina_11">&nbsp;<%=sTipoDoc%></td>
            </tr>
            <tr>
              <td class="texto_pagina_11">PARCELA:</td>
              <td colspan="3" bgcolor="#E9E9E9" class="texto_pagina_11">&nbsp;<%=sParcelaPlano%></td>
            </tr>
            <tr>
              <td class="texto_pagina_11">NR. DOC.:</td>
              <td colspan="3" bgcolor="#E9E9E9" class="texto_pagina_11"><strong>&nbsp;<%=sNrDoc%></strong></td>
            </tr>
            <tr>
              <td class="texto_pagina_11">FICHA ACEITE:</td>
              <td colspan="3" class="texto_pagina_11"><strong>&nbsp;<%=sFichaAceite%></strong></td>
            </tr>
        </table></td>
        <td width="2" class="Borda_esquerda">&nbsp;</td>
        <td width="351" valign="top"><table width="371" border="0" cellpadding="1" cellspacing="1" class="texto_pagina">
            <tr>
              <td width="91" class="texto_pagina_11">CONTRATO:</td>
              <td width="273" bgcolor="#E9E9E9" class="texto_pagina_11">&nbsp;<%=sNrContrato%></td>
            </tr>
            <tr>
              <td class="texto_pagina_11">FORMA PGTO.:</td>
              <td bgcolor="#E9E9E9" class="texto_pagina_11">&nbsp;<%=sNmFormapag%></td>
            </tr>
            <tr>
              <td class="texto_pagina_11">VENCTO:</td>
              <td bgcolor="#E9E9E9" class="texto_pagina_11">&nbsp;<%=sDtVencto%></td>
            </tr>
            <tr>
              <td class="texto_pagina_11">PRORROG.:</td>
              <td bgcolor="#E9E9E9" class="texto_pagina_11">&nbsp;<%=sDtProrrog%></td>
            </tr>
            <tr>
              <td class="texto_pagina_11">COMPET&Ecirc;NCIA:</td>
              <td bgcolor="#E9E9E9" class="texto_pagina_11">&nbsp;<%=sCompet%></td>
            </tr>
            <tr>
              <td bgcolor="#E9E9E9"><div align="center"><strong>DADOS DO <br>
                PGTO</strong></div></td>
              <td class="texto_pagina_11"><table width="275" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="63" class="texto_pagina_11">BANCO:</td>
                    <td width="186" bgcolor="#E9E9E9">&nbsp;<%=""%></td>
                  </tr>
                  <tr>
                    <td class="texto_pagina_11">AG&Ecirc;NCIA:</td>
                    <td bgcolor="#E9E9E9">&nbsp;<%=""%></td>
                  </tr>
                  <tr>
                    <td class="texto_pagina_11">CONTA:</td>
                    <td bgcolor="#E9E9E9">&nbsp;<%=""%></td>
                  </tr>
              </table></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="0"></td>
  </tr>
  <tr>
    <td height="207"><table width="750" border="0" align="center" cellpadding="2" cellspacing="0" class="Borda_tabela">
      <tr class="Borda_tabela">
        <td width="592" height="27" class="Borda_so_em_baixo"><div align="center" class="texto_pagina"><strong>D E S C R I M I N A &Ccedil; &Atilde; O &nbsp;&nbsp;&nbsp;D O&nbsp;&nbsp;&nbsp; P A G A M E N T O</strong></div></td>
        <td width="148"  class="Borda_so_em_baixo"><div align="center" class="texto_pagina"><strong>V A L O R &nbsp;R$</strong></div></td>
      </tr>
      <tr>
        <td class="texto_pagina_11">VALOR:........................................................................................................................................</td>
        <td class="texto_pagina_11"><div align="right"><%=sValor%></div></td>
      </tr>
      <tr>
        <td class="texto_pagina_11">JUROS:........................................................................................................................................</td>
        <td class="texto_pagina_11"><div align="right"><%=sValJuros%></div></td>
      </tr>
      <tr>
        <td class="texto_pagina_11">DESCONTO:.................................................................................................................................</td>
        <td class="texto_pagina_11"><div align="right"><%=sValDesconto%></div></td>
      </tr>
      <tr>
        <td class="texto_pagina_11">RETEN&Ccedil;&Otilde;ES:................................................................................................................................</td>
        <td class="texto_pagina_11"><div align="right"><%=sMovRet%></div></td>
      </tr>
      <tr>
        <td class="texto_pagina_11">OUTROS:.....................................................................................................................................</td>
        <td class="texto_pagina_11"><div align="right"><%=sValMovOutros %></div></td>
      </tr>
      <tr>
        <td class="texto_pagina_11">DEVOLU&Ccedil;&Otilde;ES...............................................................................................................................</td>
        <td class="texto_pagina_11"><div align="right"><%=sValDev%></div></td>
      </tr>

    </table>
      <table width="750" border="0" align="center" cellpadding="2" cellspacing="0" class="texto_pagina">
        <tr>
          <td width="33" class="texto_pagina_11">&nbsp;</td>
          <td width="557" class="texto_pagina_11">TOTAL BRUTO:....................................................................................................................</td>
          <td width="148" class="texto_pagina_11" ><div align="right"><%=sValTotBruto%></div></td>
        </tr>
        <tr>
          <td class="texto_pagina_11">&nbsp;</td>
          <td class="texto_pagina_11">TOTAL DESCONTO:..............................................................................................................</td>
          <td class="texto_pagina_11"><div align="right"><%=sValTotDesc%></div></td>
        </tr>
        <tr>
          <td colspan="2" class="texto_pagina_11">TOTAL LIQUIDO A PAGAR:..............................................................................................................</td>
          <td class="texto_pagina_11"><div align="right"><%=sValLiquido%></div></td>
        </tr>
        <tr>
          <td colspan="2" class="texto_pagina_11">VALOR PAGO:...............................................................................................................................</td>
          <td class="texto_pagina_11"><div align="right"><%=sValPago%></div></td>
        </tr>
      </table>    </td>
  </tr>
  <tr>
    <td><table width="750" border="0" align="center" cellpadding="0" cellspacing="0" class="Borda_tabela">
      <tr>
        <td width="268" valign="top"><table width="250" border="0" align="center" cellpadding="1" cellspacing="1" class="texto_pagina_11">
            <tr>
              <td width="82">SOLICITANTE:</td>
              <td width="181"><%=sNmSolicitante%></td>
            </tr>
            <tr>
              <td>DATA SOLICI.:</td>
              <td><%=sDtSolicitacao%></td>
            </tr>
            <tr>
              <td height="22" colspan="2"><div align="center">__________________________________</div></td>
            </tr>
            <tr>
              <td height="22">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
        </table></td>
        <td width="235" rowspan="2" valign="top" class="Borda_esquerda"><table width="289" border="0" align="center" cellpadding="1" cellspacing="1" class="texto_pagina_11">
            <tr>
              <td colspan="2">AUTORIZA&Ccedil;&Atilde;O DE ACEITE PELA DIRETORIA</td>
            </tr>
            <tr>
              <td width="22" height="57">&nbsp;</td>
              <td width="264">(&nbsp;&nbsp;&nbsp; ) REGULAR (APTA PARA PAGTO)<br>
                (&nbsp;&nbsp;&nbsp; ) COM OBSERVA&Ccedil;&Atilde;O (PAGTO COM OBS.)<br>
                (&nbsp;&nbsp;&nbsp; ) IRREGULAR (INAPTA PARA PGTO)</td>
            </tr>
            <tr>
              <td height="21" colspan="2">Diretoria:</td>
            </tr>
            <tr>
              <td height="63" colspan="2"><div align="center">_______________________________<br>
                Carmona Cabrera Eng.</div>
                OBS.:<br>
                <br></td>
            </tr>
        </table></td>
        <td width="195" rowspan="3" valign="top" class="Borda_esquerda"><table width="209" border="0" align="center" cellpadding="1" cellspacing="1" class="texto_pagina_11">
            <tr>
              <td>APROPRIA&Ccedil;&Atilde;O:</td>
            </tr>
            <tr>
              <td height="13">&nbsp;</td>
            </tr>
            <tr>
              <td height="13">Tipo de Custo:</td>
            </tr>
            <tr>
              <td height="13" bgcolor="#E9E9E9"><div align="right"><%=sTipoCusto%></div></td>
            </tr>
            <tr>
              <td height="13">Centro de Neg&oacute;cios:</td>
            </tr>
            <tr bgcolor="#E9E9E9">
              <td height="13"><div align="right"><%=sCentroNeg%></div></td>
            </tr>
            <tr>
              <td height="13">Unidade de Neg&oacute;cios:</td>
            </tr>
            <tr bgcolor="#E9E9E9">
              <td height="13"><div align="right"><%=sUndNegocio%></div></td>
            </tr>
            <tr>
              <td height="13">Centro de Custos:</td>
            </tr>
            <tr bgcolor="#E9E9E9">
              <td height="13"><div align="right"><%=sCentroCus%></div></td>
            </tr>
            <tr>
              <td height="13">Setor:</td>
            </tr>
            <tr bgcolor="#E9E9E9">
              <td height="13"><div align="right"><%=sSetor%></div></td>
            </tr>
            <tr>
              <td height="13">Conta:</td>
            </tr>
            <tr bgcolor="#E9E9E9">
              <td height="13"><div align="right"><%=sConta%></div></td>
            </tr>
        </table></td>
      </tr>
      <tr>
        <td height="78" class="Borda_so_em_cima"><table width="250" border="0" align="center" cellpadding="1" cellspacing="1" class="texto_pagina_11">
            <tr>
              <td colspan="2">ACEITE PELO FINANCEIRO:</td>
            </tr>
            <tr>
              <td width="23" height="49">&nbsp;</td>
              <td width="233">(&nbsp;&nbsp;&nbsp; ) REGULAR (APTA PARA PAGTO)<br>
                (&nbsp;&nbsp;&nbsp; ) COM OBSERVA&Ccedil;&Atilde;O (PAGTO COM OBS.)<br>
                (&nbsp;&nbsp;&nbsp; ) IRREGULAR (INAPTA PARA PGTO)</td>
            </tr>
        </table></td>
      </tr>
      <tr class="Borda_so_em_cima">
        <td height="78" class="Borda_so_em_cima"><table width="250" border="0" align="center" cellpadding="1" cellspacing="1" class="texto_pagina_11">
            <tr>
              <td colspan="2">HIST&Oacute;RICO:</td>
            </tr>
            <tr>
              <td width="23" height="49">&nbsp;</td>
              <td width="239">RECEBIDA EM: ____/_____/______<br>
                DEVOLVIDA EM: _____/____/_____<br>
                REENVIADA EM:____/_____/______</td>
            </tr>
        </table></td>
        <td class="Borda_esquerda_e_Em_Cima"><table width="250" border="0" align="center" cellpadding="0" cellspacing="1" class="texto_pagina_11">
            <tr>
              <td>OBS. ACEITE</td>
            </tr>
            <tr>
              <td height="49"><div align="center"></div></td>
            </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><table width="750" border="0" align="center" cellpadding="0" cellspacing="0" class="Borda_tabela">
      <tr>
        <td width="366"><img src="imagens/Cabreira.png" width="366" height="76" class="Borda_so_em_baixo"></td>
        <td width="382" class="Borda_so_em_baixo"><div align="center" class="titulo_pagina">AUTORIZA&Ccedil;&Atilde;O DE PAGAMENTO</div></td>
      </tr>
      <tr>
        <td colspan="2"><table width="739" border="0" align="center" cellpadding="1" cellspacing="0" class="texto_pagina">
          <tr>
            <td colspan="2" class="texto_pagina">Autorizamos o pagamento do T&iacute;tulo acima descrito sem nenhuma ressalva.</td>
            </tr>
          <tr>
            <td width="309">&nbsp;&nbsp;&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;) CONTAB. EM:___/___/____<br>
              &nbsp;&nbsp;&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;) INCLUSO EM:___/___/____<br>
              &nbsp;&nbsp;&nbsp;(&nbsp;&nbsp;&nbsp;&nbsp;) BAIXADO EM:___/___/____</td>
            <td width="430" rowspan="2"><table width="399" border="0" align="center" cellpadding="1" cellspacing="0" class="Borda_tabela">
              <tr>
                <td class="texto_pagina">DOC. N&ordm;:<strong>&nbsp;<%=sNrDoc%></strong></td>
              </tr>
              <tr>
                <td class="texto_pagina">AUTORIZAMOS O PAGAMAMENTO EM:_____/_____/______</td>
              </tr>
              <tr>
                <td class="texto_pagina"><div align="center"><br>
                  ___________________________________<br>
                  DIRETORIA - CARMONA CABRERA ENG.<br>
                </div></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <%sUsuDataImpressao = session("gS_nmUsu") %>
            <td><div align="right">Impresso por:<%=sUsuDataImpressao%><br>
            					   Em:<%=formatdatetime(now,2) & " " & hour(now) & ":" & minute(now) & ":" & second(now)%><br>
            					   Emitido via internet.
            </div></td>
            </tr>
        </table></td>
        </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
