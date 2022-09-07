using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BE
{
    public class DVV
    {
        //key: nombre de la tabla (si queres encriptado)
        //value: la suma de los dvh de esa tabla (Dvv)
        public Dictionary<string, int> Tabla { get; set; }

        public bool CompararDVV(string tabla, int dvv)
        {
            if (this.Tabla.ContainsKey(tabla))
            {
                return this.Tabla[tabla] == dvv;
            }
            return false;
        }

    }
}
