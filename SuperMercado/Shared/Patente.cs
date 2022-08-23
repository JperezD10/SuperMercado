using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BE
{
    public class Patente : Componente
    {
        public override IList<Componente> Hijos
        {
            get
            {
                return null;
            }

        }

        public Patente(int id, string nombre)
        {
            Id = id;
            Nombre = nombre;
        }
        public Patente(string nombre)
        {
            Nombre = nombre;
        }

        public Patente()
        {
        }

        public override void AgregarHijo(Componente c)
        {

        }

        public override Componente BorrarHijo(Componente c)
        {
            return null;
        }

        public override void VaciarHijos()
        {

        }

        public override bool esHijo(Componente c)
        {
            return false;
        }

    }
}
