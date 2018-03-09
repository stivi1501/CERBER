package CERBER;

public class ExePingCMD {
	static PingCMD Pin;
	static JdbcConect jc;
	static PingPocket pp=  new PingPocket();
	
public static void main(String[] args) 
{
	pp=JdbcConect.jdbc_reqest_ip_ping();
	
	System.out.println(pp.ip);
	
	PingCMD.PingExe(pp.ip,pp.pocket);
	System.out.println(PingCMD.GetDest());
	System.out.println(PingCMD.GetMinping());
	System.out.println(PingCMD.GetMaxping());
	System.out.println(PingCMD.GetAveping());
	System.out.println(PingCMD.GetSent());
	System.out.println(PingCMD.GetReceive());
	System.out.println(PingCMD.GetLost());
	
}
	
}
