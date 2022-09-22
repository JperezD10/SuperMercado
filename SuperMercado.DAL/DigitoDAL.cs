using SuperMercado.BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.DAL
{
    public class DigitoDAL
    {
        Acceso acceso = Acceso.GetInstance;

        public DVV ObtenerDigitosVerificadoresVerticales()
        {
            try
            {
                DVV resultado = new DVV();
                resultado.Tabla = new Dictionary<string, int>();
                var tabla = acceso.Leer("ObtenerDigitosVerificadoresVerticales", new SqlParameter[]
                {

                });
                foreach (DataRow fila in tabla.Rows)
                {
                    resultado.Tabla.Add(fila.Field<string>("Tabla"), fila.Field<int>("DVV"));
                }
                return resultado;
            }
            catch (Exception)
            {
                throw;
            }
        }


        public List<Bitacora> ObtenerTablaBitacora()
        {
            try
            {
                DataTable datos = acceso.Leer("ObtenerTablaBitacora",null);
                List<Bitacora> lista = new List<Bitacora>();
                if (datos.Rows.Count > 0)
                {
                    foreach (DataRow fila in datos.Rows)
                    {
                        lista.Add(SqlMapeoHelper.CargarBitacora(fila));
                    }
                }
                return lista;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public List<Componente> ObtenerTablaComponente()
        {
            try
            {
                DataTable datos = acceso.Leer("ObtenerTablaComponente", null);
                List<Componente> lista = new List<Componente>();
                if (datos.Rows.Count > 0)
                {
                    foreach (DataRow fila in datos.Rows)
                    {
                        lista.Add(SqlMapeoHelper.CargarComponente(fila));
                    }
                }
                return lista;
            }
            catch (Exception)
            {
                throw;
            }
        }


        public void ActualizarDVV(string nombretabla, int digito)
        {
            try
            {
                var tabla = acceso.Escribir("ActualizarDVV", new SqlParameter[]
                {
                    new SqlParameter("@Tabla", nombretabla),
                    new SqlParameter("@DVV", digito)
                });

            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
