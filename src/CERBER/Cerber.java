package CERBER;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Cerber  {
    public static PP zad = new PP();	
    static int ActiveThread=0;
 
    
    public static void main(String[] args) {
  
         JdbcConnect.jdbc_plan_cerber_proc();    
         
        int maksp=JdbcConnect.jdbc_count_dop(); //ile jest do zrobienia wszystkich z pingiem
        int makss=JdbcConnect.jdbc_count_dos(); //ile jest do zrobienia wszystkich z socketem
        int maks=makss+maksp;
        
        System.out.println("Dozwolona ilosc pingow "+maksp);
        System.out.println("Dozwolona ilosc socketow "+makss);
        System.out.println("Dozwolona ilosc watkow "+maks);

        
        Runnable[] runners = new Runnable[maks];
        Thread[]   threads = new   Thread[maks];
        


        for(int i=0; i<=maks; i++) 
         {
            zad=JdbcConnect.jdbc_PPOnId(i+1);
            zad.time_res =datetime_now() ;
        	if (zad.ip!="") 
        	{
        		try {Thread.sleep(10);} catch (InterruptedException e) {e.printStackTrace();}
        		if (zad.task.equals("p")) 
        		 {
        		 runners[i] = new CerberPing(i,zad,maksp);
        		 }
            	else 
        		 {
        		   runners[i] = new CerberSock(i,zad,makss);
        		 };
        	};
        }       
        for(int i=0; i<maks; i++) {threads[i] = new Thread(runners[i]);}
        for(int i=0; i<maks; i++) {threads[i].start();}
        
        System.out.println("--------------------------------------------");
        System.out.println("Wszystkie watki utworzono ");
    }
	
    public static String datetime_now() 
    {
    	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    	LocalDateTime now = LocalDateTime.now();
    	//System.out.println(dtf.format(now));
    	return dtf.format(now);

    }  	
}
