using System;
using System.Collections.Generic;
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
            acceso.Leer("sp", new SqlParameter[]
            {
                new SqlParameter("parametro", 10)
            });
            return true;
        }
    }
}
