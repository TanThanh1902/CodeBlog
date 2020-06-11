using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CodeBlog.Models;
using CodeBlog.DAO;

namespace CodeBlog.Controllers
{
    public class HomeController : Controller
    {
        CodeBlogEntities db = new CodeBlogEntities();
        public ActionResult Index()
        {
            return View();
        }

        public PartialViewResult CodeChatLuong()
        {
            ViewBag.TenTheLoai = "Code chất";
            List<CodeTable> model = db.CodeTables.Where(t => t.DonGia > 100).OrderByDescending(t => t.NgayDang).Take(8).ToList();
            return PartialView("DanhSachCode", model);
        }

        public PartialViewResult CodeWebsite()
        {
            ViewBag.TenTheLoai = "Code Website";
            List<TheLoaiTable> theloai = db.DanhMuc_TheLoaiTable.Where(t => t.MaDanhMuc == 1).Select(t => t.TheLoaiTable).ToList();
            List<CodeTable> model = new List<CodeTable>(); 
            foreach(var item in theloai)
            {
                List<CodeTable> tmp = db.CodeTables.Where(t => t.MaTheLoai == item.MaTheLoai).ToList();
                model = (List<CodeTable>)model.Union(tmp).ToList();
            }
            return PartialView("DanhSachCode", model.OrderByDescending(t => t.NgayDang).Take(8).ToList());
        }
        public PartialViewResult CodeApp()
        {
            ViewBag.TenTheLoai = "App mobile";
            List<TheLoaiTable> theloai = db.DanhMuc_TheLoaiTable.Where(t => t.MaDanhMuc == 6).Select(t => t.TheLoaiTable).ToList();
            List<CodeTable> model = new List<CodeTable>();
            foreach (var item in theloai)
            {
                List<CodeTable> tmp = db.CodeTables.Where(t => t.MaTheLoai == item.MaTheLoai).ToList();
                model = (List<CodeTable>)model.Union(tmp).ToList();
            }
            return PartialView("DanhSachCodeAppChung", model.OrderByDescending(t => t.NgayDang).Take(5).ToList());
        }
        public PartialViewResult CodeUngDung()
        {
            ViewBag.TenTheLoai = "ứng dụng";
            List<TheLoaiTable> theloai = db.DanhMuc_TheLoaiTable.Where(t => t.MaDanhMuc == 2).Select(t => t.TheLoaiTable).ToList();
            List<CodeTable> model = new List<CodeTable>();
            foreach (var item in theloai)
            {
                List<CodeTable> tmp = db.CodeTables.Where(t => t.MaTheLoai == item.MaTheLoai).ToList();
                model = (List<CodeTable>)model.Union(tmp).ToList();
            }
            return PartialView("DanhSachCodeAppChung", model.OrderByDescending(t => t.NgayDang).Take(4).ToList());
        }
        public PartialViewResult CodeGame()
        {
            ViewBag.TenTheLoai = "Game";
            List<TheLoaiTable> theloai = db.DanhMuc_TheLoaiTable.Where(t => t.MaDanhMuc == 4).Select(t => t.TheLoaiTable).ToList();
            List<CodeTable> model = new List<CodeTable>();
            foreach (var item in theloai)
            {
                List<CodeTable> tmp = db.CodeTables.Where(t => t.MaTheLoai == item.MaTheLoai).ToList();
                model = (List<CodeTable>)model.Union(tmp).ToList();
            }
            return PartialView("DanhSachCodeAppChung", model.OrderByDescending(t => t.NgayDang).Take(4).ToList());
        }
        public PartialViewResult TinCongNghe()
        {
            List<TinTucTable> model = db.TinTucTables.OrderByDescending(t => t.NgayDang).Take(4).ToList();
            return PartialView(model);
        }
    }
}