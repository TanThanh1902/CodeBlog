using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CodeBlog.Models;
using CodeBlog.DAO;
using System.Net;

namespace CodeBlog.Controllers
{
    public class HoTroController : Controller
    {
        CodeBlogEntities db = new CodeBlogEntities();
        // GET: HoTro
        public ActionResult LayNgonNguTheoMaCode(int? maCode)
        {
            if(maCode == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            List<NgonNguTable> model = db.NgonNgu_CodeTable.Where(t => t.MaCode == maCode).Select(t => t.NgonNguTable).ToList();
            return PartialView(model);
        }
        public ActionResult LayTheLoaiTheoMaDanhMuc(int? maDM)
        {
            if(maDM == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            List<TheLoaiTable> model = db.DanhMuc_TheLoaiTable.Where(t => t.MaDanhMuc == maDM).Select(t => t.TheLoaiTable).ToList();
            return PartialView(model);
        }
        public PartialViewResult DanhMucCode()
        {
            List<DanhMucTable> model = db.DanhMucTables.ToList();
            return PartialView(model);
        }
        public PartialViewResult TheLoaiCode()
        {
            List<TheLoaiTable> model = db.TheLoaiTables.ToList();
            return PartialView(model);
        }
        public PartialViewResult NgonNguCode()
        {
            List<NgonNguTable> model = db.NgonNguTables.ToList();
            return PartialView(model);
        }
    }
}