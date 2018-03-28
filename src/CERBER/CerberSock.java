package CERBER;

public class CerberSock extends SocketCheck  implements Runnable{
	private PP zadanie=  new PP();
	int id;
	int maks;
	SockRes socres=new SockRes();
	JdbcConect jc;
	
    public CerberSock(int id,PP zz,int maks) 
    {
     this.id = id;
	 this.zadanie=zz;
	 this.maks=maks;
	 }
    public PP GetZadanie() {return zadanie;};

public void run() 
{
	zadanie=GetZadanie();
	socres.dest=zadanie.ip;
	socres.n= Integer.parseInt(zadanie.nn);
	socres.ok_no= SocketCheck.check(zadanie.ip,Integer.parseInt(zadanie.nn));
	socres.time_cmd=zadanie.time_cmd;
	socres.time_res=zadanie.time_res;
	JdbcConect.jdbc_reqest_cerber_update2(zadanie.getip(),zadanie.gettime_cmd(),zadanie.gettime_res(),"s");
	jc.add_SockRes(socres);
	jc.JdbcConect_sockresult(maks);;
}	
}
