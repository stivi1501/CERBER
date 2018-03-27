package CERBER;

public class CerberPing extends PingCMD  implements Runnable{
	private PP zadanie=  new PP();
	int id;
	int maks;
	PingRes pinres;
	JdbcConect jc;
	String time_cmd;
	
    public CerberPing(int id,PP zz,int maks) 
    {this.id = id;
	 this.zadanie=zz;
	 this.maks=maks;
	 }
    public PP GetZadanie() {return zadanie;};

public void run() 
{
	zadanie=GetZadanie();
    PingExe(zadanie.ip,zadanie.nn);
    jc.jdbc_reqest_cerber_update2(zadanie.getip(), zadanie.gettime_cmd(),zadanie.gettask());
    pinres=GetPingRes();
    pinres.time_cmd=zadanie.gettime_cmd();
    pinres.time_res=zadanie.gettime_res();
      
    
    jc.add_PingRes(pinres);
    jc.JdbcConect_pingresult(maks);
}	

}
