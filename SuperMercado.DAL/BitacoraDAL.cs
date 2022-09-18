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
    public class BitacoraDAL
    {
        Acceso acceso = Acceso.GetInstance;

        public IList<Bitacora> ObtenerBitacora(DateTime? FechaDesde, DateTime? FechaHasta)
        {
            try
            {
                IList<Bitacora> resultado = new List<Bitacora>();
                var tabla = acceso.Leer("ObtenerBitacora", new SqlParameter[]
                {
                new SqlParameter("@FechaDesde", FechaDesde == null ? DBNull.Value : FechaDesde),
                new SqlParameter("@FechaHasta", FechaHasta == null ? DBNull.Value : FechaHasta)
                });
                foreach (DataRow fila in tabla.Rows)
                {
                    resultado.Add(SqlMapeoHelper.CargarBitacora(fila));
                }
                return resultado;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void GrabarBitacora(Bitacora bitacora)
        {
            try
            {
                acceso.Escribir("GrabarBitacora", new SqlParameter[]
                {
                    new SqlParameter("@Descricion", bitacora.Descripcion),
                    new SqlParameter("@Fecha",bitacora.Fecha),
                    new SqlParameter("@Usuario",bitacora.UsuarioAccion),
                    new SqlParameter("@DVH",bitacora.DVH),
                });
            }
            catch (Exception)
            {
                throw;
            }
            

        }
    }
}
