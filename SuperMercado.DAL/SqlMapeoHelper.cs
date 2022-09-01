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
                ImgURL = fila.Field<string>("ImgURL") ?? "",
                Precio = fila.Field<double>("Precio")
            };
        }

        public static Categoria CargarCategoria(DataRow fila)
        {
            return new Categoria()
            {
                Id = (int)fila["Id"],
                Nombre = fila["Nombre"].ToString() ?? "",
            };
        }

        public static Patente CargarPermiso(DataRow fila)
        {
            return new Patente()
            {
                Id = fila.Field<int>("Id"),
                Nombre = fila.Field<string>("Nombre")
            };
        }

        public static Familia CargarFamilia(DataRow fila)
        {
            return new Familia()
            {
                Id = fila.Field<int>("Id"),
                Nombre = fila.Field<string>("Nombre")
            };
        }

        public static Usuario CargarUsuario(DataRow fila)
        {
            return new Usuario()
            {
                Id = fila.Field<int>("Id"),
                Nombre = fila.Field<string>("Nombre"),
                Apellido = fila.Field<string>("Apellido"),
                Username = fila.Field<string>("Username"),
                DVH = fila.Field<int>("DVH")
            };
        }
    }
}
