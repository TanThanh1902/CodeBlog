using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CodeBlog.Controllers
{
    public class TimKiemBlogController : Controller
    {
        // GET: TimKiemBlog
        public ActionResult Index()
        {
            return View();
        }
    }
}