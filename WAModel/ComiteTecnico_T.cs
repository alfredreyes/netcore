//Fecha Creación:5/24/2019 6:12:47 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class ComiteTecnico_T
    {
      
            public string ID  { get; set; }      
      
            public string FideicomisoId  { get; set; }      
      
            public string Nombre  { get; set; }      
      
            public string Integracion  { get; set; }      
      
            public string Facultades  { get; set; }      
      
            public string Comentarios  { get; set; }      
      
            public string FechaConstitucion  { get; set; }      
      
            public int? MiembrosQuorum  { get; set; }      
      
            public string Estatus  { get; set; }      
      
            public string NombrePresidentePropietario  { get; set; }      
      
            public string RfcPresidentePropietario  { get; set; }      
      
            public string NacionalidadPresidentePropietario  { get; set; }      
      
            public string PepPresidentePropietario  { get; set; }      
      
            public string NombrePresidenteSuplente  { get; set; }      
      
            public string RfcPresidenteSuplente  { get; set; }      
      
            public string NacionalidadPresidenteSuplente  { get; set; }      
      
            public string PepPresidenteSuplente  { get; set; }      
      
            public string NombreSecretarioPropietario  { get; set; }      
      
            public string RfcSecretarioPropietario  { get; set; }      
      
            public string NacionalidadSecretarioPropietario  { get; set; }      
      
            public string PepSecretarioPropietario  { get; set; }      
      
            public string NombreSecretarioSuplente  { get; set; }      
      
            public string RfcSecretarioSuplente  { get; set; }      
      
            public string NacionalidadSecretarioSuplente  { get; set; }      
      
            public string PepSecretarioSuplente  { get; set; }      
      
            public string NombreVocalPropietario  { get; set; }      
      
            public string RfcVocalPropietario  { get; set; }      
      
            public string NacionalidadVocalPropietario  { get; set; }      
      
            public string PepVocalPropietario  { get; set; }      
      
            public string NombreVocalSuplente  { get; set; }      
      
            public string RfcVocalSuplente  { get; set; }      
      
            public string NacionalidadVocalSuplente  { get; set; }      
      
            public string PepVocalSuplente  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
            public Fideicomiso MyFideicomiso1 { get; set; }
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
