using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace TP09.Models;

public class Conductor
{
    [JsonPropertyName("driverId")]
    public string IdConductor { get; set; }

    [JsonPropertyName("permanentNumber")]
    public string NumeroPermanente { get; set; } //Ni idea q es, me imagino q el numero de conductor

    [JsonPropertyName("code")]
    public string codigo { get; set; }

    public string url { get; set; }
    
    [JsonPropertyName("givenName")]
    public string Nombre { get; set; }

    [JsonPropertyName("familyName")]
    public string Apellido { get; set; }

    [JsonPropertyName("dateOfBirth")]
    public string FechaNacimiento { get; set; }

    [JsonPropertyName("nationality")]
    public string Nacionalidad { get; set; }
}