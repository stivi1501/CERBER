package CERBER;

import CERBER.PingCMD;

public class ping_main {
	static PingCMD tc;
    public static void main(String[] args) 
    {
    	String aim="onet.pl";
    	PingCMD.PingExe(aim,"4");
    	System.out.println(PingCMD.GetDest());
    	System.out.println(PingCMD.GetMinping());
    	System.out.println(PingCMD.GetMaxping());
    	System.out.println(PingCMD.GetAveping());
    	System.out.println(PingCMD.GetSent());
    	System.out.println(PingCMD.GetReceive());
    	System.out.println(PingCMD.GetLost());
    }
    
}
