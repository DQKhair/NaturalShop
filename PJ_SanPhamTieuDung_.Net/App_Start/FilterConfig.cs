using System.Web;
using System.Web.Mvc;

namespace PJ_SanPhamTieuDung_.Net
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
