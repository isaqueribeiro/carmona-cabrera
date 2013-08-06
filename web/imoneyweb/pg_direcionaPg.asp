<%

	
	sTipo = request.QueryString("tipo")
	select case sTipo
		CASE "func"
			session("gS_TipoColab")="FU"
			session("gS_NmGrupo")="Funcionario"
		case "forn"
			session("gS_TipoColab")="FN"
			session("gS_NmGrupo")="Fornecedor"
	end select
	RESPONSE.Redirect("pg_consultaColab.asp")
	


%>