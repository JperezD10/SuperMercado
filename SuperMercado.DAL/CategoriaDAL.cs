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

        void verificarIntegridad(Categoria categoria)
        {
            var dvh = categoria.CalcularDigitoHorizontal();
            bool esIgual = categoria.CompararDigitoHorizontal(dvh);
            if (!esIgual)
                throw new Exception("Problemas en base de datos");
        }

        public IList<Categoria> GetCategorias()
        {
            DataTable tabla = acceso.Leer("GetCategorias", null);
            IList<Categoria> Categorias = new List<Categoria>();
            foreach (DataRow dr in tabla.Rows)
            {
                try
                {
                    var categoria = SqlMapeoHelper.CargarCategoria(dr);
                    verificarIntegridad((Categoria)categoria);
                    Categorias.Add(categoria);
                }
                catch (Exception)
                {
                    throw;
                }
                
            }
            return Categorias;
        }
    }
}
