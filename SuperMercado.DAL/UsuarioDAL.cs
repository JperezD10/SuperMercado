using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.DAL
{
    public class UsuarioDAL
    {
        Acceso acceso = Acceso.GetInstance;

        public bool Login()
        {
            var tablaResult = acceso.Leer("sp", new SqlParameter[]
            {
                new SqlParameter("parametro", 10)
            });
            foreach (DataRow fila in tablaResult.Rows)
            {
                SqlMapeoHelper.CargarProducto(fila);
            }
            return true;
        }
    }
}
