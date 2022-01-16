
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Despesas" %>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pub Future</title>
    </head>
        <h1>Despesa Editado</h1>
        
    <%
        //recebe os valores da tela HTML  
            Integer numeroConta = Integer.parseInt(request.getParameter("numeroConta"));
            Integer valor = Integer.parseInt(request.getParameter("valor"));
            Date dataPagamento  = Date.valueOf(request.getParameter("dataPagamento"));
            Date dataPagamentoEsperado  = Date.valueOf(request.getParameter("dataPagamentoEsperado")); 
            String tipoDespesa = request.getParameter("tipoDespesa");
            Integer idDespesa = Integer.parseInt(request.getParameter("idDespesa"));
            //instancia a Despesa
            Despesas des = new Despesas();
            des.setNumeroConta(numeroConta);
            des.setValor(valor);
            des.setDataPagamento(dataPagamento);
            des.setDataPagamentoEsperado(dataPagamentoEsperado);
            des.setTipoDespesa(tipoDespesa);
            des.setIdDespesa(idDespesa);
            if(des.alterarDespesas()){
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultadespesas.jsp?pmensagem=" +URLEncoder.encode("despesa editada com sucesso", "UTF-8"));
            } else {
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultadespesas.jsp?pmensagem=" +URLEncoder.encode("Problemas ao editar despesa", "UTF-8"));
            }          
        %>        
      </body>
</html>

