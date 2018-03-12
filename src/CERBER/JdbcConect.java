package CERBER;
 
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcConect {
public static PingPocket jdbc_reqest_ip_ping() {
		PingPocket ResultIp = new PingPocket();
		String r1 = "";
		String r2 = "";
		String r3 = "";
		String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
		String query = "Select ip,nn,unix_start FROM cerber_plan where status=0 and unix_start<now() and type='p' order by unix_start limit 1";         
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
		    	  //System.out.println(r1);
		    	  //System.out.println(r2);
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
		ResultIp.setnn(r2);
		ResultIp.setunix_start(r3);
		return ResultIp;
	}  
public static PingPocket jdbc_reqest_ip_sock() {
	System.out.println("*****************************");
		PingPocket ResultIp = new PingPocket();
		String r1 = "";
		String r2 = "";
		String r3 = "";
		String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
		String query = "Select ip,nn,unix_start FROM cerber_plan where status=0 and unix_start<now() and type='s' order by unix_start limit 1";         
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
		ResultIp.setnn(r2);
		ResultIp.setunix_start(r3);
		return ResultIp;
	}  
public static int jdbc_reqest_cerber_count_status_1(String typee) {
	int Result = 0;
	String r1 = "";


	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "Select (CASE WHEN '"+typee+"'='s' THEN dos ELSE dop END) do from cerber_setings";         

	Connection conn = null;           
	try {
	     conn = DriverManager.getConnection(polaczenieURL);
	      Class.forName("com.mysql.jdbc.Driver");
	      Statement stmt = conn.createStatement();
	      ResultSet rs = stmt.executeQuery(query);
	      while (rs.next()) 
	          {
	    	  r1=rs.getString(1);
	    	  }
	     conn.close();
	}
	catch(ClassNotFoundException wyjatek) {System.out.println("Problem ze sterownikiem");}
	catch(SQLException wyjatek) {
		                         System.out.println("SQLException: " + wyjatek.getMessage());
		                         System.out.println("SQLState: "     + wyjatek.getSQLState());
		                         System.out.println("VendorError: "  + wyjatek.getErrorCode());
		                        }
	;
    Result=Integer.parseInt(r1);
	return Result;
}  
public static void jdbc_reqest_ping_insert(String ip,String minping,String maxping,String aveping,String sent,String receive,String lost,String unreachable,String err) 
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
public static void jdbc_reqest_sock_insert(String ipp,int portt,int ok_noo) 
{
	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "INSERT INTO socket_results(ip,port,ok_no) SELECT '"+ipp+"',"+portt+","+ok_noo+"";         
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
public static void jdbc_reqest_cerber_update1(String ip,String unix_start,String typee) 
{
	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "update cerber_plan set status=1 where ip='"+ip+"' AND unix_start="+unix_start+" AND type='"+typee+"'";         
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
public static void jdbc_reqest_cerber_update2(String ip,String unix_start,String typee) 
{
	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "update cerber_plan set status=2 where ip='"+ip+"' AND unix_start="+unix_start+" AND type='"+typee+"'";         
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
public static void jdbc_reqest_cerber_proc() 
{
	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "CALL cerber_update()";         
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