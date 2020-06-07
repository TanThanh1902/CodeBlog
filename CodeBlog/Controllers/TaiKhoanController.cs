using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CodeBlog.Models;

namespace CodeBlog.Controllers
{
    public class TaiKhoanController : Controller
    {
        CodeBlogEntities db = new CodeBlogEntities();
        // GET: TaiKhoan
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Dangky()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(NguoiDungTable nd, string NhapLaiMatKhau)
        {
            if(ktraTonTai(nd.TaiKhoan, 1))
            {
                ViewBag.ThongBao = "Tài khoản đã tồn tại!";
            }
            else if(nd.MatKhau != NhapLaiMatKhau)
            {
                ViewBag.ThongBao = "Mật khẩu không trùng khớp!";
            }
            else if (ModelState.IsValid)
            {
                nd.TenHienThi = "User";
                nd.AnhDaiDien = "default_user.jpg";
                nd.Token = Guid.NewGuid().ToString();
                nd.NgayTao = DateTime.Now;
                db.NguoiDungTables.Add(nd);
                db.SaveChanges(); 

                HttpCookie maNguoiDung = new HttpCookie("MaND", nd.MaNguoiDung.ToString());
                HttpCookie tenNguoiDung = new HttpCookie("TenND", nd.TenHienThi.ToString());

                maNguoiDung.Expires.AddDays(10);
                tenNguoiDung.Expires.AddDays(10);

                Response.Cookies.Set(maNguoiDung);
                Response.Cookies.Set(tenNguoiDung);
                return Redirect("/Home/Index");
            }
            return View();
        }
        public ActionResult DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangNhap(string txtTaiKhoan, string txtMatKhau)
        {
            NguoiDungTable nd = db.NguoiDungTables.SingleOrDefault(t => t.TaiKhoan == txtTaiKhoan && t.MatKhau == txtMatKhau);
            if(nd != null)
            {
                HttpCookie maNguoiDung = new HttpCookie("MaND", nd.MaNguoiDung.ToString());
                HttpCookie tenNguoiDung = new HttpCookie("TenND", nd.TenHienThi.ToString());

                maNguoiDung.Expires.AddDays(10);
                tenNguoiDung.Expires.AddDays(10);

                Response.Cookies.Set(maNguoiDung);
                Response.Cookies.Set(tenNguoiDung);
                return Redirect("/Home/Index");
            }
            ViewBag.ThongBao = "Sai thông tin tài khoản!";
            return View();
        }
        public ActionResult DangXuat()
        {
            HttpCookie maND = Request.Cookies["MaND"];
            HttpCookie tenND = Request.Cookies["TenND"];

            maND.Expires = DateTime.Now.AddDays(-1d);
            tenND.Expires = DateTime.Now.AddDays(-1d);

            Response.Cookies.Set(maND);
            Response.Cookies.Set(tenND);
            ViewBag.mess = "load";
            return Redirect("/Home/Index");
        }
        #region Method
        // kiem tra ton tai tai khoan
        public bool ktraTonTai(string key, int status)
        {
            bool isExist = false;
            switch (status)
            {
                case 1:
                    isExist = db.NguoiDungTables.SingleOrDefault(t => t.TaiKhoan == key) != null;
                    break;
                case 2:
                    isExist = db.NguoiDungTables.SingleOrDefault(t => t.Email == key) != null;
                    break;
            }
            return isExist;
        }
        #endregion
    }
}