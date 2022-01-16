package modelos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;


public class Despesas {

    private int idDespesa;  //serial
    private int valor;
    private Date dataPagamento;
    private Date dataPagamentoEsperado;
    private String tipoDespesa;
    private Contas contaDespesa;
    private int numeroConta;

    @Override
    public String toString() {
        return "Despesas{" + "idDespesa=" + idDespesa + ", valor=" + valor + ", dataPagamento=" + dataPagamento + ", dataPagamentoEsperado=" + dataPagamentoEsperado + ", tipoDespesa=" + tipoDespesa + ", contaDespesa=" + contaDespesa + ", numeroConta=" + numeroConta + '}';
    }

    
    
 public Despesas() {
        contaDespesa = new Contas();
 }
        public boolean incluirDespesas() {
        // declarando comando de execucao do banco de dados
            String sql  = "INSERT INTO despesas ";
                   sql += " (valor, dataPagamento, dataPagamentoEsperado, tipoDespesa, numeroConta)";
                   sql += " VALUES(?,?,?,?,?)";
            // conectando no banco de dados
           Connection con = Conexao.conectar();
            //
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.getValor());
                stm.setDate(2, this.getDataPagamento());
                stm.setDate(3, this.getDataPagamentoEsperado());           
                stm.setString(4, this.getTipoDespesa());
                stm.setInt(5, this.getNumeroConta());
                stm.execute(); 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
        }

    public boolean alterarDespesas() {
       // declarando comando de execucao do banco de dados
            String sql  = "UPDATE despesas ";
                   sql += "set valor                    = ?, ";
                   sql += "    dataPagamento            = ?, ";
                   sql += "    dataPagamentoEsperado    = ?, ";             
                   sql += "    tipoDespesa              = ?, ";
                   sql += "    numeroConta              = ? " ; 
                   sql += " where idDespesa             = ? ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);     
                stm.setInt(1, this.getValor());
                stm.setDate(2, this.getDataPagamento());
                stm.setDate(3, this.getDataPagamentoEsperado());
                stm.setString(4, this.getTipoDespesa());
                stm.setInt(5, this.getNumeroConta());
                stm.setInt(6, this.getIdDespesa());
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;	
	}

    public boolean excluirDespesas() {
   // declarando comando de execucao do banco de dados
	String sql  = "DELETE FROM despesas ";
               sql += "WHERE idDespesa = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.getIdDespesa());
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        return true;               
	}

    public Despesas consultarDespesas(Integer idDespesa) {
        this.setIdDespesa(idDespesa);
            // declarando comando de execucao do banco de dados
            String  sql  = "select idDespesa, valor, dataPagamento, dataPagamentoEsperado, tipoDespesa, numeroConta";
                    sql += " from despesas ";
                    sql += " where idDespesa = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Despesas des = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.getIdDespesa());
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   des = new Despesas();
                   des.setIdDespesa(rs.getInt("idDespesa"));
                   des.setValor(rs.getInt("valor"));
                   des.setDataPagamento(rs.getDate("dataPagamento"));
                   des.setDataPagamentoEsperado(rs.getDate("dataPagamentoEsperado"));
                   des.setTipoDespesa(rs.getString("tipoDespesa"));
                   des.setNumeroConta(rs.getInt("numeroConta"));     
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return des;
	}
 public List<Despesas> consultarGeral(){
        List<Despesas> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from despesas order by dataPagamento";
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Despesas despesas = new Despesas();
               despesas.setIdDespesa(rs.getInt("idDespesa"));
               despesas.setValor(rs.getInt("valor"));
               despesas.setDataPagamento(rs.getDate("dataPagamento"));
               despesas.setDataPagamentoEsperado(rs.getDate("dataPagamentoEsperado"));
               despesas.setTipoDespesa(rs.getString("tipoDespesa"));
               despesas.setNumeroConta(rs.getInt("numeroConta"));
               lista.add(despesas);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }

    public int getIdDespesa() {
        return idDespesa;
    }

    public void setIdDespesa(Integer idDespesa) {
        this.idDespesa = idDespesa;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(Integer valor) {
        this.valor = valor;
    }

    public Date getDataPagamento() {
        return dataPagamento;
    }

    public void setDataPagamento(Date dataPagamento) {
        this.dataPagamento = dataPagamento;
    }

    public Date getDataPagamentoEsperado() {
        return dataPagamentoEsperado;
    }

    public void setDataPagamentoEsperado(Date dataPagamentoEsperado) {
        this.dataPagamentoEsperado = dataPagamentoEsperado;
    }

    public String getTipoDespesa() {
        return tipoDespesa;
    }

    public void setTipoDespesa(String tipoDespesa) {
        this.tipoDespesa = tipoDespesa;
    }

    public Contas getContaDespesa() {
        return contaDespesa.consultarContas(this.numeroConta);
    }

    public void setContaDespesa(Contas contaDespesa) {
        this.contaDespesa = contaDespesa;
    }

    public int getNumeroConta() {
        return numeroConta;
    }

    public void setNumeroConta(Integer numeroConta) {
        this.numeroConta = numeroConta;
    }

}
