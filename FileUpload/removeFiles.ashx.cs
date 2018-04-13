﻿#region Copyright Syncfusion Inc. 2001-2018.
// Copyright Syncfusion Inc. 2001-2018. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace SyncfusionUploader1
{
    /// <summary>
    /// Summary description for removeFiles
    /// </summary>
    public class removeFiles : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            System.Collections.Specialized.NameValueCollection s = context.Request.Params;
            string fileName = s["fileNames"];
            string targetFolder = HttpContext.Current.Server.MapPath("uploadfiles");
            if (!Directory.Exists(targetFolder))
            {
                Directory.CreateDirectory(targetFolder);
            }

            string physicalPath = targetFolder + "\\" + fileName;
            if (System.IO.File.Exists(physicalPath))
            {
                System.IO.File.Delete(physicalPath);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}