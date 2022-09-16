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

        public (bool loginCorrecto, string mensaje, Usuario? usuarioLogueado) Login(string username, string contraseña)
        {
            var usuario = _UsuarioDAL.Login(username, Encriptacion.EncriptadoPermanente(contraseña));
            if (usuario == null)
                return (false, "Usuario o contraseña incorrecta", null);
            return (true, "", usuario);
        }

        public (bool creacionCorrecta, string mensaje, Usuario? usuarioCreado) RegistrarUsuario(Usuario usuario)
        {
            usuario.Password = Encriptacion.EncriptadoPermanente(usuario.Password);
            bool existeUsuario = _UsuarioDAL.ExisteUsuario(usuario);
            if (existeUsuario)
            {
                return (false, "Usuario existente", null);
            }
            _UsuarioDAL.CrearUsuario(usuario);
            return (true, "Usuario creado correctamente", usuario);
        }
    }
}