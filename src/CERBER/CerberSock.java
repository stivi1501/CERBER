package CERBER;

public class CerberSock extends SocketCheck  implements Runnable{
	private PP zadanie=  new PP();
	int id;
	int maks;
	//PingRes pinres;
	JdbcConect jc;
	
    public CerberSock(int id,PP zz,int maks) 
    {this.id = id;
	 this.zadanie=zz;
	 this.maks=maks;
	 }
    public PP GetZadanie() {return zadanie;};

public void run() 
{
	zadanie=GetZadanie();
	if (SocketCheck.check(zadanie.ip,Integer.parseInt(zadanie.nn)))
	{
		jc.jdbc_reqest_sock_insert(zadanie.ip,Integer.parseInt(zadanie.nn), 1);
	}
	else
	{
		jc.jdbc_reqest_sock_insert(zadanie.ip,Integer.parseInt(zadanie.nn), 0);	
	};		
	JdbcConect.jdbc_reqest_cerber_update2(zadanie.ip,zadanie.unix_start,"s");
}	
}
