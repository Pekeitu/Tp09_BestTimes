namespace TP09.Models;

using System;
using Dapper;
using System.Linq;
using System.Data;
using System.Data.SqlClient;

public static class DB {
    private static string _connectionString =  @"Server=A-PHZ2-CIDI-006;DataBase=TP9;Trusted_Connection=True";

    public static void AgregarConductor(Piloto conductor)
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "AgregarConductor";
            db.Execute(sp, conductor, commandType: CommandType.StoredProcedure);
        }
    }

    public static void AgregarTrack(Track track)
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "AgregarTrack";
            db.Execute(sp, track, commandType: CommandType.StoredProcedure);
        }
    }

    public static void AgregarVuelta(Vuelta vuelta)
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "AgregarVuelta";
            db.Execute(sp, vuelta, commandType: CommandType.StoredProcedure);
        }
    }

    public static Piloto BuscarConductorxId(int id)
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "BuscarConductorxId";
            return db.QueryFirstOrDefault<Piloto>(sp, new {id}, commandType: CommandType.StoredProcedure);
        }
    }

    public static List<string> BuscarFotosTrackxId(int id)
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "BuscarFotosTrackxId";
            return db.Query<string>(sp, new {id}, commandType: CommandType.StoredProcedure).ToList();
        }
    }

    public static Track BuscarTrack(int id)
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "BuscarTrack";
            return db.QueryFirstOrDefault<Track>(sp, new {id}, commandType: CommandType.StoredProcedure);
        }
    }

    public static Pais BuscarPaisxId(string id)
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "BuscarPaisxId";
            return db.QueryFirstOrDefault<Pais>(sp, new {id}, commandType: CommandType.StoredProcedure);
        }
    }

    public static List<Piloto> ListarConductores()
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ListarConductores";
            return db.Query<Piloto>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
    }

    public static List<Track> ListarTracks()
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ListarTracks";
            return db.Query<Track>(sp, commandType: CommandType.StoredProcedure).ToList();
        }
    }

    public static List<Vuelta> ListarVueltasxTrack(int id)
    {
        using(SqlConnection db = new SqlConnection(_connectionString))
        {
            string sp = "ListarVueltasxTrack";
            return db.Query<Vuelta>(sp, new{id}, commandType: CommandType.StoredProcedure).ToList();
        }
    }
}