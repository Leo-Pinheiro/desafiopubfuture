
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Despesas" %>
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
            <form action="recebedadosdespesas.jsp" method="POST" id="pubfuture" action="" >
                <h3>Cadastrar Despesas</h3><br />
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
                    <label>Valor </label>
                    <input type="text" name="valor" maxlength="30" />
                </fieldset>
                <fieldset>
                    <label>data do Pagamento </label>
                    <input type="date" name="dataPagamento" maxlength="30" />
                </fieldset>
                <fieldset>
                    <label>data do Pagamento Esperado </label>
                    <input type="date" name="dataPagamentoEsperado" maxlength="30" />
                </fieldset>

                <label>Tipo da Despesa </label>
                    <fieldset> 
                        <label for="alimentacao"><input type="radio" id="alimentacao" name="tipoDespesa" value="alimentacao"> Alimentação</label>
                    </fieldset>
                    <fieldset>
                        <label for="educacao"><input type="radio" id="educacao" name="tipoDespesa" value="educacao"> Educação</label>
                    </fieldset>
                    <fieldset>
                        <label for="lazer"><input type="radio" id="lazer" name="tipoDespesa" value="lazer"> Lazer</label>
                    </fieldset>
                  <fieldset>
                        <label for="moradia"><input type="radio" id="moradia" name="tipoDespesa" value="moradia"> Moradia</label>
                    </fieldset>
                  <fieldset>
                        <label for="roupa"><input type="radio" id="roupa" name="tipoDespesa" value="roupa"> Roupa</label>
                    </fieldset>
                  <fieldset>
                        <label for="saude"><input type="radio" id="saude" name="tipoDespesa" value="saude"> Saúde</label>
                    </fieldset>
                  <fieldset>
                        <label for="transporte"><input type="radio" id="transporte" name="tipoDespesa" value="transporte"> Transporte</label>
                    </fieldset>
                <br />
                <input type="button" value="Salvar" onclick="enviarDados()" />
                <input type="reset" value="Cancelar" />
            </form>
        </div>
        <script>
            function enviarDados() {
                 var numeroConta = document.getElementsByName("numeroConta");
                if (numeroConta[0].value === "") {
                    numeroConta[0].focus();
                    alert("Informe o da Número da Conta");
                    exit(0);
                }

                 var dataPagamento = document.getElementsByName("dataPagamento");
                if (dataPagamento[0].value === "") {
                    dataPagamento[0].focus();
                    alert("Informe a Data do Pagamento");
                    exit();
                }
                
                var dataPagamentoEsperado = document.getElementsByName("dataPagamentoEsperado");
                if (dataPagamentoEsperado[0].value === "") {
                    dataPagamentoEsperado[0].focus();
                    alert("Informe a Data do Pagamento Esperado");
                    exit();
                }

                var tipoDespesa = document.getElementsByName("tipoDespesa");
                if (tipoDespesa[0].value === "") {
                    tipoDespesa[0].focus();
                    alert("Informe o Tipo da Despesa");
                    exit();
                }
                
                document.forms[0].submit();
            }
        </script>
    </body>
</html>
