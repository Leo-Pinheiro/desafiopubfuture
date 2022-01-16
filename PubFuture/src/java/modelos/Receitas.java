package modelos;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.Conexao;

public class Receitas {
   
    private int idReceita; // serial
    private int valor;
    private Date dataRecebimento;
    private Date dataRecebimentoEsperado;
    private String descricao;
    private String tipoReceita;
    private int numeroConta;
    private Contas contaReceita;

    @Override
    public String toString() {
        return "Receitas{" + "idReceita=" + idReceita + ", valor=" + valor + ", dataRecebimento=" + dataRecebimento + ", dataRecebimentoEsperado=" + dataRecebimentoEsperado + ", descricao=" + descricao + ", tipoReceita=" + tipoReceita + ", numeroConta=" + numeroConta + '}';
    }
   
     public Receitas() {
        contaReceita = new Contas();
 }
      public boolean incluirReceitas() {
        // declarando comando de execucao do banco de dados
            String sql  = "INSERT INTO receitas ";
                   sql += " (valor, dataRecebimento, dataRecebimentoEsperado, descricao, tipoReceita, numeroConta)";
                   sql += "VALUES(?,?,?,?,?,?)";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.valor);
                stm.setDate(2, this.dataRecebimento);
                stm.setDate(3, this.dataRecebimentoEsperado);
                stm.setString(4, this.descricao);
                stm.setString(5, this.tipoReceita);
                stm.setInt(6, this.numeroConta);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false;
            }            
            return true;   
        }

    public boolean alterarReceitas() {
       // declarando comando de execucao do banco de dados
            String sql  = "UPDATE receitas ";
                   sql += "set valor                     = ?, ";
                   sql += "    dataRecebimento           = ?, ";
                   sql += "    dataRecebimentoEsperado   = ?, ";
                   sql += "    descricao                 = ?, ";
                   sql += "    tipoReceita               = ?, ";
                   sql += "    numeroConta               = ? ";
                   sql += " where idReceita              = ? ";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            // 
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.valor);
                stm.setDate(2, this.dataRecebimento);
                stm.setDate(3, this.dataRecebimentoEsperado);
                stm.setString(4, this.descricao);
                stm.setString(5, this.tipoReceita);
                 stm.setInt(6, this.numeroConta);
                stm.setInt(7, this.idReceita);
                stm.execute();   
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
                return false; 
            }
            return true;	
	}

    public boolean excluirReceitas() {
   // declarando comando de execucao do banco de dados
	String sql  = "DELETE FROM receitas ";
               sql += "WHERE idReceita = ? ";
        // conectando no banco de dados
        Connection con = Conexao.conectar();
        // 
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.idReceita);
            stm.execute();   
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false; 
        }
        return true;               
	}

    public Receitas consultarReceitas(Integer pIdReceita) {
    this.idReceita = pIdReceita;
            // declarando comando de execucao do banco de dados
            String  sql  = "select idReceita, valor, dataRecebimento, dataRecebimentoEsperado, descricao, tipoReceita, numeroConta ";
                    sql += " from receitas ";
                    sql += " where idReceita = ?";
            // conectando no banco de dados
            Connection con = Conexao.conectar();
            //
            Receitas rec = null;
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setInt(1, this.idReceita);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                   rec = new Receitas();
                   rec.setIdReceita(rs.getInt("idReceita"));
                   rec.setValor(rs.getInt("valor"));
                   rec.setDataRecebimento(rs.getDate("dataRecebimento"));
                   rec.setDataRecebimentoEsperado(rs.getDate("dataRecebimentoEsperado"));
                   rec.setDescricao(rs.getString("descricao"));
                   rec.setTipoReceita(rs.getString("tipoReceita"));
                   rec.setNumeroConta(rs.getInt("numeroConta"));
            } 
            } catch (SQLException ex) {
                System.out.println("Erro:" + ex.getMessage());
            }
            return rec;
	}
 public List<Receitas> consultarGeral(){
        List<Receitas> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * from receitas order by valor";
        try {
            PreparedStatement stm = con.prepareStatement(sql);     
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
               Receitas  receitas = new Receitas();
               receitas.setIdReceita(rs.getInt("idReceita"));
               receitas.setValor(rs.getInt("valor"));
               receitas.setDataRecebimento(rs.getDate("dataRecebimento"));
               receitas.setDataRecebimentoEsperado(rs.getDate("dataRecebimentoEsperado"));
               receitas.setDescricao(rs.getString("descricao"));
               receitas.setTipoReceita(rs.getString("tipoReceita"));
               receitas.setNumeroConta(rs.getInt("numeroConta"));
               lista.add(receitas);
           } 
        } catch (SQLException ex) {
          System.out.println("Erro:" + ex.getMessage());
        }
        return lista;
    }

    public int getIdReceita() {
        return idReceita;
    }

    public void setIdReceita(Integer idReceita) {
        this.idReceita = idReceita;
    }

    public int getValor() {
        return valor;
    }

    public void setValor(Integer valor) {
        this.valor = valor;
    }

    public Date getDataRecebimento() {
        return dataRecebimento;
    }

    public void setDataRecebimento(Date dataRecebimento) {
        this.dataRecebimento = dataRecebimento;
    }

    public Date getDataRecebimentoEsperado() {
        return dataRecebimentoEsperado;
    }

    public void setDataRecebimentoEsperado(Date dataRecebimentoEsperado) {
        this.dataRecebimentoEsperado = dataRecebimentoEsperado;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getTipoReceita() {
        return tipoReceita;
    }

    public void setTipoReceita(String tipoReceita) {
        this.tipoReceita = tipoReceita;
    }
    public Contas getContaReceita() {
        return contaReceita.consultarContas(this.numeroConta);
    }

    public void setContaReceita(Contas contaReceita) {
        this.contaReceita = contaReceita;
    }
    public int getNumeroConta() {
        return numeroConta;
    }

    public void setNumeroConta(Integer numeroConta) {
        this.numeroConta = numeroConta;
    }

           
}
