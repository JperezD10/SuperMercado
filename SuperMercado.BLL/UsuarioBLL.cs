using SuperMercado.BE;
using SuperMercado.DAL;

namespace SuperMercado.BLL
{
    public class UsuarioBLL
    {
        UsuarioDAL _UsuarioDAL;
        public UsuarioBLL()
        {
            _UsuarioDAL = new UsuarioDAL();
        }

        public bool PuedeVerPantalla(Usuario usuario)
        {
            return true;
        }

        public Usuario Login(string username, string contraseña)
        {
            return _UsuarioDAL.Login(username, Encriptacion.EncriptadoPermanente(contraseña));
        }
    }
}