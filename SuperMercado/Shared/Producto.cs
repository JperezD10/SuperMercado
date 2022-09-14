using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BE
{
    public class Producto: SqlEntidad
    {
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public string ImgURL { get; set; }
        public double Precio { get; set; }
    }
}
