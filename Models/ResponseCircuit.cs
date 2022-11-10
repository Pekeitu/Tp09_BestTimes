using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace TP09.Models;

public class Location{
    [JsonPropertyName("lat")]
    public double latitude;

    [JsonPropertyName("long")]
    public double longitude;
    public string locality;
    public string country;
}

public class Circuit{
    public string circuitId;
    public string url;
    //seguir
}