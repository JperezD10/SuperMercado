using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BE
{
    public class Usuario: SqlEntidad
    {
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }

        public override int CalcularDigitoHorizontal()
        {
            byte[] props = SHA256.Create().ComputeHash(Encoding.UTF8.GetBytes(Id + Nombre + Apellido + Username + Password.ToString()));
            return BitConverter.ToInt32(props, 0) % 1000000;
        }
    }
}
