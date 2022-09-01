using SuperMercado.BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.DAL
{
    public class CategoriaDAL
    {
        Acceso acceso;
        public CategoriaDAL()
        {
            acceso = Acceso.GetInstance;
        }

        public IList<Categoria> GetCategorias()
        {
            DataTable tabla = acceso.Leer("GetCategorias", null);
            IList<Categoria> Categorias = new List<Categoria>();
            foreach (DataRow dr in tabla.Rows)
            {
                Categorias.Add(SqlMapeoHelper.CargarCategoria(dr));
            }
            return Categorias;
        }
    }
}
