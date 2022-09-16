using System.ComponentModel.DataAnnotations;

namespace SuperMercado.UI.Models
{
    public class UsuarioDTO
    {
        [Required(ErrorMessage = "Nombre necesario")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "Apellido necesario")]
        public string Apellido { get; set; }

        [Required(ErrorMessage = "Username necesario")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Password necesaria")]
        [RegularExpression("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,15}$", ErrorMessage = "Formato de contraseña incorrecta")]
        public string Password { get; set; }
    }
}
