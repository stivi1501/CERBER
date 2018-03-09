package CERBER;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

public class PingCMD {
	private static String n ="20";
	private static String dest ="";
	private static String minping;
	private static String maxping;
	private static String aveping;
	private static String sent;
	private static String receive;
	private static String lost;
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
    	} catch (IOException e) {e.printStackTrace();} 
    	//aveping=out;
    	if (out!=null)
    	{
    	if (out.contains("Please check the name and try again")==false) 
    	if (out.contains("Request timed out")==false) 
    	{	
    		aveping	=(out.substring(out.indexOf("Ave")		,out.length()))				 .replace("Average = ","")		.replace("ms", "").replace(" ", "");
    		maxping	=(out.substring(out.indexOf("Maxim")	,out.indexOf("Ave"))		 .replace("Maximum = ","")		.replace("ms", "").replace(" ", "").replace(",",""));
    		minping	=(out.substring(out.indexOf("Mini")		,out.indexOf("Maxim"))		 .replace("Minimum = ","")		.replace("ms", "").replace(" ", "").replace(",",""));
    		sent	=(out.substring(out.indexOf("Sent =")	,out.indexOf(", Received =")).replace("Sent =", "")			.replace(" ", ""));
    		receive	=(out.substring(out.indexOf("eceived ="),out.indexOf(", Lost ="))	 .replace("eceived =", "")		.replace(" ", ""));
    		lost	=(out.substring(out.indexOf(", Lost =")	,out.indexOf(" ("))			 .replace(", Lost =", "")		.replace(" ", ""));
    	}
    	else
    	{
        	aveping	="0";
        	maxping	="0";
        	minping	="0";
            sent	="0";
            receive	="0";
            lost	="0";

    	}
    	}
	}

	public static String GetDest() 			{if (dest!=null) {return dest;} else {return "puste";}};
	public static String GetMinping() 		{if (dest!=null) {return minping;} else {return "";}};
	public static String GetMaxping() 		{return maxping;};
	public static String GetAveping() 		{return aveping;};
    public static String GetSent() 			{return sent;};
	public static String GetReceive() 		{return receive;};
	public static String GetLost() 			{return lost;};
	
	
}
