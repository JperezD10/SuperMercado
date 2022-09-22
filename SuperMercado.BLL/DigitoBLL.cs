using SuperMercado.BE;
using SuperMercado.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SuperMercado.BLL
{
    public class DigitoBLL
    {
        DigitoDAL digiDAL = new DigitoDAL();

        public int CalcularDigitoVBitacora(List<Bitacora> tabla)
        {
            int res = 0;
            bool suma = true;
            foreach (var item in tabla)
            {
                if (suma)
                {
                    res += item.CalcularDigitoHorizontal();
                }
                else
                {
                    suma = true;
                    res -= item.CalcularDigitoHorizontal();
                }
            }
            return res;
        }

        public int CalcularDigitoVComponente(List<Componente> tabla)
        {
            int res = 0;
            bool suma = true;
            foreach (var item in tabla)
            {
                if (suma)
                {
                    res += item.CalcularDigitoHorizontal();
                }
                else
                {
                    suma = true;
                    res -= item.CalcularDigitoHorizontal();
                }
            }
            return res;
        }

        public bool VerificarIntegridadGeneral()
        {
            //Verifico tabla de permisos
            List<Componente> tablaComp = digiDAL.ObtenerTablaComponente();
            foreach (var item in tablaComp)
            {
                long num = item.CalcularDigitoHorizontal();
                if (!num.Equals(item.DVH))
                    return false;
            }


            //Verifico tabla de bitacora
            List<Bitacora> tablabitacora = digiDAL.ObtenerTablaBitacora();
            foreach (var item in tablabitacora)
            {
                long num = item.CalcularDigitoHorizontal();
                if (!num.Equals(item.DVH))
                    return false;
            }

            DVV dvv = new DVV();

            dvv = digiDAL.ObtenerDigitosVerificadoresVerticales();

            //calculo dvv de bitacora
            int totalBitacora = CalcularDigitoVBitacora(tablabitacora);
            bool BitacoraOK = dvv.CompararDVV("Bitacora", totalBitacora);
            if (!BitacoraOK)
            {
                return false;
            }

            //calculo dvv de bitacora
            int totalComponente = CalcularDigitoVComponente(tablaComp);
            bool ComponenteOK = dvv.CompararDVV("Componente", totalComponente);
            if (!ComponenteOK)
            {
                return false;
            }

            return true;
        }

        public void ActualizarDVV(string nomtabla)
        {
            int dvv = 0;
            switch (nomtabla)
            {
                case "Bitacora":
                    List<Bitacora> tablabit = digiDAL.ObtenerTablaBitacora();
                    dvv = CalcularDigitoVBitacora(tablabit);
                    break;
                case "Componente":
                    List<Componente> tablacomp = digiDAL.ObtenerTablaComponente();
                    dvv = CalcularDigitoVComponente(tablacomp);
                    break;
            }

            digiDAL.ActualizarDVV(nomtabla, dvv);
        }
    }
}
