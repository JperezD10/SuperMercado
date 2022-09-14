using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BE
{
    public class Bitacora: SqlEntidad
    {
        public string Descripcion { get; set; }
        public DateTime Fecha { get; set; }
        public Usuario UsuarioAccion { get; set; }

    }
}
