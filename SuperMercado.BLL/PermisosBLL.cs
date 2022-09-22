using SuperMercado.BE;
using SuperMercado.DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BLL
{
    public class PermisosBLL
    {
        PermisosDAL permiDAL = new PermisosDAL();
        public IList<Componente> GetAllPatentes()
        {
            return permiDAL.GetAllPatentes();
        }

        public IList<Componente> GetAllFamilias()
        {
            return permiDAL.GetAllFamilias();
        }

        public bool AltaFamiliaSimplificada(string nombre)
        {
            Familia familia = new Familia();
            familia.Nombre = nombre;
            return permiDAL.AltaFamiliaSimplificada(familia);
        }


        public bool AltaPermisoSimplificada(string nombrePermiso)
        {
            Patente permiso = new Patente(nombrePermiso);
            return permiDAL.AltaPermisoSimplificada(permiso);
        }

        public void cargarHijosDeFamilia(Familia familia)
        {
            IList<Componente> lista = permiDAL.GetComponentesPorFamilia(familia);

            foreach (var item in lista)
            {
                if (item is Familia)
                {
                    permiDAL.GetComponentesRecursivo(item);
                }
            }

            foreach (var item in lista)
            {
                familia.AgregarHijo(item);
            }
        }


        public List<Componente> AplanarArbol(Familia familiaelegida)
        {
            List<Componente> listaRet = new List<Componente>();
            //Recorro el arbol volcando cada componente en una lista
            List<Componente> hijos = familiaelegida.Hijos.ToList();

            //Ahora, tengo que agregar al padre como componente, sino puedo generar errores
            listaRet.Add(familiaelegida);
            foreach (var hijo in hijos)
            {
                //Agrego al hijo
                listaRet.Add(hijo);
                if (hijo.Hijos != null && hijo.Hijos.Count > 0)
                {
                    //Es una familia
                    //Busco mas hijos dentro
                    listaRet.AddRange(RecorrerRecursivo(hijo));
                }
            }
            return listaRet;

        }

        public List<Componente> FiltrarPotencialesHijos(BindingList<Componente> bindingPotencialesHijos, Familia componenteBase)
        {
            List<Componente> ret = new List<Componente>();
            //Aplano la familia elegida
            List<Componente> componentePlano = AplanarArbol(componenteBase);
            //Este proceso SOLO DESCARTA FAMILIAS
            foreach (Componente potencial in bindingPotencialesHijos)
            {
                bool existe = false;
                foreach (var compElegido in componentePlano)
                {
                    if (existe)
                        continue;
                    if (potencial.Id.Equals(compElegido.Id) || potencial.esHijo(compElegido))
                    {
                        existe = true;
                    }
                }
                if (!existe)
                {
                    ret.Add(potencial);
                }
            }

            return ret;
        }

        List<Componente> RecorrerRecursivo(Componente hijo)
        {
            List<Componente> listaRet = new List<Componente>();
            List<Componente> hijos = hijo.Hijos.ToList();
            foreach (var nieto in hijos)
            {
                //Agrego al hijo
                listaRet.Add(nieto);
                if (nieto.Hijos != null && nieto.Hijos.Count > 0)
                {
                    //Es una familia
                    //Busco mas hijos dentro
                    listaRet.AddRange(RecorrerRecursivo(nieto));
                }
            }
            return listaRet;
        }

        public Componente BorrarHijo(Componente padre, Componente aBorrar)
        {
            return padre.BorrarHijo(aBorrar);
        }

        public void GuardarFamilia(Familia familia)
        {
            //Para guardar la familia, puedo comparar el estado en la BD contra el actual
            //y ver que se agrego o borro de la misma

            //Traigo todo el arbol original de la familia
            Familia original = new Familia(familia.Id, familia.Nombre);
            cargarHijosDeFamilia(original);

            List<Componente> listaOrig = AplanarArbol(original);
            List<Componente> listaNew = AplanarArbol(familia);


            var borrados = listaOrig.Except(listaNew, new ComponenteComparer()).ToList();
            var agregados = listaNew.Except(listaOrig, new ComponenteComparer()).ToList();
            //como en ambos casos los arboles estan poblados
            //con recorrer cada resultado y guardar alcanza

            //lo que tengo que recordar es que, como aplane el arbol,
            //tengo que tener cuidado de no agregar o borrar de mas
            //para esto, reviso sobre la familia NUEVA quien es hijo directo
            if (borrados.Count > 0)
            {
                //elimino cada relacion que borre
                foreach (Componente item in borrados)
                {
                    //Si es hijo directo del original, es a quien tengo que borrar
                    if (original.Hijos.Contains(item, new ComponenteComparer()))
                    {
                        permiDAL.BorrarRelacion(original, item);
                    }
                }

            }

            if (agregados.Count > 0)
            {
                //agrego las nuevas
                foreach (Componente item in agregados)
                {
                    //Si es hijo directo del original, es a quien tengo que borrar
                    if (familia.Hijos.Contains(item, new ComponenteComparer()))
                    {
                        permiDAL.AgregarRelacion(original, item);
                    }
                }
            }

            //Con los hijos cargados, borro las relaciones
            //lo unico que hago aca es guardar relaciones
            /*foreach (var hijo in familia.Hijos)
            {
                permiDAL.GuardarRelacion(familia, hijo);
                if (hijo.Hijos != null)
                {
                    //Si el hijo tiene familia, tengo que recorrerlo igual
                    GuardarFamilia(hijo);
                }
            }*/
        }

        public List<Componente> ObtenerPermisosUser(Usuario user)
        {
            return permiDAL.GetComponentesPorUsuario(user.Id);
        }

    }
}
