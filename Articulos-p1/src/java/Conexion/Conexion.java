package Conexion;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Conexion {
    
    private static Connection con;
    
    private static String url="jdbc:mysql://192.168.64.2/articulos";    
    private static String driver="com.mysql.jdbc.Driver";
    private static String user="testing";
    private static String pass="123";
    static Date fechaActual = new Date();


    public static Connection openConection() throws ClassNotFoundException, SQLException{
        if(con == null){
            Class.forName( driver );
            con = DriverManager.getConnection(url,user,pass);
        }
        return con;
    }
    
    public static void closeConection() throws SQLException{
         if(con != null ){
             con.close();
         }
         con = null;
    }    
    public static String getId(){
        try {
            String sql = "SELECT UUID()";
            Statement st = Conexion.openConection().createStatement();
            ResultSet rs = st.executeQuery(sql);

            String id="";
            while(rs.next()){
                id=rs.getString("UUID()");
            }
            
            return id;
            
        } catch (Exception e) {
            return e.getMessage();
        }
    }
    
    public static String getDateNow(){
        try {
            String sql = "SELECT CURDATE()";
            Statement st = Conexion.openConection().createStatement();
            ResultSet rs = st.executeQuery(sql);

            String now="";
            while(rs.next()){
                now=rs.getString("CURDATE()");
            }
            
            return now;
            
        } catch (Exception e) {
            return e.getMessage();
        }
    }
    
    public static void main(String[] args) {
        
        try {
            System.out.println(openConection());
            System.out.println("open"+"\n"+getId()+"\n"+new SimpleDateFormat("yyyy-MM-dd").format(fechaActual));
        } catch (Exception e) {
            System.err.println(e.getMessage());
            System.out.println("close");
        }
        
    }
}
