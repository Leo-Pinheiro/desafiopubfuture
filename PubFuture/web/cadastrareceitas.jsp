
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Receitas" %>
<%@page import="modelos.Contas" %>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <script src="scripts/formatacampos.js"></script>
    </head>
    <body>
        <%
            Contas contas = new Contas();
            List<Contas> cont = contas.consultarGeral();
        %>
        <label class="cabecalho" id="msg" id="pubfuture" action="" >
            <%
                if (request.getParameter("pmensagem") != null) {
                    out.write(request.getParameter("pmensagem"));
                }
            %>
        </label>
        <div class="container">
            <form action="recebedadosreceitas.jsp" method="POST" id="pubfuture" action="" >
                <h3>Cadastrar Receitas</h3><br />
                   <label>Contas <br />
                    <select name="numeroConta">
                        <option value="" hidden disabled selected> --Selecione a Conta--</option>
                        <% for (Contas c : cont) {     %>
                        <option value="<%out.write("" + c.getNumeroConta());%>">
                            <% out.write(c.getNumeroConta()); %></option><%}%>
                    </select>
                </label>
                <a href="cadastraconta.jsp" target="_blank"> Cadastrar Conta </a>
            </fieldset><br />
                <fieldset>
                    <label>Valor</label>
                    <input type="text" name="valor" maxlength="30" />
                </fieldset>
                <fieldset>
                    <label>Data do Recebimento </label>
                    <input type="date" name="dataRecebimento"  />
                </fieldset>
                <fieldset>
                    <label>Data do Recebimento Esperado </label>
                    <input type="date" name="dataRecebimentoEsperado" />
                </fieldset>
                
                 <fieldset>
                    <label>Descrição</label>
                    <input type="text" name="descricao" />
                </fieldset>

              <label>Tipo da Receita </label>
                    <fieldset> 
                        <label for="salario"><input type="radio" id="salario" name="tipoReceita" value="salario"> Salário</label>
                    </fieldset>
                    <fieldset>
                        <label for="presente"><input type="radio" id="presente" name="tipoReceita" value="presente"> Presente</label>
                    </fieldset>
                    <fieldset>
                        <label for="premio"><input type="radio" id="premio" name="tipoReceita" value="premio"> Prêmio</label>
                    </fieldset>
                 <br />
                <input type="button" value="Salvar" onclick="enviarDados()" />
                <input type="reset" value="Cancelar" />
            </form>
        </div>
        <script>
            function enviarDados() {
                 var valor = document.getElementsByName("valor");
                if (valor[0].value === "") {
                    valor[0].focus();
                    alert("Informe o valor");
                    exit();
                }
                
                var dataRecebimento = document.getElementsByName("dataRecebimento");
                if (dataRecebimento[0].value === "") {
                    dataRecebimento[0].focus();
                    alert("Informe a Data do Recebimento");
                    exit();
                }

                var dataRecebimentoEsperado = document.getElementsByName("dataRecebimentoEsperado");
                if (dataRecebimentoEsperado[0].value === "") {
                    dataRecebimentoEsperado[0].focus();
                    alert("Informe a Data do Recebimento Esperado");
                    exit();
                }
                
                  var descricao = document.getElementsByName("descricao");
                if (descricao[0].value === "") {
                    descricao[0].focus();
                    alert("Informe a descrição ");
                    exit();
                }
                  var tipoReceita = document.getElementsByName("tipoReceita");
                if (tipoReceita[0].value === "") {
                    tipoReceita[0].focus();
                    alert("Informe o Tipo de Receita");
                    exit();
                }
                
                document.forms[0].submit();
            }
        </script>
    </body>
</html>
