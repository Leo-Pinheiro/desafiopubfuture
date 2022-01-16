package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Contas {
    private int idConta;
    private int numeroConta;
    private int saldo;
    private String tipoConta;
    private String instituicaoFinanceira;

    @Override
    public String toString() {
        return "Contas{" + "idConta=" + idConta + ", numeroConta=" + numeroConta + ", saldo=" + saldo + ", tipoConta=" + tipoConta + ", instituicaoFinanceira=" + instituicaoFinanceira + '}';
    }

   
    
   public boolean incluirContas() {
        // declarando comando de execucao do banco de dados
            String sql  = "INSERT INTO contas ";
                   sql += " (numeroConta, saldo, tipoConta, instituicaoFinanceira)";
                   sql += "VALUES(?,?,?,?)";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.numeroConta);
                stm.setInt(2, this.saldo);
                stm.setString(3, this.tipoConta);           
                stm.setString(4, this.instituicaoFinanceira);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
        }
 
  
    public boolean alterarContas() {
       // declarando comando de execução do banco de dados
            String sql  = "UPDATE contas ";
                   sql += "set numeroConta           = ?, ";
                   sql += "    saldo                 = ?, ";             
                   sql += "    tipoConta             = ?, ";
                   sql += "    instituicaoFinanceira = ? ";
                   sql += " where idConta            = ? ";
            // conectando no banco de dados 
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);            
                stm.setInt(1, this.numeroConta);
                stm.setInt(2, this.saldo);
                stm.setString(3, this.tipoConta);
                stm.setString(4, this.instituicaoFinanceira);
                stm.setInt(5, this.idConta);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;	
	}

    public boolean excluirContas() {
   // declarando comando de execução do banco de dados
	String sql  = "DELETE FROM contas ";
               sql += "WHERE idConta = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idConta);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        return true;               
	}

    public Contas consultarContas(Integer pIdConta) {
    this.idConta = pIdConta;
            // declarando comando de execucao do banco de dados
            String  sql  = "select idConta, numeroConta, saldo, tipoConta, instituicaoFinanceira";
                    sql += " from contas ";
                    sql += " where idConta = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Contas cont = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.idConta);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   cont = new Contas();
                   cont.setIdConta(rs.getInt("idConta"));
                   cont.setNumeroConta(rs.getInt("numeroConta"));
                   cont.setSaldo(rs.getInt("saldo"));
                   cont.setTipoConta(rs.getString("tipoConta"));
                   cont.setInstituicaoFinanceira(rs.getString("instituicaoFinanceira"));
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return cont;
	}
 public List<Contas> consultarGeral(){
        List<Contas> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from contas order by numeroConta";
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Contas contas = new Contas();
               contas.setIdConta(rs.getInt("idConta"));
               contas.setNumeroConta(rs.getInt("numeroConta"));
               contas.setSaldo(rs.getInt("saldo"));
               contas.setTipoConta(rs.getString("tipoConta"));
               contas.setInstituicaoFinanceira(rs.getString("instituicaoFinanceira"));
               lista.add(contas);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
 }
    public int getNumeroConta() {
        return numeroConta;
    }

    public void setNumeroConta(Integer numeroConta) {
        this.numeroConta = numeroConta;
    }

    public int getSaldo() {
        return saldo;
    }

    public void setSaldo(Integer saldo) {
        this.saldo = saldo;
    }

    public String getTipoConta() {
        return tipoConta;
    }

    public void setTipoConta(String tipoConta) {
        this.tipoConta = tipoConta;
    }

    public String getInstituicaoFinanceira() {
        return instituicaoFinanceira;
    }

    public void setInstituicaoFinanceira(String instituicaoFinanceira) {
        this.instituicaoFinanceira = instituicaoFinanceira;
    }

    public int getIdConta() {
        return idConta;
    }

    public void setIdConta(int idConta) {
        this.idConta = idConta;
    }
}
   
