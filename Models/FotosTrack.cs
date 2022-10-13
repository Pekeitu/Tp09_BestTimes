namespace TP09.Models;

public class FotosTrack
{
    public int Id{get;}
    public int IdTrack{get;set;}
    public string Foto{get;set;}

    public FotosTrack()
    {
        Id = IdTrack = -1;
        Foto = "";
    }

    public FotosTrack(int pId, int pIdTrack, string pFoto)
    {
        Id = pId;
        IdTrack = pIdTrack;
        Foto = pFoto;
    }
}