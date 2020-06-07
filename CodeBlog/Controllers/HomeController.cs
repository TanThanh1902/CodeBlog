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

        public PartialViewResult CodeNoiBat()
        {
            List<CodeNoiBat> model = new List<CodeNoiBat>();
            foreach(var item in db.DanhMucTables)
            {
                int demCode = 0, demTai = 0, demQuanTam = 0;
                float demNoiBat = 0;
                foreach (var jtem in item.DanhMuc_TheLoaiTable)
                {
                    List<CodeTable> tmp = db.CodeTables.Where(t => t.MaTheLoai == jtem.MaTheLoai).ToList();
                    demCode += tmp.Count();
                    demTai += (int)tmp.Sum(t => t.LuotTai);
                    demQuanTam += (int)tmp.Sum(t => t.LuotYeuThich);
                }
                if(demCode == 0)
                {
                    demNoiBat = 0;
                }
                else
                {
                    demNoiBat = (demQuanTam + demTai) / demCode;
                }
                CodeNoiBat addItem = new CodeNoiBat()
                {
                    MaDanhMuc = item.MaDanhMuc,
                    TenDanhMuc = item.TenDanhMuc,
                    AnhDanhMuc = item.AnhDanhMuc,
                    Dem = demNoiBat
                };
                model.Add(addItem);
            }
            return PartialView(model.OrderByDescending(t => t.Dem).Take(6).ToList());
        }

        public PartialViewResult TinCongNghe()
        {
            List<TinTucTable> model = db.TinTucTables.OrderByDescending(t => t.NgayDang).Take(5).ToList();
            return PartialView(model);
        }
    }
}