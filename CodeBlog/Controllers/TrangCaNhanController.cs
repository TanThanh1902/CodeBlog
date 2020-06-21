using CodeBlog.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;

namespace CodeBlog.Controllers
{
    public class TrangCaNhanController : Controller
    {
        CodeBlogEntities db = new CodeBlogEntities();
        const int PAGE_SIZE = 12;
        // GET: TrangCaNhan
        public ActionResult Index(int? page)
        {
            HttpCookie cookie = Request.Cookies["MaND"];
            if (cookie == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            int mand = int.Parse(cookie.Value.ToString());
            IPagedList<CodeTable> codeTables = db.CodeTables.Where(t => t.MaNguoiDung == mand).OrderBy(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View(codeTables);
        }
        public ActionResult ThongTinCaNhan()
        {
            HttpCookie cookie = Request.Cookies["MaND"];
            if (cookie == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            int mand = int.Parse(cookie.Value.ToString());
            demThongTinCaNhan(mand);
            NguoiDungTable nguoiDung = db.NguoiDungTables.Find(mand);
            return View(nguoiDung);
        }
        public ActionResult TimKiemCodeTheoTuKhoa(int? page, string searchText)
        {
            IPagedList<CodeTable> codeTables = db.CodeTables.Where(t => t.TenCode.Contains(searchText) || t.MaCode.ToString().Contains(searchText)).OrderBy(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View(codeTables);
        }
        public ActionResult TimKiemCode(int? page, string searchText)
        {
            HttpCookie cookie = Request.Cookies["MaND"];
            if (cookie == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            int mand = int.Parse(cookie.Value.ToString());
            IPagedList<CodeTable> codeTables = db.CodeTables.Where(t => t.MaNguoiDung == mand && (t.TenCode.Contains(searchText) || t.MaCode.ToString().Contains(searchText))).OrderBy(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("Index", codeTables);
        }
        #region
        public void demThongTinCaNhan(int? maND)
        {
            ViewBag.demCodeDaDang = db.CodeTables.Where(t => t.MaNguoiDung == maND).Count();
            ViewBag.demCodeDaBan = db.ThanhToanTables.Where(t => t.CodeTable.MaNguoiDung == maND).Count();
            ViewBag.demCodeDaTai = db.ThanhToanTables.Where(t => t.MaNguoiMua == maND).Count();
            ViewBag.demCodeMienPhi = db.CodeTables.Where(t => t.MaNguoiDung == maND && t.DonGia == 0).Count();
            ViewBag.demCodeCoPhi = db.CodeTables.Where(t => t.MaNguoiDung == maND && t.DonGia > 0).Count();
        }
        #endregion
    }
}