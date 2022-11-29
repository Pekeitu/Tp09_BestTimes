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
    static List<dynamic> listaTracksxNombre; //cache

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

    public List<string> ListarAñosConduccion(string IdT)
    {
        string json = Get("https://ergast.com/api/f1/circuits/" + IdT + "/results/1.json?limit=1000");
        List<Carrera> carreras = parseResponse<TablaCarreras>(json).obj.carreras;
        List<string> annos = new List<string>();
        foreach(Carrera c in carreras)
        {
            annos.Add(c.temporada);
        }
        return annos;
    }

    [HttpPost]
    public Carrera BuscarCarreraxAno(string IdT, string anno)
    {
        string json = Get("https://ergast.com/api/f1/" + anno + "/circuits/" + IdT + "/results.json?limit=1000");
        var carrera = parseResponse<TablaCarreras>(json).obj.carreras[0];
        return carrera;
    }

    public IActionResult VerDetalleTrack(string IdT)
    {
        List<string> annos = ListarAñosConduccion(IdT);
        Carrera ultimaCarrera = BuscarCarreraxAno(IdT, annos.Last());
        ViewBag.annosCorridos = annos;
        ViewBag.ultimaCarrera = ultimaCarrera;
        return View();
    }

    public JsonResult listarTracksxNombre()
    {
        if(listaTracksxNombre != null) return Json(listaTracksxNombre);
        listaTracksxNombre = new List<dynamic>();
        foreach(Track t in tracks)
        {
            var element = new {t.nombre, t.id};
            listaTracksxNombre.Add(element);
        }
        return Json(listaTracksxNombre);
    }

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
