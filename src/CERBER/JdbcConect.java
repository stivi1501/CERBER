package CERBER;
 

import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class JdbcConect {
	static List<PingRes> lista1 = new ArrayList<PingRes>(); //lista pusta
	static List<SockRes> lista2 = new ArrayList<SockRes>(); //lista pusta


public static void JdbcConect_pingresult(int  maks)
{
	if (lista1.size()>(maks-1))
	for(int i=0; i<lista1.size(); i++) {jdbc_plan_cerber_ping(lista1.get(i));};
}

public static void JdbcConect_sockresult(int  maks)
{
	//System.out.println("KONIEC : "+maks);
	if (lista2.size()>(maks-1))
	for(int i=0; i<lista2.size(); i++)
	{
		jdbc_plan_cerber_sock(lista2.get(i));
	};
	//if (lista2.size()>(maks-1)) {System.out.println("KONIEC");}; 
}

public static void add_PingRes(PingRes oo)
{
	lista1.add(oo);	
}

public static void add_SockRes(SockRes oo)
{
	lista2.add(oo);	
}
public static void jdbc_reqest_cerber_update1(String ip,String time_cmd,String typee) 
{
	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "update cerber_plan set status=1 where ip='"+ip+"' AND time_cmd='"+time_cmd+"' AND type='"+typee+"'";         
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
public static void jdbc_reqest_cerber_update2(String ip,String time_cmd,String time_res,String typee) 
{
	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "update cerber_plan set status=2,time_res='"+time_res+"' where ip='"+ip+"' AND time_cmd='"+time_cmd+"' AND type='"+typee+"'";        
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
public static void jdbc_plan_cerber_ping(PingRes pr) 
{
	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "CALL save_res_ping('"+pr.dest+"',"+pr.minping+","+pr.maxping+","+pr.aveping+","+pr.sent+","+pr.receive+","+pr.lost+","+pr.unreachable+","+pr.erro+",'"+pr.time_cmd+"','"+pr.time_res+"');";                 
	//System.out.println(query);
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
public static void jdbc_plan_cerber_sock(SockRes pr) 
{
	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
//	String query = "INSERT INTO socket_results(ip,port,ok_no,time_cmd,time_res) SELECT '"+pr.dest+"',"+pr.n+","+pr.ok_no+",'"+pr.time_cmd+"','"+pr.time_res+"'";         
	String query = "CALL save_res_sock('"+pr.dest+"',"+pr.ok_no+",'"+pr.time_cmd+"','"+pr.time_res+"')";         

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

public static void jdbc_plan_cerber_proc() 
{
	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "CALL cerber_plan_proc()";         
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

public static PP jdbc_PPOnId(int ii) {
		PP ResultIp = new PP();
		String r1 = "";
		String r2 = "";
		String r3 = "";
		String r4 = "";		
		String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
		//String query = "Select ip,nn,time_cmd,type FROM cerber_plan_temp where id="+ii+" limit 1"; 
		//Select ip,nn,time_cmd,type FROM cerber_plan_temp t1,cerber_plan_lp t2 where id=70-min_lp AND t1.lp=t2.lp limit 1
		String query = "Select ip,nn,time_cmd,type FROM cerber_plan_temp t1,cerber_plan_lp t2 where id="+ii+" -min_lp AND t1.lp=t2.lp  ORDER BY type desc,ip  limit 1"; 
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
		    	  r4=rs.getString(4);		    	  
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
		ResultIp.settime_cmd(r3);
		ResultIp.settask(r4);
		return ResultIp;
	} 

public static int jdbc_count_dop() {
	int ResultIp;
	String r1 = "";	
	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "Select dop FROM cerber_setings";         
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
	ResultIp=Integer.parseInt(r1);

	return ResultIp;
} 
public static int jdbc_count_dos() {
	int ResultIp;
	String r1 = "";	
	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "Select dos FROM cerber_setings";         
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
	ResultIp=Integer.parseInt(r1);

	return ResultIp;
} 
public static void jdbc_reqest_ping_insert(PingRes pr) 
{
	String polaczenieURL = "jdbc:mysql://localhost/CERBER?user=root&password=";
	String query = "INSERT INTO ping_results(ip,minping,maxping,aveping,sent,receive,lost,unreachable,err) SELECT '"+pr.dest+"',"+pr.minping+","+pr.maxping+","+pr.aveping+","+pr.sent+","+pr.receive+","+pr.lost+","+pr.unreachable+","+pr.erro+"";         
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