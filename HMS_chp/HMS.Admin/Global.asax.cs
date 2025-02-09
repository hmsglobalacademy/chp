﻿using HMS.Admin.Utility;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace HMS.Admin
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
        public class GolbalSession
        {
            private HMSSession _HMSSession;
            public static HMSSession gblSession
            {
                get { return (HMSSession)GetFromSession("HMSSession"); }
                set { SetInSession("HMSSession", value); }
            }
            private static void SetInSession(string key, object value)
            {
                HttpContext.Current.Session[key] = value;
            }
            static object GetFromSession(string key)
            {
                return HttpContext.Current.Session[key];
            }
        }
    }
}
