<<%@page import="java.sql.Date"%>
<%@page import="modelos.Receitas"%>
<%@page import="java.net.URLEncoder"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <%  
    //Instancia a despesa
    Receitas res = new Receitas();
    
    //Recebe os valores da tela HTML
    res.setNumeroConta(Integer.parseInt(request.getParameter("numeroConta")));
    res.setValor(Integer.parseInt(request.getParameter("valor")));
    res.setDataRecebimento(Date.valueOf(request.getParameter("dataRecebimento")));
    res.setDataRecebimentoEsperado(Date.valueOf(request.getParameter("dataRecebimentoEsperado")));
    res.setDescricao(request.getParameter("descricao"));
    res.setTipoReceita(request.getParameter("tipoReceita"));
    
        if(res.incluirReceitas())
        {
          response.sendRedirect("cadastrareceitas.jsp?pmensagem=" +URLEncoder.encode("Receita salva com sucesso", "UTF-8"));
        }
        else 
        {
          response.sendRedirect("cadastrareceitas.jsp?pmensagem=" +URLEncoder.encode("Problemas ao salvar Receita", "UTF-8"));
        }
        %>
    </body>
</html>
