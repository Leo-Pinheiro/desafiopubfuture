
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Despesas"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
      <link rel="stylesheet" href="styles/estilosconsulta.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
        <script src="scripts/formatacampos.js"></script>
    </head>
    <header>
   
    <body>
        <hr />
        <label class="cabecalho" id="msg">
            <%
                if (request.getParameter("pmensagem") != null) {
                    out.write(request.getParameter("pmensagem"));
                }
                   
                 Despesas des = new Despesas();
                 List<Despesas> despesas = des.consultarGeral();
            
            %>
        </label>
        <table class="table table-striped">
            <thead>
            <th scope="col">Número da Conta</th>
            <th scope="col">Valor</th>
            <th scope="col">Data do Pagamento</th>
            <th scope="col">Data do Pagamento Esperado</th>
            <th scope="col">Tipo da Despesa</th>
            <th scope="col"> Editar </th>
            <th scope="col"> Excluir </th>
        </thead>
        <tbody>
            <% for (Despesas d : despesas) { %>
           
            <tr>
                <td><% out.write("" + d.getNumeroConta()); %></td>
                <td><% out.write("" + d.getValor()); %></td>
                
                 <%
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    String dataPagamento = sdf.format(d.getDataPagamento());
                %>
                  <td><%out.write(dataPagamento); %></td>
                  
                   <%
                    SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy");
                    String dataPagamentoEsperado = s.format(d.getDataPagamentoEsperado());
                %>
                
                <td><%out.write(dataPagamentoEsperado); %></td>
                <td><% out.write(d.getTipoDespesa()); %></td>
                <td><%out.write("<a href=editadespesas.jsp?idDespesa=" + d.getIdDespesa()+ ">" + "<i class='fas fa-edit' style='color=black'></i>" + "</a>");%></td>                 <td>
                    
                    <a type="button" id="botaoexcluir"
                       onclick="mostrarExclusao(<%out.write("'"+ d.getIdDespesa()+"'");%>)">
                        <i class="fas fa-trash-alt" style='color:red'></i> 
                    </a>
                </td>                         
            </tr> 
            <%}%>
        </tbody>
    </table>
</form> 
<!-- POPUP DE CONFIRMAÇÃO DE EXCLUSÃO -->                

<div class="msg-popup2">
    <h5 class="text-center" style="color: #ffffff; font-family: arial-bold ">EXCLUSÃO</h5>
    <h5 class="text-center" style="color: #ffffff;">Confirma a <b>exclusão</b> do registro ?</h5>
    <div class="text-center">                
        <a href=""><button class="btn btn-dark" onclick="cancela()"> Não </button></a>
        <a id="exclui" href="#"><button class="btn btn-danger" id="excluir"> Sim </button></a>                    
    </div>
</div>                

<script>
    function cancela() {
        document.getElementsByClassName("msg-popup2")[0].style.display = "none";
    }

    function mostrarExclusao(despesas) {
        //debugger;
        document.getElementsByClassName("msg-popup2")[0].style.display = "block";
        var link = document.getElementById("exclui");
        link.href = "excluirdespesas.jsp?idDespesa=" + despesas;
    }
</script>
</body>
</html>

