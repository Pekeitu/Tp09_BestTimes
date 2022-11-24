using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP09.Models;
using System;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Text.Json;

namespace Tp09.Controllers;

public class HomeController : Controller
{
    static readonly HttpClient client = new HttpClient();

    private IWebHostEnvironment Environment;

    public HomeController(IWebHostEnvironment environment)
    {
        Environment = environment;
    }

    static List<Track> tracks;
    static List<string> listaTracksxNombre; //cache

    public string Get(string url)
    {
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        request.AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate;

        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
        using (Stream stream = response.GetResponseStream())
        using (StreamReader reader = new StreamReader(stream))
        {
            return reader.ReadToEnd();
        }
    }

    public T parseResponse<T>(string json)
    {
        return JsonSerializer.Deserialize<StandardResponseRoot<T>>(json).response;
    }

    public IActionResult Index()
    {
        if(tracks == null)
        {
            string json = Get("https://ergast.com/api/f1/circuits.json?limit=100");
            tracks = parseResponse<TrackTable>(json).obj.tracks;
        }
        ViewBag.tracks = tracks;
        return View();
    }

    public IActionResult VerDetalleTrack(string IdT)
    {
        string json = Get("https://ergast.com/api/f1/circuits/" + IdT + "/results.json?limit=1000");
        var listCarreras = parseResponse<TablaCarreras>(json).obj.carreras;
        ViewBag.carreras = listCarreras; //Siempre tenemos solamente una carrera
        return View();
    }

    public List<string> listarTracksxNombre()
    {
        if(listaTracksxNombre != null) return listaTracksxNombre;
        listaTracksxNombre = new List<string>();
        foreach(Track t in tracks) listaTracksxNombre.Add(t.nombre);
        return listaTracksxNombre;
    }

    /*[HttpPost]
    public JsonResult BuscarTrackAjax(int IdTrack)
    {
        return Json(DB.BuscarTrack(IdTrack));
    }

    [HttpPost]
    public JsonResult BuscarFotosTrackAjax(int IdTrack)
    {
        return Json(DB.BuscarFotosTrackxId(IdTrack));
    }

    [HttpPost]
    public JsonResult BuscarPaisAjax(string IdPais)
    {
        Pais p = DB.BuscarPaisxId(IdPais);
        //Asumimos que se utilizan las fotos proveidas, todas en formato png y ordenados por nombre (codigo) del pais
        return Json(new { pais = p, logo = "/flags/" + p.Code + ".png", flag = "/flags-medium/" + p.Code + ".png" });
    }*/

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
