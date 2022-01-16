<<%@page import="java.sql.Date"%>
<%@page import="modelos.Despesas"%>
<%@page import="java.net.URLEncoder"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <%  
    //Instancia a despesa
    Despesas des = new Despesas();
    
    //Recebe os valores da tela HTML
    des.setNumeroConta(Integer.parseInt(request.getParameter("numeroConta")));
    des.setValor(Integer.parseInt(request.getParameter("valor")));
    des.setDataPagamento (Date.valueOf(request.getParameter("dataPagamento")));
    des.setDataPagamentoEsperado (Date.valueOf(request.getParameter("dataPagamentoEsperado")));
    des.setTipoDespesa (request.getParameter("tipoDespesa"));
    
        if(des.incluirDespesas())
        {
          response.sendRedirect("cadastradespesas.jsp?pmensagem=" +URLEncoder.encode("Despesa salva com sucesso", "UTF-8"));
        }
        else 
        {
          response.sendRedirect("cadastradespesas.jsp?pmensagem=" +URLEncoder.encode("Problemas ao salvar Despesa", "UTF-8"));
        }
        %>
    </body>
</html>
