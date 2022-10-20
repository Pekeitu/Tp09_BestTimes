using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP09.Models;

namespace Tp09.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        ViewBag.tracks = DB.ListarTracks();
        return View();
    }

    public IActionResult VerDetalleTrack(int id)
    {
        ViewBag.images = DB.BuscarFotosTrackxId(id);
        ViewBag.Vueltas = DB.ListarVueltasxTrack(id);
        return View();
    }

    public JsonResult BuscarTrackAjax(int IdTrack)
    {
        return Json(DB.BuscarTrack(IdTrack));
    }

    public JsonResult BuscarPaisAjax(string IdPais)
    {
        return Json(DB.BuscarPaisxId(IdPais));
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
