<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Despesas"%>
<%@page import="modelos.Contas"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="styles/estilos.css">
        <script src="scripts/formatacampos.js"></script>
        
    </head>
           <%
                        Integer idDespesa = Integer.parseInt(request.getParameter("idDespesa"));
                        Despesas d = new Despesas();
                        if (idDespesa != null) {
                            d = d.consultarDespesas(idDespesa);
                        }
                        String checkedAlimentacao = "";
                        String checkedEducacao = "";
                        String checkedLazer = "";
                        String checkedMoradia = "";
                        String checkedRoupa = "";
                        String checkedSaude = "";
                        String checkedTransporte = "";
                        switch (d.getTipoDespesa()) {
                            case "alimentacao":
                                checkedAlimentacao = "checked";
                            case "educacao":
                                checkedEducacao = "checked";
                            case "lazer":
                                checkedLazer = "checked";
                            case "moradia":
                                checkedMoradia = "checked";
                            case "roupa":
                                checkedRoupa = "checked";
                            case "saude":
                                checkedSaude = "checked";
                            case "transporte":
                                checkedTransporte = "checked";
                        }

             %>
             
               <%

                    Contas contas = new Contas();
                    List<Contas> cont= contas.consultarGeral();
                    
               %>
                <div class="container">
               <form action="recebeeditadespesas.jsp" method="POST" id="pubfuture" action="">
                    <h3>Editar Despesa</h3> 
                    <input type="hidden" name="idDespesa" value="<%out.write("" + d.getIdDespesa());%>" /><br /><hr />
                    
                       <label>Selecione a Conta </label> 
                        <select name="numeroConta">
                            <% if (""+d.getNumeroConta()!= null){%>
                            <option value="<%out.write(""+d.getNumeroConta());%>"><%out.write(""+d.getNumeroConta());%></option> 
                                <%} else {%>
                            <option value="" hidden disabled selected> --Selecione a Conta--</option>
                            <%}%>
                            <% for(Contas c: cont){ %>
                            <option value="<%out.write(""+c.getNumeroConta());%>"> </option><%}%>
                           
                        </select><br />
                        
                    <fieldset>
                    <label>Valor</label>
                    <input type="text" name="valor" value="<%out.write("" + d.getValor());%>" /> 
                    </fieldset>
                    
                    <fieldset>
                    <label>Data do Pagamento</label>
                    <input type="date" name="dataPagamento" value="<%out.write("" + d.getDataPagamento());%>" /> 
                    </fieldset>

                    <fieldset>
                    <label>Data do Pagamento Esperado</label>
                    <input type="date" name="dataPagamentoEsperado"  value="<%out.write("" + d.getDataPagamentoEsperado());%>" /> 
                    </fieldset>

                    <label>Tipo de Conta:</label>
                        <label for="alimentacao"><input type="radio" id="alimentacao" name="tipoDespesa" value="alimentacao" <%=checkedAlimentacao%> >Alimentação</label><br>
                                                <label for="educacao"><input type="radio" id="educacao" name="tipoDespesa" value="educacao" <%=checkedEducacao%> >Educação</label><br>
                                                <label for="lazer"><input type="radio" id="lazer" name="tipoDespesa" value="lazer" <%=checkedLazer%> >Lazer</label><br>
                                                <label for="moradia"><input type="radio" id="moradia" name="tipoDespesa" value="moradia" <%=checkedMoradia%> >Moradia</label><br>
                                                <label for="roupa"><input type="radio" id="roupa" name="tipoDespesa" value="roupa" <%=checkedRoupa%> >Roupa</label><br>
                                                <label for="saude"><input type="radio" id="saude" name="tipoDespesa" value="saude" <%=checkedSaude%> >Saúde</label><br>
                                                <label for="transporte"><input type="radio" id="transporte" name="tipoDespesa" value="transporte" <%=checkedTransporte%> >Transporte</label><br>

                   </fieldset><br/>     

                    <input type="submit" value="Alterar" onclick="location.href = 'consultadespesas.jsp';"/>
                    <input type="reset" value="Cancelar" onclick="location.href = 'consultadespesas.jsp';" />
                </form>
                </div>                   
</html>
