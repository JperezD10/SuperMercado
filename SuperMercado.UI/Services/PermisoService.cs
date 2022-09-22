using Microsoft.AspNetCore.Components;
using SuperMercado.BE;
using SuperMercado.BLL;
using SuperMercado.UI.Models;

namespace SuperMercado.UI.Services
{
    public class PermisoService
    {
        PermisosBLL permisosBLL;
        UsuarioBLL usuarioBLL;

        public PermisoService()
        {
            permisosBLL = new();
            usuarioBLL = new();
        }

        public void TienePermiso(NavigationManager navigationManager,string username, int idPermiso)
        {
            Usuario usuario = usuarioBLL.ObtenerUsuarioPorUsername(username);
            bool TienePermiso = permisosBLL.ObtenerPermisosUser(usuario).Any(permiso => permiso.Id == idPermiso);
            if (!TienePermiso)
                navigationManager.NavigateTo(Rutas.SinPermiso);
        }
    }
}
