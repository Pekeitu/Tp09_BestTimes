namespace TP09.Models;

public class Piloto {
    public int Id {get;}
    public string Nombre{get;set;}
    public string IdPais{get;set;}
    public string Foto{get;set;}

    public Piloto(){
        Id = -1;
        Nombre = IdPais = Foto = "";
    }

    public Piloto(int pId, string pNombre, string pIdPais, string pFoto){
        Id = pId;
        Nombre = pNombre;
        IdPais = pIdPais;
        Foto = pFoto;
    }
}