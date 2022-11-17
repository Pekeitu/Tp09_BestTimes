using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace TP09.Models;

public class Carrera
{
    [JsonPropertyName("season")]
    public string temporada {get;set;}
    [JsonPropertyName("round")]
    public string ronda {get;set;}
    public string url {get;set;}
    public string raceName {get;set;}
    [JsonPropertyName("Circuit")]
    public Track track {get;set;}
    [JsonPropertyName("date")]
    public string fecha {get;set;}
    [JsonPropertyName("time")]
    public string hora {get;set;}
    //[JsonPropertyName("results")]
    //List<Resultado> resultados {get;set;}
}

public class Carreras
{
    [JsonPropertyName("Races")]
    List<Carrera> carreras {get;set;}
}

public class TablaCarreras : StandardResponse
{
    [JsonPropertyName("season")]
    public string temporada {get;set;}

    [JsonPropertyName("circuitId")]
    public string nombreCircuito;

    [JsonPropertyName("RaceTable")]
    public Carreras obj {get;set;}
}
