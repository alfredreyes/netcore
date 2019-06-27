//Fecha Creación:5/24/2019 6:12:47 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class ComiteTecnico
    {
            public string ComiteTecnico_ID  { get; set; }      
            public string ComiteTecnico_Fideicomiso  { get; set; }      
            public string ComiteTecnico_Nombre  { get; set; }      
            public string ComiteTecnico_Integracion  { get; set; }      
            public string ComiteTecnico_Facultades  { get; set; }      
            public string ComiteTecnico_Comentarios  { get; set; }      
            public DateTime ComiteTecnico_FechaConstitucion  { get; set; }      
            public int? ComiteTecnico_MiembrosQuorum  { get; set; }      
            public string ComiteTecnico_Estatus  { get; set; }      
            public string ComiteTecnico_NombrePresidentePropietario  { get; set; }      
            public string ComiteTecnico_RfcPresidentePropietario  { get; set; }      
            public string ComiteTecnico_NacionalidadPresidentePropietario  { get; set; }      
            public string ComiteTecnico_PepPresidentePropietario  { get; set; }      
            public string ComiteTecnico_NombrePresidenteSuplente  { get; set; }      
            public string ComiteTecnico_RfcPresidenteSuplente  { get; set; }      
            public string ComiteTecnico_NacionalidadPresidenteSuplente  { get; set; }      
            public string ComiteTecnico_PepPresidenteSuplente  { get; set; }      
            public string ComiteTecnico_NombreSecretarioPropietario  { get; set; }      
            public string ComiteTecnico_RfcSecretarioPropietario  { get; set; }      
            public string ComiteTecnico_NacionalidadSecretarioPropietario  { get; set; }      
            public string ComiteTecnico_PepSecretarioPropietario  { get; set; }      
            public string ComiteTecnico_NombreSecretarioSuplente  { get; set; }      
            public string ComiteTecnico_RfcSecretarioSuplente  { get; set; }      
            public string ComiteTecnico_NacionalidadSecretarioSuplente  { get; set; }      
            public string ComiteTecnico_PepSecretarioSuplente  { get; set; }      
            public string ComiteTecnico_NombreVocalPropietario  { get; set; }      
            public string ComiteTecnico_RfcVocalPropietario  { get; set; }      
            public string ComiteTecnico_NacionalidadVocalPropietario  { get; set; }      
            public string ComiteTecnico_PepVocalPropietario  { get; set; }      
            public string ComiteTecnico_NombreVocalSuplente  { get; set; }      
            public string ComiteTecnico_RfcVocalSuplente  { get; set; }      
            public string ComiteTecnico_NacionalidadVocalSuplente  { get; set; }      
            public string ComiteTecnico_PepVocalSuplente  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
            public Fideicomiso MyFideicomiso1 { get; set; }
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
