using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BE
{
    public abstract class Componente: SqlEntidadSeguridad
    {
        public string Nombre { get; set; }

        public abstract IList<Componente> Hijos { get; }

        public abstract bool esHijo(Componente c);
        public abstract void AgregarHijo(Componente c);
        public abstract void VaciarHijos();
        public abstract Componente BorrarHijo(Componente c);

        public override string ToString()
        {
            return Nombre;
        }
    }
}
