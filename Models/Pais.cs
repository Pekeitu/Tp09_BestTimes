namespace TP09.Models;

public class Pais{
    public string Id{get;}
    public string Nombre {get;}
    public string Code{get;}

    public Pais(){
        Id="";
        Nombre="";
        Code="";
    }

    public Pais(string idPais, string nom, string cod){
        Id=idPais;
        Nombre = nom;
        Code=cod;
    }
}