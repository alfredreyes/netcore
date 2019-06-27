//Fecha Creación:5/24/2019 6:12:59 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class CuentaCheques
    {
            public string CuentaCheques_ID  { get; set; }      
            public string CuentaCheques_Fideicomiso  { get; set; }      
            public string CuentaCheques_TipoPersona  { get; set; }      
            public string CuentaCheques_Fideicomitente  { get; set; }      
            public string CuentaCheques_TipoCuenta  { get; set; }      
            public string CuentaCheques_TipoPago  { get; set; }      
            public string CuentaCheques_BancoSpei  { get; set; }      
            public string CuentaCheques_Banco  { get; set; }      
            public string CuentaCheques_DomBanco  { get; set; }      
            public string CuentaCheques_Moneda  { get; set; }      
            public string CuentaCheques_ClaveVostro  { get; set; }      
            public string CuentaCheques_NumCuenta  { get; set; }      
            public string CuentaCheques_DomBeneficiario  { get; set; }      
            public string CuentaCheques_PlazaInternacional  { get; set; }      
            public string CuentaCheques_Pais  { get; set; }      
            public string CuentaCheques_ClaveSiacInst  { get; set; }      
            public string CuentaCheques_ConvenioCieDie  { get; set; }      
            public string CuentaCheques_Estatus  { get; set; }      
            public string CuentaCheques_Clabe  { get; set; }      
            public string CuentaCheques_CuentaChequera  { get; set; }      
            public string CuentaCheques_FechaVence  { get; set; }      
            public string CuentaCheques_NumAbbasSwift  { get; set; }      
            public string CuentaCheques_ConceptoSiac  { get; set; }      
            public string CuentaCheques_RefCieDie  { get; set; }      
            public string CuentaCheques_Autorizacion  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
            public Fideicomiso MyFideicomiso1 { get; set; }
            public Fideicomitente MyFideicomitente2 { get; set; }
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
