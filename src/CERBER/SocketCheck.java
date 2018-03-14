package CERBER;

import java.io.*;
import java.net.*;

public class SocketCheck {
   public static boolean check(String host, int port) {
      BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
      PrintStream out = System.out;   	
      boolean ok_no=false;
      try {
         Socket c = new Socket(host,port);//String host, int port
         c.setKeepAlive(true);
         ok_no=false;
         printSocketInfo(c);
         BufferedWriter w = new BufferedWriter(new OutputStreamWriter(c.getOutputStream()));
         BufferedReader r = new BufferedReader(new InputStreamReader(c.getInputStream()));
         String m = null;
     
         System.out.print(host+":"+port+"");
         while ((m=r.readLine())!= null) 
         {
            out.println(m);
            m = in.readLine();
            w.write(m,0,m.length());
            w.newLine();
            w.flush();
         }
         w.close();
         r.close();
         c.close();
      } catch (IOException e) {
         //System.err.println(e.toString());
    	  ok_no=false;
         System.out.println(host+":"+port+">>Brak polaczenia");
         //System.out.println(e.toString());
      }
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