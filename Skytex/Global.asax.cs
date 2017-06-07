using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace Skytex
{
    public class MvcApplication : System.Web.HttpApplication
    {

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        public static string Language
        {
            get
            {
                var currentContext = new HttpContextWrapper(HttpContext.Current);
                var routeData = RouteTable.Routes.GetRouteData(currentContext);
                if (routeData != null)
                {
                    var lang = (string)routeData.Values["culture"];

                    if (string.IsNullOrEmpty(lang))
                    {
                        lang = "es-MX";
                    }

                    return lang;
                }

                return "es-MX";
            }
        }


        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(MvcApplication.Language);
            Thread.CurrentThread.CurrentCulture = new CultureInfo(MvcApplication.Language);

        }
    }
}
