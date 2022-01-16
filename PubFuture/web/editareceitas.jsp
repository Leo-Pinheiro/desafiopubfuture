<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Receitas"%>
<%@page import="modelos.Contas"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="styles/estilos.css">
        <script src="scripts/formatacampos.js"></script>
        
    </head>
                
                <%
                    Integer idReceita = Integer.parseInt(request.getParameter("idReceita"));
                    Receitas r = new Receitas();
                    if (idReceita != null) {
                       r = r.consultarReceitas(idReceita);
                    }
                        String checkedSalario = "";
                        String checkedPresente = "";
                        String checkedPremio = "";

                        switch (r.getTipoReceita()) {
                            case "salario":
                                checkedSalario = "checked";
                            case "contaPresente":
                                checkedPresente = "checked";
                            case "premio":
                                checkedPremio = "checked";
                        }
                %>  
                
                <%

                    Contas contas = new Contas();
                    List<Contas> cont = contas.consultarGeral();
                    
                %>
                 <div class="container">
                <form action="recebeeditareceitas.jsp" method="POST" id="pubfuture" action="" >
                    <h3>Editar Despesa</h3> 
                    <fieldset>
                    <input type="hidden" name="idReceita" value="<%out.write("" + r.getIdReceita());%>" /><br /><hr />
                      <label>Selecione a Conta </label> 
                        <select name="numeroConta">
                            <% if (""+r.getNumeroConta()!= null){%>
                            <option value="<%out.write(""+r.getNumeroConta());%>"><%out.write(""+r.getNumeroConta());%></option> 
                                <%} else {%>
                            <option value="" hidden disabled selected> --Selecione a Conta--</option>
                            <%}%>
                            <% for(Contas c: cont){ %>
                            <option value="<%out.write(""+c.getNumeroConta());%>"> </option><%}%>
                           
                        </select>
                    </fieldset>
                    <fieldset>
                    <label>Valor</label>
                    <input type="text" name="valor" value="<%out.write("" + r.getValor());%>" /> 
                    </fieldset>
                    
                    <fieldset>
                    <label>Data do Recebimento</label>
                    <input type="date" name="dataRecebimento" value="<%out.write("" + r.getDataRecebimento());%>" /> 
                    </fieldset>

                    <fieldset>
                    <label>Data do Recebimento Esperado</label>
                    <input type="date" name="dataRecebimentoEsperado"  value="<%out.write("" + r.getDataRecebimentoEsperado());%>" /> 
                    </fieldset>
                    
                    <fieldset>
                    <label>Descricao</label>
                    <input type="text" name="descricao" value="<%out.write(r.getDescricao());%>" /> 
                    </fieldset>
                    
                  <label>Tipo de Conta:</label>
                  <label for="salario"><input type="radio" id="salario" name="tipoReceita" value="salario" <%=checkedSalario%> >Salário</label><br>
                                                <label for="presente"><input type="radio" id="presente" name="tipoReceita" value="presente" <%=checkedPresente%> >Presente</label><br>
                                                <label for="premio"><input type="radio" id="premio" name="tipoReceita" value="premio" <%=checkedPremio%> >Poupança</label><br>
                   </fieldset><br/>

                    <input type="submit" value="Alterar" onclick="location.href = 'consultareceitas.jsp';"/>
                    <input type="reset" value="Cancelar" onclick="location.href = 'consultareceitas.jsp';"/>
                </form>
                </div>                   
</html>
