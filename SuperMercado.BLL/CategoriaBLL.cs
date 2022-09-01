using SuperMercado.BE;
using SuperMercado.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BLL
{
    public class CategoriaBLL
    {
        CategoriaDAL _categoriaDAL;
        public CategoriaBLL()
        {
            _categoriaDAL = new CategoriaDAL();
        }

        public IList<Categoria> GetCategorias() => _categoriaDAL.GetCategorias();
    }
}
