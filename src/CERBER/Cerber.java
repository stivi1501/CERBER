package CERBER;

public class Cerber  {
    public static PP zad = new PP();	
    static int ActiveThread=0;
 
    
    public static void main(String[] args) {
  
         JdbcConect.jdbc_plan_cerber_proc();    
         
        int maksp=JdbcConect.jdbc_count_dop(); //ile jest do zrobienia wszystkich z pingiem
        int makss=JdbcConect.jdbc_count_dos(); //ile jest do zrobienia wszystkich z socketem
        int maks=makss+maksp;

        
        Runnable[] runners = new Runnable[maks];
        Thread[]   threads = new   Thread[maks];
        


        for(int i=0; i<=maks; i++) 
         {
            zad=JdbcConect.jdbc_PPOnId(i+1);
        	if (zad.ip!="") 
        	{
        		try {Thread.sleep(100);} catch (InterruptedException e) {e.printStackTrace();}
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
    }
	
}
