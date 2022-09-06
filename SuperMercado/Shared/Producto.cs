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

        public override int CalcularDigitoHorizontal()
        {
            byte[] props = SHA256.Create().ComputeHash(Encoding.UTF8.GetBytes(Id + Nombre + Descripcion + ImgURL + Precio.ToString()));
            return BitConverter.ToInt32(props, 0) % 1000000;
        }
    }
}
