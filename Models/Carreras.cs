using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace TP09.Models;

public class Resultado
{
    [JsonPropertyName("number")]
    public string numeroConductor { get; set; }

    [JsonPropertyName("position")]
    public string posicionFinal { get; set; }

    //Parece ser una copia de posicionText
    //public string positionText { get; set; }
    [JsonPropertyName("points")]
    public string puntaje { get; set; }

    [JsonPropertyName("Driver")]
    public Conductor conductor { get; set; }

    [JsonPropertyName("Constructor")]
    public Constructor constructor { get; set; }

    [JsonPropertyName("grid")]
    public string posicionParrilla { get; set; }

    [JsonPropertyName("laps")]
    public string vueltas { get; set; }

    [JsonPropertyName("status")]
    public string estado { get; set; }

    [JsonPropertyName("time")]
    public Tiempo tiempo { get; set; }

    [JsonPropertyName("FastestLap")]
    public VueltaRapida vueltaRapida { get; set; }
}

public class Carrera
{
    [JsonPropertyName("season")]
    public string temporada { get; set; }

    [JsonPropertyName("round")]
    public string ronda { get; set; }

    public string url { get; set; }

    public string raceName { get; set; }

    [JsonPropertyName("Circuit")]
    public Track track { get; set; }

    [JsonPropertyName("date")]
    public string fecha { get; set; }

    [JsonPropertyName("time")]
    public string hora { get; set; }

    [JsonPropertyName("Results")]
    public List<Resultado> resultados { get; set; }
}

public class Carreras
{
    [JsonPropertyName("season")]
    public string temporada { get; set; }

    [JsonPropertyName("circuitId")]
    public string nombreCircuito { get; set; }

    [JsonPropertyName("Races")]
    public List<Carrera> carreras { get; set; }
}

public class TablaCarreras : StandardResponse
{

    [JsonPropertyName("RaceTable")]
    public Carreras obj { get; set; }
}
