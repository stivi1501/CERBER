package CERBER;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 


public class JdbcConect {

static String daneZBazy;

public static void jdbc_reqest() {
String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
String query = "Select * FROM ping_plan where status=0";         
Connection conn = null;           
try {
     conn = DriverManager.getConnection(polaczenieURL);
      Class.forName("com.mysql.jdbc.Driver");
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery(query);
      while (rs.next()) {wyswietlDaneZBazy(rs);}
     conn.close();
}
catch(ClassNotFoundException wyjatek) {System.out.println("Problem ze sterownikiem");}
catch(SQLException wyjatek) {
	                         System.out.println("SQLException: " + wyjatek.getMessage());
	                         System.out.println("SQLState: "     + wyjatek.getSQLState());
	                         System.out.println("VendorError: "  + wyjatek.getErrorCode());
	                        }

}
static void wyswietlDaneZBazy(ResultSet rs)
{
try{
	daneZBazy = rs.getString(1); System.out.println("\n" + daneZBazy + " ");
	daneZBazy = rs.getString(2); System.out.println(daneZBazy + " ");
	daneZBazy = rs.getString(3); System.out.println(daneZBazy);
   }   
 catch(SQLException e) {e.printStackTrace();}
}           
}