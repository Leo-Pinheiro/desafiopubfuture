<%@page import="modelos.Contas" %>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pub Future</title>
    </head>
        <h1>Conta Editado</h1>
        
    <%
           //recebe os valores da tela HTML  
            Integer numeroConta          = Integer.parseInt(request.getParameter("numeroConta"));
            Integer saldo                = Integer.parseInt(request.getParameter("saldo")); 
            String tipoConta             = request.getParameter("tipoConta");
            String instituicaoFinanceira = request.getParameter("instituicaoFinanceira");
            Integer idConta              = Integer.parseInt(request.getParameter("idConta"));
           //instancia a Conta
            Contas con = new Contas();
        
            con.setNumeroConta(numeroConta);
            con.setSaldo(saldo);
            con.setTipoConta(tipoConta);
            con.setInstituicaoFinanceira(instituicaoFinanceira);
                con.setIdConta(idConta);
            if(con.alterarContas()){
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultacontas.jsp?pmensagem=" +URLEncoder.encode("Conta editada com sucesso", "UTF-8"));
            } else {
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultacontas.jsp?pmensagem=" +URLEncoder.encode("Problemas ao editar a Conta", "UTF-8"));
            }          
        %>        
      </body>
</html>

