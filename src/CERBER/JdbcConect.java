package CERBER;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcConect {
	//static String daneZBazy;
	
public static PingPocket jdbc_reqest_ip_ping() {
	PingPocket ResultIp = new PingPocket();
	String r1 = "";
	String r2 = "";
	String r3 = "";

	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "Select ip,pocket_sent,unix_start FROM ping_plan where status=0 and unix_start<now() order by unix_start limit 1";         
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
	    	  r3=rs.getString(3);
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
	ResultIp.setunix_start(r3);
	return ResultIp;
}  

	
public static void jdbc_reqest_ip_ping_insert(String ip,String minping,String maxping,String aveping,String sent,String receive,String lost,String unreachable,String err) 
{
	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "INSERT INTO ping_results(ip,minping,maxping,aveping,sent,receive,lost,unreachable,err) SELECT '"+ip+"',"+minping+","+maxping+","+aveping+","+sent+","+receive+","+lost+","+unreachable+","+err;         
	Connection conn = null;           
	try {
	     conn = DriverManager.getConnection(polaczenieURL);
	      Class.forName("com.mysql.jdbc.Driver");
	      Statement stmt = conn.createStatement();
	      stmt.executeUpdate(query);
	     conn.close();
	}
	catch(ClassNotFoundException wyjatek) {System.out.println("Problem ze sterownikiem");}
	catch(SQLException wyjatek) {
		                         System.out.println("SQLException: " + wyjatek.getMessage());
		                         System.out.println("SQLState: "     + wyjatek.getSQLState());
		                         System.out.println("VendorError: "  + wyjatek.getErrorCode());
		                        }
}  	

public static void jdbc_reqest_ip_ping_update1(String ip,String unix_start) 
{
	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "update ping_plan set status=1 where ip='"+ip+"' AND unix_start="+unix_start+"";         
	Connection conn = null;           
	try {
	     conn = DriverManager.getConnection(polaczenieURL);
	      Class.forName("com.mysql.jdbc.Driver");
	      Statement stmt = conn.createStatement();
	      stmt.executeUpdate(query);
	     conn.close();
	}
	catch(ClassNotFoundException wyjatek) {System.out.println("Problem ze sterownikiem");}
	catch(SQLException wyjatek) {
		                         System.out.println("SQLException: " + wyjatek.getMessage());
		                         System.out.println("SQLState: "     + wyjatek.getSQLState());
		                         System.out.println("VendorError: "  + wyjatek.getErrorCode());
		                        }
}  	
public static void jdbc_reqest_ip_ping_update2(String ip,String unix_start) 
{
	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "update ping_plan set status=2 where ip='"+ip+"' AND unix_start="+unix_start+"";         
	Connection conn = null;           
	try {
	     conn = DriverManager.getConnection(polaczenieURL);
	      Class.forName("com.mysql.jdbc.Driver");
	      Statement stmt = conn.createStatement();
	      stmt.executeUpdate(query);
	     conn.close();
	}
	catch(ClassNotFoundException wyjatek) {System.out.println("Problem ze sterownikiem");}
	catch(SQLException wyjatek) {
		                         System.out.println("SQLException: " + wyjatek.getMessage());
		                         System.out.println("SQLState: "     + wyjatek.getSQLState());
		                         System.out.println("VendorError: "  + wyjatek.getErrorCode());
		                        }
}  	
}