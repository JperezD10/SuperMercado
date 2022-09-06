using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BE
{
    public abstract class SqlEntidad
    {
        public int Id { get; set; }
        public int DVH { get; set; }
        public abstract int CalcularDigitoHorizontal();

        public bool CompararDigitoHorizontal(int dvh) => DVH == dvh;
    }
}
