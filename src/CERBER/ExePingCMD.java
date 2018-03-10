package CERBER;

public class ExePingCMD {
	static PingCMD Pin;
	static JdbcConect jc;
	static PingPocket pp=  new PingPocket();
    static String przy="Pinging 192.168.1.3 with 32 bytes of data:Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Reply from 192.168.1.1: Destination host unreachable.Ping statistics for 192.168.1.3:    Packets: Sent = 20, Received = 20, Lost = 0 (0% loss)";
    static int leng;
    static int ra;
    static String coun;
	
public static void main(String[] args) 
{
	pp=JdbcConect.jdbc_reqest_ip_ping();	
	PingCMD.PingExe(pp.ip,pp.pocket);
	JdbcConect.jdbc_reqest_ip_ping_insert(PingCMD.GetDest(),PingCMD.GetMinping(),PingCMD.GetMaxping(),PingCMD.GetAveping(),PingCMD.GetSent(),PingCMD.GetReceive(),PingCMD.GetLost(),PingCMD.GetUnreach(),PingCMD.GetErro());

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
