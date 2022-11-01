using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP09.Models;
using System.IO;
using Microsoft.AspNetCore.Hosting;

namespace Tp09.Controllers;

public class HomeController : Controller
{
    private IWebHostEnvironment Environment;

    public HomeController(IWebHostEnvironment environment)
    {
        Environment = environment;
    }

    public IActionResult Index()
    {
        ViewBag.tracks = DB.ListarTracks();
        return View();
    }

    public IActionResult VerDetalleTrack(int id)
    {
        ViewBag.images = DB.BuscarFotosTrackxId(id);
        ViewBag.vueltas = DB.ListarVueltasxTrack(id);
        return View();
    }

    [HttpPost]
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
        return Json(new{pais=p, logo="/flags/"+p.Code+".png", flag="/flags-medium/"+p.Code+".png"});
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
