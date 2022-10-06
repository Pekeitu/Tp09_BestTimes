namespace TP09.Models;

public class Track
{
    public int Id{get;}
    public string Nombre{get;set;}
    public float Longitud{get;set;}
    public string IdPais{get:set;}
    public Date FechaInauguracion{get;set;}
    public int IdFotos{get;}
    public string ImgLayout{get;set;}

    public Track(){
        Id = IdPais = IdFotos = -1;
        Nombre = IdPais = ImgLayout = "";
        Longitud = 0;
        FechaInauguracion = new Date(1990, 1, 1);
    }

    public Track(int pId, string pNombre, float pLongitud, string pIdPais, Date pFechaInauguracion, int pIdFotos, string pImgLayout){
        Id = pId;
        Nombre = pNombre;
        Longitud = pLongitud;
        idPais = pIdPais;
        FechaInauguracion = pFechaInauguracion;
        IdFotos = pIdFotos;
        ImgLayout = pImgLayout;
    }
}