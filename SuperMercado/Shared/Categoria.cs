using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BE
{
    public class Categoria: SqlEntidad
    {
        public string Nombre { get; set; }
        public List<Producto> Productos { get; set; }
    }
}
