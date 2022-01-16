
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Contas"%>
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
        <%
          Integer idConta = Integer.parseInt(request.getParameter("idConta"));
          Contas con = new Contas();
          if (idConta != null){
              con = con.consultarContas(idConta);
              if(con.excluirContas()){
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultacontas.jsp?pmensagem=" +URLEncoder.encode("Conta excluida com sucesso", "UTF-8"));
                } else {
                    response.setCharacterEncoding("UTF-8");
                    response.sendRedirect("consultacontas.jsp?pmensagem=" +URLEncoder.encode("Problemas ao excluir a Conta", "UTF-8"));
                }
          }          
        %> 
    </body>
</html>
