package CERBER;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class PingCMD {
	private String n ="4";
	private String dest ="";
	private String minping="0";
	private String maxping="0";
	private String aveping="0";
	private String sent="0";
	private String receive="0";
	private String lost="0";
	private String erro="0";
	private String unreachable ="0";

	public void PingExe(String ipdes,String nn)
	{    	
		n=nn;
		String command = "ping "+ipdes+" -n "+n;
	    String out = "";
	    dest=ipdes;
	    boolean IsOk=false;
    	try 
    	{
    	    Process process = Runtime.getRuntime().exec(command);
    	    BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
    	    String line;
    	    while ((line = reader.readLine()) != null) 
    	    { 
    	    	IsOk=true;
    			if (IsOk==true) {out+=line;};
    		}
    	    System.out.println("Ping wyslany na "+ipdes);
    	} catch (IOException e) {e.printStackTrace();} 
    	if (out!=null)
    	{
    	if (out.contains("Ping statistics for ")==true) 
    	{

    		sent		=(out.substring(out.indexOf("Sent =")	,out.indexOf(", Received =")).replace("Sent =", "")			.replace(" ", ""));
    		receive		=(out.substring(out.indexOf("eceived ="),out.indexOf(", Lost ="))	 .replace("eceived =", "")		.replace(" ", ""));
    		lost		=(out.substring(out.indexOf(", Lost =")	,out.indexOf(" ("))			 .replace(", Lost =", "")		.replace(" ", ""));
    		unreachable	=CountStringInString(out, "unreachable");
    		
        	if (out.contains("Approximate")==true) 
        	{
            		aveping	=(out.substring(out.indexOf("Ave")		,out.length()))				 .replace("Average = ","")		.replace("ms", "").replace(" ", "");
            		maxping	=(out.substring(out.indexOf("Maxim")	,out.indexOf("Ave"))		 .replace("Maximum = ","")		.replace("ms", "").replace(" ", "").replace(",",""));
            		minping	=(out.substring(out.indexOf("Mini")		,out.indexOf("Maxim"))		 .replace("Minimum = ","")		.replace("ms", "").replace(" ", "").replace(",",""));
        	}
        	else
        	{
        		erro="2"; //"Destination host unreachable."
        	}
    	}
    	else
    	{
            erro	="1"; //"Request timed out" 
    	}
    	}
	}

	public String GetDest() 			   {if (dest!=null) {return dest;} else {return "puste";}};
	public String GetMinping() 		   {if (dest!=null) {return minping;} else {return "";}};
	public String GetMaxping() 		   {return maxping;};
	public String GetAveping() 		   {return aveping;};
	public String GetSent() 			   {return sent;};
	public String GetUnreach() 		   {return unreachable;};
	public String GetReceive() 		   {return receive;};
	public String GetLost() 			   {return lost;};
	public String GetErro() 			   {return erro;};
	
	public PingRes GetPingRes()
	{
		PingRes jj = new PingRes();
		jj.dest=dest; 
		jj.minping=minping;
		jj.maxping=maxping;
		jj.aveping=aveping;
		jj.sent=sent;
		jj.receive=receive;
		jj.unreachable=unreachable;
		jj.lost=lost;
		return jj;
	};
	
	public String CountStringInString(String przy,String fin) 
	{
		int leng;
		int ra;
		int coun=0;
		
		while (przy.contains(fin))
		{
		coun++;
		leng=przy.length();
		ra=przy.indexOf(fin)+fin.length();
		przy=przy.substring(ra, leng);
		}; 
		//System.out.println(coun);
		return Integer.toString(coun);
	}; 
	
}
