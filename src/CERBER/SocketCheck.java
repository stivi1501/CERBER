package CERBER;

import java.io.*;
import java.net.*;

public class SocketCheck {
   public static boolean check(String host, int port) {
      BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
      PrintStream out = System.out;   	
      boolean ok_no = true;
      
      try {
         Socket c = new Socket(host,port);//String host, int port
         c.setKeepAlive(true);
        // printSocketInfo(c);
      } catch (IOException e) {
    	  ok_no=false;
      }
      System.out.println("TCP na "+host+":"+port+">>"+ok_no);
      return ok_no;
   }
   private static void printSocketInfo(Socket s) {
      System.out.println("Remote address = "+s.getInetAddress().toString());
      System.out.println("Remote port = "+s.getPort());
      System.out.println("Local socket address = "+s.getLocalSocketAddress().toString());
      System.out.println("Local address = "+s.getLocalAddress().toString());
      System.out.println("Local port = "+s.getLocalPort());
   }
}