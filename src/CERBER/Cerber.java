package CERBER;

public class Cerber  {
    public static PP zad = new PP();	
    static int maksp=50;
    static int makss=50; 
    static int maks=makss+maksp; 
    public static void main(String[] args) {
        Runnable[] runners = new Runnable[maks];
        Thread[]   threads = new   Thread[maks];
        
        JdbcConect.jdbc_plan_cerber_proc();  
        if (maksp>JdbcConect.jdbc_count_dop())  {maksp=JdbcConect.jdbc_count_dop();};
        if (makss>JdbcConect.jdbc_count_dos())  {makss=JdbcConect.jdbc_count_dos();}; 
        //System.out.println("ppp"+JdbcConect.jdbc_count_dop());
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
