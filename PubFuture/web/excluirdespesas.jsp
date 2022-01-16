
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Despesas"%>
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
        <h1>Excluir Cargo</h1>
        <%
          Integer idDespesa = Integer.parseInt(request.getParameter("idDespesa"));
          Despesas des = new Despesas();
          if (idDespesa != null){
              des = des.consultarDespesas(idDespesa);
              if(des.excluirDespesas()){
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultadespesas.jsp?pmensagem=" +URLEncoder.encode("Despesa excluida com sucesso", "UTF-8"));
                } else {
                    response.setCharacterEncoding("UTF-8");
                    response.sendRedirect("consultadespesas.jsp?pmensagem=" +URLEncoder.encode("Problemas ao excluir a despesa", "UTF-8"));
                }
          }          
        %> 
    </body>
</html>
