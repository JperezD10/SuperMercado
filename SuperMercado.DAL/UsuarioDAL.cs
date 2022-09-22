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
            var tablaResult = acceso.Leer("Login", new SqlParameter[]
            {
                new SqlParameter("@username", username),
                new SqlParameter("@Password", contraseña)
            });
            foreach (DataRow fila in tablaResult.Rows)
            {
                usuario = SqlMapeoHelper.CargarUsuario(fila);
            }
            return usuario;
        }

        public Usuario CrearUsuario(Usuario NuevoUsuario)
        {
            try
            {
                acceso.Escribir("RegistrarUsuario", new SqlParameter[]
                {
                    new SqlParameter("@Nombre", NuevoUsuario.Nombre),
                    new SqlParameter("@Apellido", NuevoUsuario.Apellido),
                    new SqlParameter("@username", NuevoUsuario.Username),
                    new SqlParameter("@Password", NuevoUsuario.Password)
                });
                return NuevoUsuario;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }
        public bool ExisteUsuario(Usuario usuario)
        {
            bool resultado = true;
            try
            {
                var tabla = acceso.Leer("VerificarExistenciaUsuario", new SqlParameter[]
                {
                    new SqlParameter("@username", usuario.Username),
                });
                _ = tabla.Rows.Count > 0 ? resultado = true : resultado = false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return resultado;
        }

        public Usuario ObtenerUsuarioPorUsername(string username)
        {
            try
            {
                var tabla = acceso.Leer("ObtenerUsuarioPorUsername", new SqlParameter[]
                {
                    new SqlParameter("@username", username)
                });
                return SqlMapeoHelper.CargarUsuario(tabla.Rows[0]);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
