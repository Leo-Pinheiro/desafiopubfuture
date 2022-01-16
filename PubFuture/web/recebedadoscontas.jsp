<%@page import="modelos.Contas"%>
<%@page import="java.net.URLEncoder"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        
<%
         Contas cont = new Contas();
         cont.setNumeroConta(Integer.parseInt(request.getParameter("numeroConta")));
         cont.setSaldo(Integer.parseInt(request.getParameter("saldo")));
         cont.setTipoConta(request.getParameter("tipoConta"));
         cont.setInstituicaoFinanceira(request.getParameter("instituicaoFinanceira"));
         
        if (cont.incluirContas()) {
            response.sendRedirect("cadastraconta.jsp?pmensagem=" +URLEncoder.encode("Conta salva com sucesso", "UTF-8"));
    } else {
            response.sendRedirect("cadastraconta.jsp?pmensagem=" +URLEncoder.encode("Problemas ao salvar a conta", "UTF-8"));
    }
    
%>
    </body>
</html>
