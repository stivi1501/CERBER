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

	public static  void PingExe(String ipdes,String nn)
	{    	
		n=nn;
		String command = "ping "+ipdes+" -n "+n;
	    String out = "";
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
    	dest=ipdes;
    	;
    	if (out!=null)
    	{	
    	aveping	=(out.substring(out.indexOf("Ave")		,out.length()))				 .replace("Average = ","")		.replace("ms", "").replace(" ", "");
    	maxping	=(out.substring(out.indexOf("Maxim")	,out.indexOf("Ave"))		 .replace("Maximum = ","")		.replace("ms", "").replace(" ", "").replace(",",""));
    	minping	=(out.substring(out.indexOf("Mini")		,out.indexOf("Maxim"))		 .replace("Minimum = ","")		.replace("ms", "").replace(" ", "").replace(",",""));
        sent	=(out.substring(out.indexOf("Sent =")	,out.indexOf(", Received =")).replace("Sent =", "")			.replace(" ", ""));
        receive	=(out.substring(out.indexOf("eceived ="),out.indexOf(", Lost ="))	 .replace("eceived =", "")		.replace(" ", ""));
        lost	=(out.substring(out.indexOf(", Lost =")	,out.indexOf(" ("))			 .replace(", Lost =", "")		.replace(" ", ""));
    	}
	}

	public static String GetDest() 			{return dest;};
	public static String GetMinping() 		{return minping;};
	public static String GetMaxping() 		{return maxping;};
	public static String GetAveping() 		{return aveping;};
	public static String GetSent() 			{return sent;};
	public static String GetReceive() 		{return receive;};
	public static String GetLost() 			{return lost;};
	
	
}
