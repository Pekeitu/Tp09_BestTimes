namespace TP09.Models;

public class Pais{
    public int Id{get;}
    public string Nombre {get;}
    public string Code{get;}

    public Pais(){
        Id=-1;
        Nombre="";
        Code="";
    }

    public Pais(int idPais, string nom, string cod){
        Id=idPais;
        Nombre = nom;
        Code=cod;
    }
}