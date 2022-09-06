using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
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

        public override int CalcularDigitoHorizontal()
        {
            byte[] props = SHA256.Create().ComputeHash(Encoding.UTF8.GetBytes(Id+Nombre));
            return BitConverter.ToInt32(props, 0) % 1000000;
        }
    }
}
