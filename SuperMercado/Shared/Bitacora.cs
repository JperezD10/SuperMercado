using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BE
{
    public class Bitacora: SqlEntidadSeguridad
    {
        public string Descripcion { get; set; }
        public DateTime Fecha { get; set; }
        public Usuario UsuarioAccion { get; set; }

        public override int CalcularDigitoHorizontal()
        {
            byte[] props = SHA256.Create().ComputeHash(Encoding.UTF8.GetBytes(Id + Descripcion + Fecha));
            return BitConverter.ToInt32(props, 0) % 1000000;
        }
    }
}
