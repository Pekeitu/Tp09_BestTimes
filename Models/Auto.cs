namespace TP09.Models;

public class Auto{
    public int Id{get;}
    public string Nombre {get;}
    public float Torque{get;}
    public float HP{get;}
    public float Peso{get;}
    public string Categoria{get;}
    public DateTime Anno{get;}
    public string Foto{get;}

    public Auto(){
        Id=-1;
        Nombre="";
        Torque=-1;
        HP=-1;
        Peso=-1;
        Categoria="";
        Anno=new DateTime(1, 1, 1);
        Foto="";
    }

    public Auto(int idAuto, string nom, float tor, float cv, float pes, string cat, DateTime yr, string fot){
        Id=idAuto;
        Nombre = nom;
        Torque=tor;
        HP=cv;
        Peso = pes;
        Categoria = cat;
        Anno= yr; 
        Foto=fot;
    }
}