﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HMS.Admin.Utility
{
    public class Support
    {
        
    }
    public static class Alerts
    {
        public const string SUCCESS = "success";
        public const string ATTENTION = "attention";
        public const string ERROR = "danger";
        public const string INFORMATION = "info";

        public static string[] ALL
        {
            get { return new[] { SUCCESS, ATTENTION, INFORMATION, ERROR }; }
        }
    }
}