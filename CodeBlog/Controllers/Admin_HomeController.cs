using CodeBlog.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CodeBlog.Controllers.Admin
{
    public class Admin_HomeController : Controller
    {
        CodeBlogEntities db = new CodeBlogEntities();
        // GET: Admin_Home
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Admin_DangNhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Admin_DangNhap(string txtTaiKhoan, string txtMatKhau)
        {
            AdminTable ad = db.AdminTables.SingleOrDefault(t => t.TaiKhoan == txtTaiKhoan && t.MatKhau == txtMatKhau);
            if(ad != null)
            {
                HttpCookie maAD = new HttpCookie("MaAd", ad.MaAdmin.ToString());
                HttpCookie tenAD = new HttpCookie("TenAd", ad.TenHienThi.ToString());

                maAD.Expires.AddDays(10);
                tenAD.Expires.AddDays(10);

                Response.Cookies.Set(maAD);
                Response.Cookies.Set(tenAD);
                return RedirectToAction("Index");
            }
            ViewBag.ThongBao = "Sai tai khoan hoac mat khau!";
            return View();
        }
    }
}