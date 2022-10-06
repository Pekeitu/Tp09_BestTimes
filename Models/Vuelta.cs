namespace TP09.Models;
public class Vuelta
{
    public int Id{get;}
    public int IdTrack{get;set;}
    public int IdConductor{get;set;}
    public DateTime Tiempo{get:set;}
    public Date Fecha{get;set;}
    public int IdAuto{get;set;}

    public Vuelta(){
        Id=-1;
        IdTrack=-1;
        IdConductor=-1;
        Tiempo= new Date(1, 1, 1);
        Fecha= new Date(1, 1, 1);
        IdAuto=-1;
    }

    public Vuelta (int pId, int Tid, int Cid, DateTime Time, Date date, int Aid){
        Id = pId;
        IdTrack = Tid;
        IdConductor = Cid;
        Tiempo = Time;
        Fecha = date;
        idAuto = Aid;
    }
}