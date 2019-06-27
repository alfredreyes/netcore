//Fecha Creación:5/24/2019 6:13:12 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class Fideicomiso
    {
            public string Fideicomiso_ID  { get; set; }      
            public int Fideicomiso_GeneralesNumero  { get; set; }      
            public string Fideicomiso_GeneralesNombre  { get; set; }      
            public string Fideicomiso_GeneralesAdministrador  { get; set; }      
            public string Fideicomiso_GeneralesPromotor  { get; set; }      
            public string Fideicomiso_CaracteristicasFormaManejo  { get; set; }      
            public string Fideicomiso_CaracteristicasTipoNegocio  { get; set; }      
            public string Fideicomiso_CaracteristicasClasificacionProducto  { get; set; }      
            public string Fideicomiso_CaracteristicasProductoEstandar  { get; set; }      
            public string Fideicomiso_CaracteristicasProducto  { get; set; }      
            public string Fideicomiso_CaracteristicasValFatca  { get; set; }      
            public double? Fideicomiso_CaracteristicasMontoApertura  { get; set; }      
            public string Fideicomiso_CaracteristicasManejoSubFisos  { get; set; }      
            public string Fideicomiso_CaracteristicasSujetoArt151  { get; set; }      
            public string Fideicomiso_CaracteristicasCerrado  { get; set; }      
            public string Fideicomiso_CaracteristicasRevocable  { get; set; }      
            public string Fideicomiso_CaracteristicasEsContratoEje  { get; set; }      
            public string Fideicomiso_CaracteristicasComiteTecnico  { get; set; }      
            public string Fideicomiso_CaracteristicasOfiBanxico  { get; set; }      
            public string Fideicomiso_CaracteristicasManejaMonExt  { get; set; }      
            public string Fideicomiso_CaracteristicasIvaFronterizo  { get; set; }      
            public DateTime? Fideicomiso_CaracteristicasFechaAlta  { get; set; }      
            public DateTime? Fideicomiso_CaracteristicasFechaConstitucion  { get; set; }      
            public DateTime? Fideicomiso_CaracteristicasFechaAprobacion  { get; set; }      
            public string Fideicomiso_CaracteristicasEstado  { get; set; }      
            public string Fideicomiso_AdicionalesTipo  { get; set; }      
            public string Fideicomiso_AdicionalesTipoPersona  { get; set; }      
            public string Fideicomiso_AdicionalesConActividadEmpresarial  { get; set; }      
            public string Fideicomiso_AdicionalesPermisoSre  { get; set; }      
            public DateTime? Fideicomiso_AdicionalesFechaPermisoSre  { get; set; }      
            public string Fideicomiso_AdicionalesProvSustFiduciaria  { get; set; }      
            public string Fideicomiso_AdicionalesFondosInterfaseAfore  { get; set; }      
            public string Fideicomiso_AdicionalesRegNalInvExt  { get; set; }      
            public DateTime? Fideicomiso_AdicionalesFechaInscripcion  { get; set; }      
            public string Fideicomiso_AdicionalesFormalizacionContrato  { get; set; }      
            public string Fideicomiso_AdicionalesNoEscritura  { get; set; }      
            public DateTime? Fideicomiso_AdicionalesFechaEscritura  { get; set; }      
            public string Fideicomiso_AdicionalesNombreNotario  { get; set; }      
            public string Fideicomiso_AdicionalesNoNotario  { get; set; }      
            public string Fideicomiso_AdicionalesCiudadNotario  { get; set; }      
            public string Fideicomiso_AdicionalesEstadoNotario  { get; set; }      
            public string Fideicomiso_AdicionalesPaisNotario  { get; set; }      
            public string Fideicomiso_AdicionalesFolioRegistroPublico  { get; set; }      
            public DateTime? Fideicomiso_AdicionalesFechaInscripcionRegPublico  { get; set; }      
            public string Fideicomiso_AdicionalesAdministracion  { get; set; }      
            public string Fideicomiso_AdicionalesContabilidadDelegada  { get; set; }      
            public string Fideicomiso_DatosBanxicoActividadEconomica  { get; set; }      
            public string Fideicomiso_DatosBanxicoFiducuario  { get; set; }      
            public string Fideicomiso_DatosBanxicoSectorBancario  { get; set; }      
            public string Fideicomiso_DatosBanxicoLocalidad  { get; set; }      
            public string Fideicomiso_DatosBanxicoCentroResp  { get; set; }      
            public string Fideicomiso_DatosBanxicoNoCr  { get; set; }      
            public string Fideicomiso_DatosBanxicoRfcContrato  { get; set; }      
            public string Fideicomiso_DatosBanxicoNumeroCliente  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
