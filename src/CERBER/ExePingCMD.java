package CERBER;

import java.io.IOException;

public class ExePingCMD {
	static PingCMD Pin;
	static JdbcConect jc;
	static SocketCheck sc;
	static PingPocket pp=  new PingPocket();

	
public static void main(String[] args)
{   
	JdbcConect.jdbc_reqest_cerber_proc();
    if (JdbcConect.jdbc_reqest_cerber_count_status_1("p")==1)
	{
	pp=JdbcConect.jdbc_reqest_ip_ping();
	JdbcConect.jdbc_reqest_cerber_update1(pp.ip,pp.unix_start,"p");
	PingCMD.PingExe(pp.ip,pp.nn);
	JdbcConect.jdbc_reqest_ping_insert(PingCMD.GetDest(),PingCMD.GetMinping(),PingCMD.GetMaxping(),PingCMD.GetAveping(),PingCMD.GetSent(),PingCMD.GetReceive(),PingCMD.GetLost(),PingCMD.GetUnreach(),PingCMD.GetErro());
	JdbcConect.jdbc_reqest_cerber_update2(pp.ip,pp.unix_start,"p");
	};

	
	JdbcConect.jdbc_reqest_cerber_proc();
    if (JdbcConect.jdbc_reqest_cerber_count_status_1("s")==1)
	{
    System.out.println("*****************************");
	pp=JdbcConect.jdbc_reqest_ip_sock();
	System.out.println(pp.ip);
	
	JdbcConect.jdbc_reqest_cerber_update1(pp.ip,pp.unix_start,"s");
	if (SocketCheck.check(pp.ip,Integer.parseInt(pp.nn)))
	{
		JdbcConect.jdbc_reqest_sock_insert(pp.ip,Integer.parseInt(pp.nn), 1);
	}
	else
	{
		JdbcConect.jdbc_reqest_sock_insert(pp.ip,Integer.parseInt(pp.nn), 0);	
	};		
	JdbcConect.jdbc_reqest_cerber_update2(pp.ip,pp.unix_start,"s");
	};

}
	
}
