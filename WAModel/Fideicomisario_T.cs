//Fecha Creación:5/24/2019 6:13:05 PM Template ModelClass, Author: Alfredo Reyes C., V1
using System;

namespace WAModel
{
    public class Fideicomisario_T
    {
      
            public string ID  { get; set; }      
      
            public string NumeroFideicomisario  { get; set; }      
      
            public string TipoPersona  { get; set; }      
      
            public string Participante  { get; set; }      
      
            public string FideicomisoId  { get; set; }      
      
            public string RegimenFiscal  { get; set; }      
      
            public string GeneralesControladorFideicomiso  { get; set; }      
      
            public string GeneralesNacionalidad  { get; set; }      
      
            public string GeneralesPaisOrigen  { get; set; }      
      
            public string GeneralesActividad  { get; set; }      
      
            public string GeneralesAportaRecursos  { get; set; }      
      
            public string GeneralesPaisResidencia  { get; set; }      
      
            public string GeneralesClienteScotiaBank  { get; set; }      
      
            public string GeneralesPep  { get; set; }      
      
            public string GeneralesEstatus  { get; set; }      
      
            public string GeneralesGrupoFilial  { get; set; }      
      
            public string GeneralesCalidadMigratoria  { get; set; }      
      
            public string GeneralesLugarOperacion  { get; set; }      
      
            public string GeneralesOperaCuentaTerceros  { get; set; }      
      
            public string GeneralesNivelParticipante  { get; set; }      
      
            public string GeneralesClienteRelacionPep  { get; set; }      
      
            public string GeneralesGrado  { get; set; }      
      
            public string InfoPldKycHonorarios  { get; set; }      
      
            public string InfoPldKycComisiones  { get; set; }      
      
            public string InfoPldKycOtros  { get; set; }      
      
            public string InfoPldKycSueldos  { get; set; }      
      
            public string InfoPldKycVenta  { get; set; }      
      
            public string InfoPldKycInversiones  { get; set; }      
      
            public string InfoPldKycArrendamiento  { get; set; }      
      
            public string InfoPldKycTipoPatrimonio  { get; set; }      
      
            public string InfoPldKycInstrumento  { get; set; }      
      
            public string InfoPldKycRazonApertura  { get; set; }      
      
            public string InfoPldKycComentarios  { get; set; }      
      
            public string InfoPldKycNivelRiesgo  { get; set; }      
      
            public string InfoPldKycEstatusCalculoPld  { get; set; }      
      
            public string InfoPldKycFechaVerifFircosoft  { get; set; }      
      
            public string IdentificacionRfc  { get; set; }      
      
            public string IdentificacionCurp  { get; set; }      
      
            public string IdentificacionNoSerieEfirma  { get; set; }      
      
            public string IdentificacionPaisResidFisc1  { get; set; }      
      
            public string IdentificacionPaisResidFisc2  { get; set; }      
      
            public string IdentificacionEmail  { get; set; }      
      
            public string IdentificacionFechaConstitucion  { get; set; }      
      
            public string IdentificacionSexo  { get; set; }      
      
            public string IdentificacionPaisCasa  { get; set; }      
      
            public string IdentificacionPaisOficina  { get; set; }      
      
            public string IdentificacionPaisCelular  { get; set; }      
      
            public string IdentificacionFechaInicioRelNeg  { get; set; }      
      
            public string IdentificacionNoIdentificacion  { get; set; }      
      
            public string IdentificacionComprobacionDomicilio  { get; set; }      
      
            public string IdentificacionActividadEmpresarial  { get; set; }      
      
            public string IdentificacionNoIdentFisc1  { get; set; }      
      
            public string IdentificacionNoIdentFisc2  { get; set; }      
      
            public string IdentificacionClasificacionFatca  { get; set; }      
      
            public string IdentificacionLadaCasa  { get; set; }      
      
            public string IdentificacionLadaOficina  { get; set; }      
      
            public string IdentificacionLadaCelular  { get; set; }      
      
            public string IdentificacionNumeroCasa  { get; set; }      
      
            public string IdentificacionNumeroOficina  { get; set; }      
      
            public string IdentificacionNumeroCelular  { get; set; }      
      
            public string IdentificacionExtOficina  { get; set; }      
      
            public string IdentificacionExtCelular  { get; set; }      
      
            public string IdentificacionIdentOficialVig  { get; set; }      
      
            public string IdentificacionVigencia  { get; set; }      
      
            public string EscrituraNoEscritura  { get; set; }      
      
            public string EscrituraNotario  { get; set; }      
      
            public string EscrituraNoNotaria  { get; set; }      
      
            public string EscrituraCiudad  { get; set; }      
      
            public string EscrituraTelefono  { get; set; }      
      
            public string EscrituraEmail  { get; set; }      
      
            public string EscrituraFecha  { get; set; }      
      
            public string EscrituraEstado  { get; set; }      
      
            public int? CuentasKYCNoCuenta1  { get; set; }      
      
            public string CuentasKYCTipoCuenta1  { get; set; }      
      
            public int? CuentasKYCNoCuenta2  { get; set; }      
      
            public string CuentasKYCTipoCuenta2  { get; set; }      
      
            public int? CuentasKYCNoCuenta3  { get; set; }      
      
            public string CuentasKYCTipoCuenta3  { get; set; }      
      
            public int? CuentasKYCNoCuenta4  { get; set; }      
      
            public string CuentasKYCTipoCuenta4  { get; set; }      
      
      //Relationships with other entities, i use a number to diferentiate entites with the same name       
            public Fideicomiso MyFideicomiso1 { get; set; }
       
       //To manage search paged
            public int TotalRecords { get; set; }
    
    }
}
