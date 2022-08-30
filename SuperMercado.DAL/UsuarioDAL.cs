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
    public class UsuarioDAL
    {
        Acceso acceso = Acceso.GetInstance;

        public Usuario Login(string username, string contraseña)
        {
            Usuario usuario = null;
            var tablaResult = acceso.Leer("sp", new SqlParameter[]
            {
                new SqlParameter("parametro", 10)
            });
            foreach (DataRow fila in tablaResult.Rows)
            {
                usuario = SqlMapeoHelper.CargarUsuario(fila);
            }
            return usuario;
        }
    }
}
