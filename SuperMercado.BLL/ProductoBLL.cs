using SuperMercado.BE;
using SuperMercado.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BLL
{
    public class ProductoBLL
    {
        ProductoDAL productoDAL;

        public ProductoBLL()
        {
            productoDAL = new ProductoDAL();
        }

        public IList<Producto> GetProductos(int? idCategoria)
        {
            if (idCategoria.HasValue)
            {
                return productoDAL.GetProductos(idCategoria.Value);
            }
            return productoDAL.GetProductos();
        }
    }
}
