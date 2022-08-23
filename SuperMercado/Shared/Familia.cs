using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BE
{
    public class Familia : Componente
    {
        private IList<Componente> _hijos;
        public Familia()
        {
            _hijos = new List<Componente>();
        }

        public Familia(int id, string nombre)
        {
            Id = id;
            Nombre = nombre;
            _hijos = new List<Componente>();
        }

        public override IList<Componente> Hijos
        {
            get
            {
                return _hijos.ToArray();
            }

        }

        public override void VaciarHijos()
        {
            _hijos = new List<Componente>();
        }


        public override void AgregarHijo(Componente c)
        {
            _hijos.Add(c);
        }

        public override Componente BorrarHijo(Componente c)
        {
            int index = _hijos.IndexOf(c);
            if (index != -1)
            {
                //Si existe, lo guardo y lo borro
                Componente ret = _hijos[index];
                _hijos.RemoveAt(index);
                return ret;
            }
            return null;
        }

        public override bool esHijo(Componente c)
        {
            bool existe = false;
            foreach (var item in _hijos)
            {
                if (item.Id.Equals(c.Id))
                    return true;
                else
                {
                    existe = esHijoRec(item, c, existe);
                    if (existe) return true;
                }

            }

            return existe;
        }

        private bool esHijoRec(Componente c, Componente orig, bool existe)
        {
            if (c.Id.Equals(orig.Id))
                existe = true;
            else
            {
                if (c.Hijos != null)
                {
                    foreach (var item in c.Hijos)
                    {
                        existe = esHijoRec(item, orig, existe);
                        if (existe) return true;
                    }
                }
            }
            return existe;
        }

    }
}
