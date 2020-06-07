using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CodeBlog.Models;
using PagedList;
using PagedList.Mvc;

namespace CodeBlog.Controllers
{
    public class TimKiemController : Controller
    {
        CodeBlogEntities db = new CodeBlogEntities();
        const int PAGE_SIZE_CODE = 20;
        const int PAGE_SIZE_TIN = 10;
        // GET: TimKiem
        public ActionResult Index()
        {
            return View();
        }
        // tìm kiếm bài viết code
        public ActionResult TatCaCode(int? page)
        {
            ViewBag.Title = "Tất cả code";
            IPagedList<CodeTable> model = db.CodeTables.OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE_CODE);
            ViewBag.ketquatimkiem = model.Count();
            ViewBag.phantrang = "?page=";
            return View("DanhSachKetQuaCode", model);
        }
        public ActionResult LocCodeTheoMaDanhMuc(int? madanhmuc, int? page)
        {
            if (madanhmuc == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.Title = "Tìm kiếm danh mục: " + db.DanhMucTables.Find(madanhmuc).TenDanhMuc;
            List<CodeTable> model = new List<CodeTable>();
            List<TheLoaiTable> theloai = db.DanhMuc_TheLoaiTable.Where(t => t.MaDanhMuc == madanhmuc).Select(t => t.TheLoaiTable).ToList();
            foreach(var item in theloai)
            {
                List<CodeTable> tmp = db.CodeTables.Where(t => t.MaTheLoai == item.MaTheLoai).ToList();
                model = (List<CodeTable>)model.Union(tmp).ToList();
            }
            ViewBag.ketquatimkiem = model.Count();
            ViewBag.phantrang = "?madanhmuc=" + madanhmuc + "&page=";
            ViewBag.searchText = "?madanhmuc=" + madanhmuc;
            Session["action"] = "LocCodeTheoMaDanhMuc";
            return View("DanhSachKetQuaCode", model.OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE_CODE));
        }
        public ActionResult LocCodeTheoMaTheLoai(int? matheloai, int? page)
        {
            if (matheloai == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.Title = "Tìm kiếm thể loại: " + db.TheLoaiTables.Find(matheloai).TheLoai;
            IPagedList<CodeTable> model = db.CodeTables.Where(t => t.MaTheLoai == matheloai).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE_CODE);
            ViewBag.ketquatimkiem = model.Count();
            ViewBag.searchText = "?madanhmuc=" + matheloai;
            ViewBag.phantrang = "?madanhmuc=" + matheloai + "&page=";
            Session["action"] = "LocCodeTheoMaTheLoai";
            return View("DanhSachKetQuaCode", model);
        }
        public ActionResult LocCodeTheoMaNgonNgu(int? mangonngu, int? page)
        {
            if (mangonngu == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.Title = "Tìm kiếm ngôn ngữ: " + db.NgonNguTables.Find(mangonngu).NgonNgu;
            IPagedList<CodeTable> model = db.NgonNgu_CodeTable.Where(t => t.MaNgonNgu == mangonngu).Select(t => t.CodeTable).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE_CODE);
            ViewBag.ketquatimkiem = model.Count();
            ViewBag.searchText = "?madanhmuc=" + mangonngu;
            ViewBag.phantrang = "?madanhmuc=" + mangonngu + "&page=";
            Session["action"] = "LocCodeTheoMaNgonNgu";
            return View("DanhSachKetQuaCode", model);
        }
        // tìm kiếm bài viết công nghệ
        public ActionResult TatCaTinCongNghe(int? page)
        {
            ViewBag.Title = "Tât cả tin công nghệ";
            IPagedList<TinTucTable> model = db.TinTucTables.OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE_TIN);
            ViewBag.phantrang = "?page=";
            ViewBag.ketquatimkiem = db.TinTucTables.Count();
            return View("DanhSachKetQuaTinCongNghe", model);
        }
        public ActionResult LocTinCongNgheTheoMaChuDe(int? machude, int? page)
        {
            if (machude == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.Title = "Tìm kiếm chủ đề: " + db.ChuDeTables.Find(machude).ChuDe;
            IPagedList<TinTucTable> model = db.TinTucTables.Where(t => t.MaChuDe == machude).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE_TIN);
            ViewBag.phantrang = "?machude=" + machude + "&page=";
            ViewBag.searchText = "?machude=" + machude;
            ViewBag.ketquatimkiem = db.TinTucTables.Where(t => t.MaChuDe == machude).Count();
            return View("DanhSachKetQuaTinCongNghe", model);
        }
        public PartialViewResult TimKiemTuKhoa_TinCongNghe(string searchText, int? page)
        {
            IPagedList<TinTucTable> model = db.TinTucTables.Where(t => t.TenTinTuc.Contains(searchText)).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE_TIN);
            if (searchText != "")
            {
                ViewBag.phantrang = "?searchText=" + searchText + "&page=";
                ViewBag.searchText = "?searchText=" + searchText;
            }
            else
            {
                ViewBag.searchText = "";
                ViewBag.phantrang = "?page=";
            }
            ViewBag.tukhoa = searchText;
            return PartialView(model);
        }
        public ActionResult TimKiemTuKhoaTinTuc(string searchText, int? page)
        {
            ViewBag.Title = "Tìm kiếm từ khóa: " + searchText;
            IPagedList<TinTucTable> model = db.TinTucTables.Where(t => t.TenTinTuc.Contains(searchText)).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE_TIN);
            ViewBag.ketquatimkiem = db.TinTucTables.Where(t => t.TenTinTuc.Contains(searchText)).Count();
            ViewBag.tukhoa = searchText;
            if (searchText != "")
            {
                ViewBag.phantrang = "?searchText=" + searchText + "&page=";
                ViewBag.searchText = "?searchText=" + searchText;
            }
            else
            {
                ViewBag.searchText = "";
                ViewBag.phantrang = "?page=";
            }
            return View("DanhSachKetQuaTinCongNghe", model);
        }
    }
}