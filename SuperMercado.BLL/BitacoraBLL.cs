using SuperMercado.BE;
using SuperMercado.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BLL
{
    public class BitacoraBLL
    {
        BitacoraDAL bitacoraDAL;
        public BitacoraBLL()
        {
            bitacoraDAL = new();
        }

        public IList<Bitacora> ObtenerBitacora(DateTime? FechaDesde, DateTime? FechaHasta)
        {
            //aca agrego un dia porque si buscas en el mismo dia para las dos fechas en un intervalo de 0 segundos y no te va a traer nada
            if (FechaHasta.HasValue)
                FechaHasta = FechaHasta.Value.AddDays(1);
            return bitacoraDAL.ObtenerBitacora(FechaDesde, FechaHasta);
        }

        public void GrabarBitacora(Bitacora bitacora)
        {
            bitacora.DVH = bitacora.CalcularDigitoHorizontal();
            bitacoraDAL.GrabarBitacora(bitacora);
        }
    }
}
