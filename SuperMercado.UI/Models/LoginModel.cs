using System.ComponentModel.DataAnnotations;

namespace SuperMercado.UI.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Username necesario")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Password necesaria")]
        [RegularExpression("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,15}$", ErrorMessage = "Formato de contraseña incorrecta")]
        public string Password { get; set; }
    }
}
