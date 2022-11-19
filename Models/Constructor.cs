using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace TP09.Models;

public class Constructor
{
    [JsonPropertyName("constructorId")]
    public string IdConstructor { get; set; }
    
    public string url { get; set; }
    
    [JsonPropertyName("name")]
    public string Nombre { get; set; }
    
    [JsonPropertyName("nationality")]
    public string Nacionalidad { get; set; }
}