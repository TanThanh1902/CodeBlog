using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CodeBlog.DAO;
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
            IPagedList<CodeTable> model = db.CodeTables.Where(t => t.MaAdmin != null).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("KetQuaCode", model);
        }
        public ActionResult CodeChatLuong(int? page)
        {
            IPagedList<CodeTable> model = db.CodeTables.Where(t => t.MaAdmin != null && t.DonGia >= 100).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("KetQuaCode", model);
        }
        public ActionResult CodeMienPhi(int? page)
        {
            IPagedList<CodeTable> model = db.CodeTables.Where(t => t.MaAdmin != null && t.DonGia == 0).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("KetQuaCode", model);
        }
        public ActionResult TimKiemCodeTheDanhMuc(int? madanhmuc, int? page)
        {
            if (madanhmuc == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.ketqua = CodeTheoDanhMuc(madanhmuc).Count;
            IPagedList<CodeTable> model = CodeTheoDanhMuc(madanhmuc).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("KetQuaCode", model);
        }
        public ActionResult TimKiemCodeTheoTheLoai(int? matheloai, int? page)
        {
            if (matheloai == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.ketqua = CodeTheoTheLoai(matheloai).Count;
            IPagedList<CodeTable> model = CodeTheoTheLoai(matheloai).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("KetQuaCode", model);
        }
        public ActionResult TimKiemCodeTheongonNgu(int? mangonngu, int? page)
        {
            if (mangonngu == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.ketqua = CodeTheoNgonNgu(mangonngu).Count;
            IPagedList<CodeTable> model = CodeTheoNgonNgu(mangonngu).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE);
            return View("KetQuaCode", model);
        }
        public PartialViewResult DanhMucCodeSelect()
        {
            List<DanhMucTable> model = db.DanhMucTables.ToList();
            return PartialView(model);
        }
        public PartialViewResult TheLoaiCodeSelect()
        {
            List<TheLoaiTable> model = db.TheLoaiTables.ToList();
            return PartialView(model);
        }
        public PartialViewResult NgonNguCodeSelect()
        {
            List<NgonNguTable> model = db.NgonNguTables.ToList();
            return PartialView(model);
        }
        public ActionResult TimKiemTuKhoa(int? madanhmuc, int? matheloai, int? mangonngu, string searchText, int? page)
        {
            List<CodeTable> model = db.CodeTables.ToList();
            List<CodeTable> tmp = CodeTheoDanhMuc(madanhmuc);
            if (tmp.Count > 0)
            {
                model = model.Intersect(tmp).ToList();
            }
            tmp = CodeTheoTheLoai(matheloai);
            if (tmp.Count > 0)
            {
                model = model.Intersect(tmp).ToList();
            }
            tmp = CodeTheoNgonNgu(mangonngu);
            if (tmp.Count > 0)
            {
                model = model.Intersect(tmp).ToList();
            }
            if (searchText != null)
            {
                model = model.Where(t => t.TenCode.Contains(searchText) || t.MaCode.ToString().Contains(searchText)).ToList();
            }
            ViewBag.ketqua = model.Count;
            return View("KetQuaCode", model.Where(t => t.MaAdmin != null).OrderByDescending(t => t.NgayDang).ToPagedList(page ?? 1, PAGE_SIZE));
        }
        public JsonResult TimKiemGoiY(string searchText)
        {
            List<TimKiemGoiY> codeGoiY = new List<TimKiemGoiY>();
            List<CodeTable> model = db.CodeTables.Where(t => t.MaAdmin != null && t.TenCode.Contains(searchText) || t.MaCode.ToString().Contains(searchText)).ToList();
            foreach(var item in model)
            {
                codeGoiY.Add(new TimKiemGoiY { 
                    maCode = item.MaCode,
                    tenCode = item.TenCode,
                    anhMinhHoa = item.AnhMinhHoa
                });
            }
            return Json(codeGoiY.ToList(), JsonRequestBehavior.AllowGet);
        }
        #region Phuongthuc
        public List<CodeTable> CodeTheoDanhMuc(int? madanhmuc)
        {
            List<CodeTable> model = new List<CodeTable>();
            List<TheLoaiTable> theloai = db.DanhMuc_TheLoaiTable.Where(t => t.MaDanhMuc == madanhmuc).Select(t => t.TheLoaiTable).ToList();
            foreach (var item in theloai)
            {
                List<CodeTable> tmp = db.CodeTables.Where(t => t.MaAdmin != null && t.MaTheLoai == item.MaTheLoai).ToList();
                model = model.Union(tmp).ToList();
            }
            return model;
        }
        public List<CodeTable> CodeTheoTheLoai(int? matheloai)
        {
            List<CodeTable> model = db.CodeTables.Where(t => t.MaAdmin != null && t.MaTheLoai == matheloai).ToList();
            return model;
        }
        public List<CodeTable> CodeTheoNgonNgu(int? mangonngu)
        {
            List<CodeTable> model = db.NgonNgu_CodeTable.Where(t => t.MaNgonNgu == mangonngu).Select(t => t.CodeTable).ToList();
            return model.Where(t => t.MaAdmin != null).ToList();
        }
        #endregion
    }
}