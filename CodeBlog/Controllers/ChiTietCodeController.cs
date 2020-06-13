using CodeBlog.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace CodeBlog.Controllers
{
    public class ChiTietCodeController : Controller
    {
        CodeBlogEntities db = new CodeBlogEntities();
        // GET: ChiTietCode
        public ActionResult ChiTietCode(int? maCode)
        {
            if(maCode == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadGateway);
            }
            CodeTable model = db.CodeTables.Find(maCode);
            return View(model);
        }
    }
}