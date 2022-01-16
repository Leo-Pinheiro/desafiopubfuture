
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Receitas"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pub future</title>
    </head>
     <header>
            <script src="scripts/cabecalho.js"></script> 
    </header>
    <body>
        <h1>Excluir Receitas</h1>
        <%
          Integer idReceita = Integer.parseInt(request.getParameter("idReceita"));
          Receitas rec = new Receitas();
          if (idReceita != null){
              rec = rec.consultarReceitas(idReceita);
              if(rec.excluirReceitas()){
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultareceitas.jsp?pmensagem=" +URLEncoder.encode("Receita excluida com sucesso", "UTF-8"));
                } else {
                    response.setCharacterEncoding("UTF-8");
                    response.sendRedirect("consultareceitas.jsp?pmensagem=" +URLEncoder.encode("Problemas ao excluir a receita", "UTF-8"));
                }
          }          
        %> 
    </body>
</html>
