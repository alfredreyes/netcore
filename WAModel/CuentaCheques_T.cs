//Fecha Creación:5/24/2019 6:12:59 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class CuentaCheques_T
    {
      
            public string ID  { get; set; }      
      
            public string FideicomisoId  { get; set; }      
      
            public string TipoPersona  { get; set; }      
      
            public string FideicomitenteId  { get; set; }      
      
            public string TipoCuenta  { get; set; }      
      
            public string TipoPago  { get; set; }      
      
            public string BancoSpei  { get; set; }      
      
            public string Banco  { get; set; }      
      
            public string DomBanco  { get; set; }      
      
            public string Moneda  { get; set; }      
      
            public string ClaveVostro  { get; set; }      
      
            public string NumCuenta  { get; set; }      
      
            public string DomBeneficiario  { get; set; }      
      
            public string PlazaInternacional  { get; set; }      
      
            public string Pais  { get; set; }      
      
            public string ClaveSiacInst  { get; set; }      
      
            public string ConvenioCieDie  { get; set; }      
      
            public string Estatus  { get; set; }      
      
            public string Clabe  { get; set; }      
      
            public string CuentaChequera  { get; set; }      
      
            public string FechaVence  { get; set; }      
      
            public string NumAbbasSwift  { get; set; }      
      
            public string ConceptoSiac  { get; set; }      
      
            public string RefCieDie  { get; set; }      
      
            public string Autorizacion  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
            public Fideicomiso MyFideicomiso1 { get; set; }
            public Fideicomitente MyFideicomitente2 { get; set; }
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
