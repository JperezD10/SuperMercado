using SuperMercado.BE;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.DAL
{
    public class SqlMapeoHelper
    {
        public static Producto CargarProducto(DataRow fila)
        {
            return new Producto()
            {
                Id = (int)fila["Id"],
                Nombre = fila["Nombre"].ToString() ?? "",
                Descripcion = fila["Descripcion"].ToString() ?? "",
            };
        }

        public static Categoria CargarCategoria(DataRow fila)
        {
            return new Categoria()
            {
                Id = (int)fila["Id"],
                Nombre = fila["Nombre"].ToString() ?? "",
                Descripcion = fila["Descripcion"].ToString() ?? "",
            };
        }
    }
}
