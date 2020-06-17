using CodeBlog.Models;
using PagedList;
using PagedList.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CodeBlog.Controllers
{
    public class TimKiemBlogController : Controller
    {
        CodeBlogEntities db = new CodeBlogEntities();
        const int PAGE_SIZE = 12;
        // GET: TimKiemBlog
        public ActionResult TatCaBlog(int? page)
        {
            IPagedList<BlogTable> model = db.BlogTables.OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("KetQuaBlog", model);
        }
        public PartialViewResult dsTheLoai()
        {
            List<TheLoaiTable> model = db.TheLoaiTables.ToList();
            return PartialView(model);
        }
        public PartialViewResult dsNgonNgu()
        {
            List<NgonNguTable> model = db.NgonNguTables.ToList();
            return PartialView(model);
        }
        public ActionResult TimKiemBlog(string searchText, int? matheloai, int? mangonngu, int? page)
        {
            List<BlogTable> model = db.BlogTables.ToList();
            if(mangonngu != null)
            {
                List<BlogTable> tmp = db.NgonNgu_BlogTable.Where(t => t.MaNgonNgu == mangonngu).Select(t => t.BlogTable).ToList();
                model = model.Intersect(tmp).ToList();
            }
            if(matheloai != null)
            {
                List<BlogTable> tmp = db.BlogTables.Where(t => t.MaTheLoai == matheloai).ToList();
                model = model.Intersect(tmp).ToList();
            }
            if(searchText != "")
            {
                List<BlogTable> tmp = db.BlogTables.Where(t => t.TenBlog.Contains(searchText)).ToList();
                model = model.Intersect(tmp).ToList();
            }
            return View("KetQuaBlog", model.OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE));
        }
    }
}