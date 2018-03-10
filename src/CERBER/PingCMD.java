package CERBER;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class PingCMD {
	private static String n ="4";
	private static String dest ="";
	private static String minping="0";
	private static String maxping="0";
	private static String aveping="0";
	private static String sent="0";
	private static String receive="0";
	private static String lost="0";
	private static String erro="0";
	private static String unreachable ="0";
/*	
public static void main(String[] args) 
{
	PingCMD.PingExe("onet.pl","4");
	System.out.println(GetDest());
	System.out.println(GetMinping());
	System.out.println(GetMaxping());
	System.out.println(GetAveping());
	System.out.println(GetSent());
	System.out.println(GetReceive());
	System.out.println(GetLost());
}
*/
	public static  void PingExe(String ipdes,String nn)
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
    	    System.out.println(out);
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

	public static String GetDest() 			   {if (dest!=null) {return dest;} else {return "puste";}};
	public static String GetMinping() 		   {if (dest!=null) {return minping;} else {return "";}};
	public static String GetMaxping() 		   {return maxping;};
	public static String GetAveping() 		   {return aveping;};
	public static String GetSent() 			   {return sent;};
	public static String GetUnreach() 		   {return unreachable;};
	public static String GetReceive() 		   {return receive;};
	public static String GetLost() 			   {return lost;};
	public static String GetErro() 			   {return erro;};
	
	public static String CountStringInString(String przy,String fin) 
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
		System.out.println(coun);
		return Integer.toString(coun);
	}; 
	
}
