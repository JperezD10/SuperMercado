using System.ComponentModel.DataAnnotations;

namespace SuperMercado.UI.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage = "Username necesario")]
        public string Username { get; set; }

        [Required(ErrorMessage = "Password necesaria")]
        public string Password { get; set; }
    }
}
