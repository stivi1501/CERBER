package CERBER;

public class ExePingCMD {
	static PingCMD Pin;
	static JdbcConect jc;
	static PingPocket pp=  new PingPocket();

	
public static void main(String[] args) 
{   JdbcConect.jdbc_reqest_ip_ping_proc();
    if (JdbcConect.jdbc_reqest_ip_ping_count_status_1()==1)
	{
	pp=JdbcConect.jdbc_reqest_ip_ping();
	JdbcConect.jdbc_reqest_ip_ping_update1(pp.ip,pp.unix_start);
	PingCMD.PingExe(pp.ip,pp.pocket);

	JdbcConect.jdbc_reqest_ip_ping_insert(PingCMD.GetDest(),PingCMD.GetMinping(),PingCMD.GetMaxping(),PingCMD.GetAveping(),PingCMD.GetSent(),PingCMD.GetReceive(),PingCMD.GetLost(),PingCMD.GetUnreach(),PingCMD.GetErro());

	JdbcConect.jdbc_reqest_ip_ping_update2(pp.ip,pp.unix_start);
	};
	System.out.println("IP "+PingCMD.GetDest());
	System.out.println("Min "+PingCMD.GetMinping());
	System.out.println("Max "+PingCMD.GetMaxping());
	System.out.println("Ave "+PingCMD.GetAveping());
	System.out.println("Sen "+PingCMD.GetSent());
	System.out.println("Rec "+PingCMD.GetReceive());
	System.out.println("Los "+PingCMD.GetLost());
	System.out.println("Unr "+PingCMD.GetUnreach());	
	System.out.println("Err "+PingCMD.GetErro());
	
}
	
}
