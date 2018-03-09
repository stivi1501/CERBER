package CERBER;

public class ExePingCMD {
	static PingCMD Pin;
	
public static void main(String[] args) 
{
	PingCMD.PingExe("192.168.1.254","4");
	System.out.println(PingCMD.GetDest());
	System.out.println(PingCMD.GetMinping());
	System.out.println(PingCMD.GetMaxping());
	System.out.println(PingCMD.GetAveping());
	System.out.println(PingCMD.GetSent());
	System.out.println(PingCMD.GetReceive());
	System.out.println(PingCMD.GetLost());
}
	
}
