using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace TP09.Models;

public class StandardResponse
{
    public string xmlns {get; set;}
    public string series {get; set;}
    public string url {get; set;}
    public string limit {get; set;}
    public string offset {get; set;}
    public string total {get; set;}
}

public class StandardResponseRoot<T>
{
    [JsonPropertyName("MRData")]
    public T response {get;set;}
}