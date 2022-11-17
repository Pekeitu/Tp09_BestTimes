using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace TP09.Models;

public class Ubicacion
{
    public string lat {get;set;}
    public string @long {get;set;}
    public string locality {get;set;}
    public string country {get;set;}
}

public class Track
{
    [JsonPropertyName("circuitId")]
    public string id {get;set;}
    public string url {get;set;}
    [JsonPropertyName("circuitName")]
    public string nombre {get;set;}

    [JsonPropertyName("Location")]
    public Ubicacion ubicacion {get;set;}
}

public class Tracks
{
    [JsonPropertyName("Circuits")]
    public List<Track> tracks {get;set;}
}

public class TrackTable : StandardResponse
{
    [JsonPropertyName("CircuitTable")]
    public Tracks obj {get;set;}
}