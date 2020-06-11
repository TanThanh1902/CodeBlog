using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CodeBlog.Models;
using PagedList;

namespace CodeBlog.Controllers
{
    public class TimKiemCodeController : Controller
    {
        CodeBlogEntities db = new CodeBlogEntities();
        const int PAGE_SIZE = 12;
        // GET: TimKiemCode
        public ActionResult TatCaCode(int? page)
        {
            IPagedList<CodeTable> model = db.CodeTables.OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("KetQuaCode", model);
        }
        public ActionResult CodeChatLuong(int? page)
        {
            IPagedList<CodeTable> model = db.CodeTables.Where(t => t.DonGia >= 100).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("KetQuaCode", model);
        }
        public ActionResult CodeMienPhi(int? page)
        {
            IPagedList<CodeTable> model = db.CodeTables.Where(t => t.DonGia == 0).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("KetQuaCode", model);
        }
    }
}