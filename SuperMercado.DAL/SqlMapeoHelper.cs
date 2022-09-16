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
                Id = (int)fila["IdProducto"],
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
                Id = (int)fila["IdCategoria"],
                Nombre = fila["Nombre"].ToString() ?? "",
                Productos = new List<Producto>()
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
                Id = fila.Field<int>("IdUsuario"),
                Nombre = fila.Field<string>("Nombre"),
                Apellido = fila.Field<string>("Apellido"),
                Username = fila.Field<string>("Usuario"),
                Password = fila.Field<string>("Contraseña"),
            };
        }

        public static Bitacora CargarBitacora(DataRow fila)
        {
            return new Bitacora()
            {
                Id = fila.Field<int>("IdBitacora"),
                Descripcion = fila.Field<string>("Descripcion"),
                Fecha = fila.Field<DateTime>("Fecha"),
                UsuarioAccion = new Usuario() { Id = fila.Field<int>("IdUsuario")},
                DVH = fila.Field<int>("DVH")
            };
        }
    }
}
