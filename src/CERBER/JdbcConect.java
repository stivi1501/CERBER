package CERBER;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 


public class JdbcConect {

static String daneZBazy;

public static PingPocket jdbc_reqest_ip_ping() {
PingPocket ResultIp = new PingPocket();
String r1 = "";
String r2 = "";

String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
String query = "Select * FROM ping_plan where status=0 and unix_start<now() order by unix_start limit 2";         
Connection conn = null;           
try {
     conn = DriverManager.getConnection(polaczenieURL);
      Class.forName("com.mysql.jdbc.Driver");
      Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery(query);
      while (rs.next()) 
          {
    	  r1=rs.getString(1);
    	  r2=rs.getString(2);
    	//  System.out.println(r1);
    	//  System.out.println(r2);
    	  }
     conn.close();
}
catch(ClassNotFoundException wyjatek) {System.out.println("Problem ze sterownikiem");}
catch(SQLException wyjatek) {
	                         System.out.println("SQLException: " + wyjatek.getMessage());
	                         System.out.println("SQLState: "     + wyjatek.getSQLState());
	                         System.out.println("VendorError: "  + wyjatek.getErrorCode());
	                        }
ResultIp.setip(r1);
ResultIp.setpocket(r2);

		return ResultIp;

}
/*
static void wyswietlDaneZBazy(ResultSet rs)
{
try{
	daneZBazy = rs.getString(1); System.out.println("\n" + daneZBazy + " ");
	daneZBazy = rs.getString(2); System.out.println(daneZBazy + " ");
	daneZBazy = rs.getString(4); System.out.println(daneZBazy);
   }   
 catch(SQLException e) {e.printStackTrace();}
}   
*/        
}