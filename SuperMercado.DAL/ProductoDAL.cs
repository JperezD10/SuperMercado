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
    public class ProductoDAL
    {
        Acceso acceso;

        public ProductoDAL()
        {
            acceso = Acceso.GetInstance;
        }

        public IList<Producto> GetProductos()
        {
            IList<Producto> productos = new List<Producto>();
            DataTable tabla = acceso.Leer("GetProductos",null);
            foreach (DataRow dr in tabla.Rows)
            {
                productos.Add(SqlMapeoHelper.CargarProducto(dr));
            }
            return productos;
        }
        public IList<Producto> GetProductos(int idCategoria)
        {
            IList<Producto> productos = new List<Producto>();
            DataTable tabla = acceso.Leer("GetProductosPorCategoria", new SqlParameter[] {new SqlParameter("@idCategoria", idCategoria) });
            foreach (DataRow dr in tabla.Rows)
            {
                productos.Add(SqlMapeoHelper.CargarProducto(dr));
            }
            return productos;
        }
    }
}
