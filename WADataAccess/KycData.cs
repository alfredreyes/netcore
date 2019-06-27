//Fecha Creación:5/24/2019 6:13:24 PM Template DataClass, Author: Alfredo Reyes C., V1
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using WADataAccess.Interfaces;
using WADataAccess.BaseDataAccess;
using WAModel;
using WAModel.BaseModel;

namespace WADataAccess
{
    public class KycData : IKycData, IDisposable
    {
        private string _conexion;
       
        public KycData(string conexion)
        {
            _conexion = conexion;
        }
        
        public Kyc GetKyc(string id)
        {
            Kyc entidad = new  Kyc();           

            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetKycByID";
            cmd.CommandText = sql;
            cmd.Connection = conn;
            //manejar llave primaria
            cmd.Parameters.AddWithValue("@ID", id);
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                  
                      if(reader["ID"] != DBNull.Value)               
                         entidad.Kyc_ID = reader["ID"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         entidad.Kyc_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["Nombre"] != DBNull.Value)               
                         entidad.Kyc_Nombre = reader["Nombre"].ToString();
 if(reader["NumRegistro"] != DBNull.Value)               
                         entidad.Kyc_NumRegistro = reader["NumRegistro"].ToString();
 if(reader["Oficina"] != DBNull.Value)               
                         entidad.Kyc_Oficina = reader["Oficina"].ToString();
 if(reader["ConceptoImpresion"] != DBNull.Value)               
                         entidad.Kyc_ConceptoImpresion = reader["ConceptoImpresion"].ToString();
 if(reader["CrBanca"] != DBNull.Value)               
                         entidad.Kyc_CrBanca = reader["CrBanca"].ToString();
 if(reader["Folio"] != DBNull.Value)               
                         entidad.Kyc_Folio = reader["Folio"].ToString();
                   
                      if(reader["GeneralesNumero1"] != DBNull.Value){
                             entidad.MyFideicomiso1 = new  Fideicomiso();  
                             entidad.MyFideicomiso1.Fideicomiso_GeneralesNumero = Int32.Parse(reader["GeneralesNumero1"].ToString());
                        }
                    
                }
            }
            
            }
            catch(Exception ex)
            {
                res.Exito = false;
                res.Message= ex.Message;
            }
            finally
            {
                conn.Close();
            }
           
            return entidad;
        }
        public List<Kyc> GetKycsAndRelations(int page, int numrecords)
        {
            List<Kyc> lista = new List<Kyc>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListKycPaged";
            cmd.CommandText = sql;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@pagNo", page);
            cmd.Parameters.AddWithValue("@pageSize", numrecords);
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    var it = new Kyc();
            
                      if(reader["ID"] != DBNull.Value)               
                         it.Kyc_ID = reader["ID"].ToString();
 if(reader["Fideicomiso"] != DBNull.Value)               
                         it.Kyc_Fideicomiso = reader["Fideicomiso"].ToString();
 if(reader["Nombre"] != DBNull.Value)               
                         it.Kyc_Nombre = reader["Nombre"].ToString();
 if(reader["NumRegistro"] != DBNull.Value)               
                         it.Kyc_NumRegistro = reader["NumRegistro"].ToString();
 if(reader["Oficina"] != DBNull.Value)               
                         it.Kyc_Oficina = reader["Oficina"].ToString();
 if(reader["ConceptoImpresion"] != DBNull.Value)               
                         it.Kyc_ConceptoImpresion = reader["ConceptoImpresion"].ToString();
 if(reader["CrBanca"] != DBNull.Value)               
                         it.Kyc_CrBanca = reader["CrBanca"].ToString();
 if(reader["Folio"] != DBNull.Value)               
                         it.Kyc_Folio = reader["Folio"].ToString();
                   
                      if(reader["GeneralesNumero1"] != DBNull.Value){
                             it.MyFideicomiso1 = new  Fideicomiso();  
                             it.MyFideicomiso1.Fideicomiso_GeneralesNumero = Int32.Parse(reader["GeneralesNumero1"].ToString());
                        }
                   

                    lista.Add(it);
                }
            }
            }
            catch(Exception ex)
            {
                res.Exito = false;
                res.Message = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            

            return lista;
        }
        public List<Kyc> GetKycs(int page, int numrecords)
        {
            List<Kyc> lista = new List<Kyc>();
            
            Result res = new Result();
            SqlConnection conn = new SqlConnection(_conexion);
            
            try{
            conn.Open();
            var cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            string sql = "";

            sql = "spGetListKycPaged";
            cmd.CommandText = sql;
            cmd.Connection = conn;
            cmd.Parameters.AddWithValue("@pagNo", page);
            cmd.Parameters.AddWithValue("@pageSize", numrecords);
            SqlDataReader reader;
            reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    var it = new Kyc();
            
                            if(reader["ID"] != DBNull.Value)               
                             it.Kyc_ID = reader["ID"].ToString();
                            if(reader["Fideicomiso"] != DBNull.Value)               
                             it.Kyc_Fideicomiso = reader["Fideicomiso"].ToString();
                            if(reader["Nombre"] != DBNull.Value)               
                             it.Kyc_Nombre = reader["Nombre"].ToString();
                            if(reader["NumRegistro"] != DBNull.Value)               
                             it.Kyc_NumRegistro = reader["NumRegistro"].ToString();
                            if(reader["Oficina"] != DBNull.Value)               
                             it.Kyc_Oficina = reader["Oficina"].ToString();
                            if(reader["ConceptoImpresion"] != DBNull.Value)               
                             it.Kyc_ConceptoImpresion = reader["ConceptoImpresion"].ToString();
                            if(reader["CrBanca"] != DBNull.Value)               
                             it.Kyc_CrBanca = reader["CrBanca"].ToString();
                            if(reader["Folio"] != DBNull.Value)               
                             it.Kyc_Folio = reader["Folio"].ToString();
                   
                   

                    lista.Add(it);
                }
            }
            }
            catch(Exception ex)
            {
                res.Exito = false;
                res.Message = ex.Message;
            }
            finally
            {
                conn.Close();
            }
            

            return lista;
        }
        public Result InsertKyc(Kyc item)
        {
            Result res = new Result();
            SqlConnection connection = new SqlConnection(_conexion);
            string insertProcedure = "spInsertKyc";
            SqlCommand insertCommand = new SqlCommand(insertProcedure, connection);
            insertCommand.CommandType = CommandType.StoredProcedure;
       
                                insertCommand.Parameters.AddWithValue("@Fideicomiso", item.Kyc_Fideicomiso);
  if (item.Kyc_Nombre == null) 
                      insertCommand.Parameters.AddWithValue("@Nombre", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Nombre", item.Kyc_Nombre);


  if (item.Kyc_NumRegistro == null) 
                      insertCommand.Parameters.AddWithValue("@NumRegistro", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@NumRegistro", item.Kyc_NumRegistro);


  if (item.Kyc_Oficina == null) 
                      insertCommand.Parameters.AddWithValue("@Oficina", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Oficina", item.Kyc_Oficina);


  if (item.Kyc_ConceptoImpresion == null) 
                      insertCommand.Parameters.AddWithValue("@ConceptoImpresion", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@ConceptoImpresion", item.Kyc_ConceptoImpresion);


  if (item.Kyc_CrBanca == null) 
                      insertCommand.Parameters.AddWithValue("@CrBanca", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@CrBanca", item.Kyc_CrBanca);


  if (item.Kyc_Folio == null) 
                      insertCommand.Parameters.AddWithValue("@Folio", DBNull.Value);
                   else
                          insertCommand.Parameters.AddWithValue("@Folio", item.Kyc_Folio);




            insertCommand.Parameters.Add("@ReturnValue", System.Data.SqlDbType.Int);
            insertCommand.Parameters["@ReturnValue"].Direction = ParameterDirection.Output;
            try
            {
                connection.Open();
                insertCommand.ExecuteNonQuery();
                int idNuevo = System.Convert.ToInt32(insertCommand.Parameters["@ReturnValue"].Value);
                if (idNuevo > 0)
                {                   
                    res.IdInserted = idNuevo.ToString();  
                    res.Exito = true;
                }
                else
                {
                    res.Exito = false;
                }
            }
            catch (Exception ex)
            {
                res.Message = ex.Message;
                res.Exito = false;
            }
            finally
            {
                connection.Close();
            }

            return res;
        }
        //Dispose Methods
          private bool disposed = false;
         public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposed)
                return;
            this.disposed = true;
        }
    }
}
