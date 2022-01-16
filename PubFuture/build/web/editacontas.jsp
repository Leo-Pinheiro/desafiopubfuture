<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Contas"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="styles/estilos.css">
        <script src="scripts/formatacampos.js"></script>
        
    </head>
      <body>
              <%
                        Integer idConta= Integer.parseInt(request.getParameter("idConta"));
                        Contas c = new Contas();
                        if (idConta != null) {
                            c = c.consultarContas(idConta);
                        }
                        String checkedCarteira = "";
                        String checkedContaCorrente = "";
                        String checkedPoupanca = "";

                        switch (c.getTipoConta()) {
                            case "carteira":
                                checkedCarteira = "checked";
                            case "contaCorrente":
                                checkedContaCorrente = "checked";
                            case "poupanca":
                                checkedPoupanca = "checked";
                        }

             %>
                <div class="container">
                  <form action="recebeeditacontas.jsp" method="POST" id="pubfuture" action="" >
                    <h3>Editar Conta</h3>  
                    <input type="hidden" name="idConta" value="<%out.write("" + c.getIdConta());%>" />

                    <fieldset>
                    <label>Número da Conta</label>
                    <input type="text" name="numeroConta" value="<%out.write("" + c.getNumeroConta());%>" />
                    </fieldset>
                    
                    <fieldset>
                    <label>Saldo</label>
                    <input type="text" name="saldo" value="<%out.write("" + c.getSaldo());%>" /> 
                    </fieldset>

                 <fieldset>
                        <label>Tipo de Conta:</label>
                        <label for="carteira"><input type="radio" id="carteira" name="tipoConta" value="carteira" <%=checkedCarteira%> >Carteira</label><br>
                                                <label for="contaCorrente"><input type="radio" id="contaCorrente" name="tipoConta" value="contaCorrente" <%=checkedContaCorrente%> >Conta Corrente</label><br>
                                                <label for="poupanca"><input type="radio" id="poupanca" name="tipoConta" value="poupanca" <%=checkedPoupanca%> >Poupança</label><br>
                   </fieldset><br/>
                    <fieldset>
                    <label>Instituição Financeira</label>
                    <input type="text" name="instituicaoFinanceira" value="<%out.write(c.getInstituicaoFinanceira());%>" />
                    </fieldset>  
                    
                   <input type="submit" value="Alterar" onclick="location.href = 'consultacontas.jsp';" />
                   <input type="reset" value="Cancelar" onclick="location.href = 'consultacontas.jsp';" />
                  </form> 
                </div>
        </body>
</html>
