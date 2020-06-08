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
        public ActionResult Index()
        {
            return View();
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
        public PartialViewResult ToolLeft_Code()
        {
            return PartialView();
        }
        public PartialViewResult HotCode()
        {
            ViewBag.Title_Code = "Code nổi bật";
            List<CodeTable> model = db.CodeTables.OrderByDescending(t => t.LuotTai).Take(20).OrderByDescending(t => t.NgayDang).Take(5).ToList();
            return PartialView(model);
        }
        public PartialViewResult ChuDeTinCongNghe()
        {
            List<ChuDeTable> model = db.ChuDeTables.ToList();
            return PartialView(model);
        }
        public JsonResult demSoLuongKq_TinCongNghe(string searchText)
        {
            int dem = db.TinTucTables.Where(t => t.TenTinTuc.Contains(searchText)).OrderByDescending(t => t.NgayDang).Count();
            return Json(dem, JsonRequestBehavior.AllowGet);
        }
        public PartialViewResult CodeDanhGiaCao()
        {
            ViewBag.Title_Code = "Code đánh giá cao";
            List<CodeTable> model = db.CodeTables.OrderByDescending(t => t.DanhGia).Take(5).ToList();
            return PartialView("HotCode", model);
        }
        public PartialViewResult CodeXemNhieu()
        {
            List<CodeTable> model = db.CodeTables.OrderByDescending(t => t.LuotXem).Take(12).ToList();
            return PartialView(model);
        }
    }
}