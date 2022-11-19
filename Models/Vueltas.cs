using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace TP09.Models;

public class VelocidadPromedio
{
    [JsonPropertyName("units")]
    public string unidad { get; set; } //unidad (kph, mph)

    [JsonPropertyName("speed")]
    public string velocidad { get; set; }
}

public class Tiempo
{
    public string millis { get; set; }

    [JsonPropertyName("time")]
    public string tiempo { get; set; }
}

public class VueltaRapida
{
    [JsonPropertyName("rank")]
    public string posicion { get; set; } //Vuelta rapida posicion nro n, teniendo en cuenta las vueltas rapidas de todos los conductores

    [JsonPropertyName("lap")]
    public string vuelta { get; set; } //vuelta en la que se realizo la vuelta mas rapida

    [JsonPropertyName("time")]
    public Tiempo tiempo { get; set; }

    [JsonPropertyName("AverageSpeed")]
    public VelocidadPromedio velocidadPromedio { get; set; }
}
