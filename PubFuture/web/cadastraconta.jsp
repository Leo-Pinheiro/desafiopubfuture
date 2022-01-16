
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Contas" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <script src="scripts/formatacampos.js"></script>
    </head>
    <body>
        <label class="cabecalho" id="msg" id="pubfuture" action="" >
            <%
                if (request.getParameter("pmensagem") != null) {
                    out.write(request.getParameter("pmensagem"));
                }
            %>
        </label>
        <script>
                    function k(i) {
               var v = i.value.replace(/\D/g,'');
               v = (v/100).toFixed(2) + '';
               v = v.replace(".", ",");
               v = v.replace(/(\d)(\d{3})(\d{3}),/g, "$1.$2.$3,");
               v = v.replace(/(\d)(\d{3}),/g, "$1.$2,");
               i.value = v;
}
        </script>
        <div class="container">
            <form action="recebedadoscontas.jsp" method="POST" id="pubfuture" action="" >
                <h3>Cadastrar Contas</h3><br />
                <fieldset>
                    <label>Número da Conta </label>
                    <input type="text" name="numeroConta" maxlength="30" />
                </fieldset>
                <fieldset>
                    <label>Saldo </label>
                    <input type="text" name="saldo" maxlength="30" />
                </fieldset>

                 <label>Tipo de Conta: </label>
                    <fieldset> 
                        <label for="carteira"><input type="radio" id="carteira" name="tipoConta" value="carteira"> Carteira</label>
                    </fieldset>
                    <fieldset>
                        <label for="contaCorrente"><input type="radio" id="contaCorrente" name="tipoConta" value="contaCorrente"> Conta Corrente</label>
                    </fieldset>
                    <fieldset>
                        <label for="poupanca"><input type="radio" id="poupanca" name="tipoConta" value="poupanca"> Poupança</label>
                    </fieldset>
                <fieldset>
                    <label>Instituição Financeira </label>
                    <input type="text" name="instituicaoFinanceira" maxlength="30" />
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
                    alert("Informe o Número da Conta");
                    exit();
                }
                
                var saldo = document.getElementsByName("saldo");
                if (saldo[0].value === "") {
                    saldo[0].focus();
                    alert("Informe o Saldo");
                    exit();
                }

                var tipoConta = document.getElementsByName("tipoConta");
                if (tipoConta[0].value === "") {
                    tipoConta[0].focus();
                    alert("Informe o Tipo da Conta");
                    exit();
                }

                var instituicaoFinanceira = document.getElementsByName("instituicaoFinanceira");
                if (instituicaoFinanceira[0].value === "") {
                    instituicaoFinanceira[0].focus();
                    alert("Informe a Instituição Financeira");
                    exit();
                }
                
                document.forms[0].submit();
            }
        </script>
    </body>
</html>
