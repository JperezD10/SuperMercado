using SuperMercado.BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.DAL
{
    public class PermisosDAL
    {
        Acceso acceso = Acceso.GetInstance;

        public IList<Componente> GetAllPatentes()
        {

            var tablaResult = acceso.Leer("ObtenerPermisosTodos", new SqlParameter[]
            {
                
            });

            List<Componente> listapermisos = new List<Componente>();

            foreach (DataRow fila in tablaResult.Rows)
            {
                listapermisos.Add(SqlMapeoHelper.CargarPermiso(fila));
            }

            return listapermisos;
        }

        public bool AltaFamiliaSimplificada(Familia familia)
        {

            int id = acceso.Escribir("AltaFamiliaSimple", new SqlParameter[]
            {
                new SqlParameter("@nombre", familia.Nombre)
            });

            if (id != -1)
                return true;
            return false;
        }

        public IList<Componente> GetAllFamilias()
        {

            var tablaResult = acceso.Leer("ObtenerFamiliasTodos", new SqlParameter[]
            {

            });

            List<Componente> listafamilias = new List<Componente>();

            foreach (DataRow fila in tablaResult.Rows)
            {
                listafamilias.Add(SqlMapeoHelper.CargarFamilia(fila));
            }

            return listafamilias;
        }

        public bool AltaPermisoSimplificada(Patente permiso)
        {
            int id = acceso.Escribir("AltaPermisoSimple", new SqlParameter[]
            {
                new SqlParameter("@nombre", permiso.Nombre)
            });

            if (id != -1)
                return true;
            return false;

        }

        public IList<Componente> GetComponentesPorFamilia(Componente familia)
        {
            var tablaResult = acceso.Leer("ObtenerComponentesPorFamilia", new SqlParameter[]
            {
                new SqlParameter("@idPadre", familia.Id)
            });

            List<Componente> listapermisos = new List<Componente>();
            if (tablaResult.Rows.Count > 0)
            {
                foreach (DataRow fila in tablaResult.Rows)
                {
                    bool esFamilia = fila.Field<byte>("esFamilia") == 0 ? false : true;
                    if (esFamilia)
                    {
                        listapermisos.Add(SqlMapeoHelper.CargarFamilia(fila));
                    }
                    else
                    {
                        listapermisos.Add(SqlMapeoHelper.CargarPermiso(fila));
                    }
                }
                return listapermisos;
            }
            else
            {
                //error
                return listapermisos;
            }
        }

        public void GetComponentesRecursivo(Componente familia)
        {
            //Busco hijos (patente/familia) de la familia pasada por parametro
            IList<Componente> hijos = GetComponentesPorFamilia(familia);
            //Recorro la lista de hijos
            foreach (var hijo in hijos)
            {
                //Si un hijo es familia, tengo que ir a buscar a los hijos de este
                if (hijo is Familia)
                {
                    GetComponentesRecursivo(hijo);
                }
                familia.AgregarHijo(hijo);
            }
        }


        public List<Componente> GetComponentesPorUsuario(int user)
        {
            var tablaResult = acceso.Leer("ObtenerPermisosRaizUsuario", new SqlParameter[]
            {
                new SqlParameter("@idusuario", user)
            });

            List<Componente> listapermisos = new List<Componente>();
            if (tablaResult.Rows.Count > 0)
            {
                foreach (DataRow fila in tablaResult.Rows)
                {
                    bool esFamilia = fila.Field<byte>("esFamilia") == 0 ? false : true;
                    if (esFamilia)
                    {
                        //Creo familia
                        var familia = SqlMapeoHelper.CargarFamilia(fila);
                        GetComponentesRecursivo(familia);
                        listapermisos.Add(familia);
                    }
                    else
                    {
                        listapermisos.Add(SqlMapeoHelper.CargarPermiso(fila));
                    }
                }
                return listapermisos;
            }
            else
            {
                //error
                return listapermisos;
            }

        }

        public void GuardarPermisoUsuario(string username, Componente permiso)
        {

            int id = acceso.Escribir("InsertarPermisoUsuario", new SqlParameter[]
            {
                new SqlParameter("@username", username),
                new SqlParameter("@idpermiso", permiso.Id)
            });

        }

        public void AgregarRelacion(Familia padre, Componente hijo)
        {
            int id = acceso.Escribir("InsertarPermisoUsuario", new SqlParameter[]
            {
                new SqlParameter("@idpadre", padre.Id),
                new SqlParameter("@idhijo", hijo.Id)
            });

        }

        public void BorrarRelacion(Familia padre, Componente hijo)
        {
            /*Falta borrar para sql*/
            /*var listaParams = new List<IParametroDB>();
            ParametroDB<int> para1 = new ParametroDB<int>("@idpadre", padre.Codigo);
            ParametroDB<int> para2 = new ParametroDB<int>("@idhijo", hijo.Codigo);
            listaParams.Add(para1);
            listaParams.Add(para2);
            bool borro = acceso.Delete("BorrarRelacionComponentes", listaParams);*/
        }
    }
}
