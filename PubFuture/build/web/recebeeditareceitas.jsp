
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Receitas" %>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pub Future</title>
    </head>
        <h1>Valor Editado</h1>
        
    <%
        //recebe os valores da tela HTML  
            Integer numeroConta = Integer.parseInt(request.getParameter("numeroConta"));
            Integer valor = Integer.parseInt(request.getParameter("valor"));
            Date dataRecebimento  = Date.valueOf(request.getParameter("dataRecebimento"));
            Date dataRecebimentoEsperado  = Date.valueOf(request.getParameter("dataRecebimentoEsperado")); 
            String descricao = request.getParameter("descricao");
            String tipoReceita = request.getParameter("tipoReceita");
            Integer idReceita = Integer.parseInt(request.getParameter("idReceita"));
            //instancia a Receita
            Receitas res = new Receitas();
            res.setNumeroConta(numeroConta);
            res.setValor(valor);
            res.setDataRecebimento(dataRecebimento);
            res.setDataRecebimentoEsperado(dataRecebimentoEsperado);
            res.setDescricao(descricao);
            res.setTipoReceita(tipoReceita);
            res.setIdReceita(idReceita);
            if(res.alterarReceitas()){
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultareceitas.jsp?pmensagem=" +URLEncoder.encode("Receita editada com sucesso", "UTF-8"));
            } else {
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultareceitas.jsp?pmensagem=" +URLEncoder.encode("Problemas ao editar Receita", "UTF-8"));
            }          
        %>        
      </body>
</html>

