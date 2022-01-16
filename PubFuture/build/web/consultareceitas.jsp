
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Receitas"%>
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
                   
                 Receitas res = new Receitas();
                 List<Receitas> receitas = res.consultarGeral();
            
            %>
        </label>
        <table class="table table-striped">
            <thead>
            <th scope="col">Número da Conta</th>
            <th scope="col">Valor</th>
            <th scope="col">Data do Recebimento</th>
            <th scope="col">Data do Recebimento Esperado</th>
            <th scope="col">Descricao</th>
            <th scope="col">Tipo da Receita</th>
            <th scope="col"> Editar </th>
            <th scope="col"> Excluir </th>
        </thead>
        <tbody>
            <% for (Receitas r : receitas) { %>
            <tr>
                <td><% out.write("" + r.getNumeroConta()); %></td>
                <td><% out.write("" + r.getValor()); %></td>

                <%
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    String dataRecebimento = sdf.format(r.getDataRecebimento());
                %>
                <td><%out.write(dataRecebimento); %></td>
                  
                   <%
                    SimpleDateFormat s = new SimpleDateFormat("dd/MM/yyyy");
                    String dataRecebimentoEsperado = s.format(r.getDataRecebimentoEsperado());
                %>
                
                <td><%out.write(dataRecebimentoEsperado); %></td>
                <td><% out.write(r.getDescricao()); %></td>
                <td><% out.write(r.getTipoReceita()); %></td>
                <td><%out.write("<a href=editareceitas.jsp?idReceita=" + r.getIdReceita()+ ">" + "<i class='fas fa-edit' style='color=black'></i>" + "</a>");%></td>
                <td>
                    
                    <a type="button" id="botaoexcluir"
                       onclick="mostrarExclusao(<%out.write("'"+ r.getIdReceita()+"'");%>)">
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

    function mostrarExclusao(receitas) {
        //debugger;
        document.getElementsByClassName("msg-popup2")[0].style.display = "block";
        var link = document.getElementById("exclui");
        link.href = "excluirreceitas.jsp?idReceita=" + receitas;
    }
</script>
</body>
</html>

