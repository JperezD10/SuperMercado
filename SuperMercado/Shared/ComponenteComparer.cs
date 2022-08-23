using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BE
{
    public class ComponenteComparer : IEqualityComparer<Componente>
    {
        public bool Equals(Componente x, Componente y)
        {
            if (x.Id.Equals(y.Id))
                return true;
            return false;
        }

        public int GetHashCode(Componente obj)
        {
            return obj.Id.GetHashCode();
        }
    }
}
