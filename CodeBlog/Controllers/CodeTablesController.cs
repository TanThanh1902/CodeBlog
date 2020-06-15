using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CodeBlog.Models;
using System.IO;

namespace CodeBlog.Controllers
{
    public class CodeTablesController : Controller
    {
        private CodeBlogEntities db = new CodeBlogEntities();
        // GET: CodeTables
        public ActionResult Index()
        {
            string maND = Request.Cookies["MaND"].Value.ToString();
            if(maND == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadGateway);
            }
            int id = Int32.Parse(maND.ToString());
            List<CodeTable> codeTables = db.CodeTables.Where(t => t.MaNguoiDung == id).ToList();
            return View(codeTables);
        }

        // GET: CodeTables/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            HttpCookie maND = Request.Cookies["MaND"];
            if (id == null || maND == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CodeTable codeTable = await db.CodeTables.FindAsync(id);
            if (codeTable == null || codeTable.MaNguoiDung == Int32.Parse(maND.Value.ToString()))
            {
                return HttpNotFound();
            }
            return View(codeTable);
        }

        public PartialViewResult dsNgonNgu()
        {
            List<NgonNguTable> model = db.NgonNguTables.ToList();
            return PartialView(model);
        }
        // GET: CodeTables/Create
        public ActionResult Create()
        {
            HttpCookie maND = Request.Cookies["MaND"]; 
            if (maND == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.MaTheLoai = new SelectList(db.TheLoaiTables, "MaTheLoai", "TheLoai");
            return View();
        }

        // POST: CodeTables/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        public class ImageFile
        {
            public List<HttpPostedFileBase> files { get; set; }
        }
        [HttpPost]
        [ValidateInput(false)]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "MaCode,TenCode,AnhMinhHoa,NgayDang,LuotXem,LuotYeuThich,MaNguoiDung,MaAdmin,MaTheLoai,LuotTai,LinkTai,DonGia,MoTaNgan,MoTaChiTiet,HuongDanCaiDat")] CodeTable codeTable, int[] MaNgonNgu, HttpPostedFileBase fileimg_anhminhhoa, List<HttpPostedFileBase> fileimg_anhxemthem)
        {
            HttpCookie maND = Request.Cookies["MaND"];
            if (ModelState.IsValid)
            {
                codeTable.NgayDang = DateTime.Now;
                codeTable.LuotXem = 0;
                codeTable.LuotTai = 0;
                codeTable.LuotYeuThich = 0;
                codeTable.MaNguoiDung = Int32.Parse(maND.Value.ToString());
                var img = Path.GetFileName(fileimg_anhminhhoa.FileName);
                var pathimg = Path.Combine(Server.MapPath("~/Content/images/image_code"), img);
                if (fileimg_anhminhhoa == null)
                {
                    ViewBag.Img = "Chọn ảnh";
                    return View(codeTable);
                }
                else if (System.IO.File.Exists(pathimg))
                    ViewBag.Img = "Ảnh đã tồn tại";
                else
                    fileimg_anhminhhoa.SaveAs(pathimg);
                codeTable.AnhMinhHoa = fileimg_anhminhhoa.FileName;
                string anhxemthem = "";
                foreach(var item in fileimg_anhxemthem)
                {
                    var imgAnhxemThem = Path.GetFileName(item.FileName);
                    var pathimgAnhXemThem = Path.Combine(Server.MapPath("~/Content/images/image_code"), imgAnhxemThem);
                    item.SaveAs(pathimgAnhXemThem);
                    anhxemthem += item.FileName + ";";
                }
                codeTable.AnhXemThem = anhxemthem;
                db.CodeTables.Add(codeTable);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.MaTheLoai = new SelectList(db.TheLoaiTables, "MaTheLoai", "TheLoai", codeTable.MaTheLoai);
            return View(codeTable);
        }

        // GET: CodeTables/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CodeTable codeTable = await db.CodeTables.FindAsync(id);
            if (codeTable == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaAdmin = new SelectList(db.AdminTables, "MaAdmin", "TenHienThi", codeTable.MaAdmin);
            ViewBag.MaNguoiDung = new SelectList(db.NguoiDungTables, "MaNguoiDung", "TenHienThi", codeTable.MaNguoiDung);
            ViewBag.MaTheLoai = new SelectList(db.TheLoaiTables, "MaTheLoai", "TheLoai", codeTable.MaTheLoai);
            return View(codeTable);
        }

        // POST: CodeTables/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "MaCode,TenCode,AnhMinhHoa,NgayDang,LuotXem,LuotYeuThich,DanhGia,LuotDanhGia,MaNguoiDung,MaAdmin,MaTheLoai,LuotTai,LinkTai,DonGia,MoTaNgan,MoTaChiTiet,HinhAnhCode,HuongDanCaiDat")] CodeTable codeTable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(codeTable).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.MaAdmin = new SelectList(db.AdminTables, "MaAdmin", "TenHienThi", codeTable.MaAdmin);
            ViewBag.MaNguoiDung = new SelectList(db.NguoiDungTables, "MaNguoiDung", "TenHienThi", codeTable.MaNguoiDung);
            ViewBag.MaTheLoai = new SelectList(db.TheLoaiTables, "MaTheLoai", "TheLoai", codeTable.MaTheLoai);
            return View(codeTable);
        }

        // GET: CodeTables/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CodeTable codeTable = await db.CodeTables.FindAsync(id);
            if (codeTable == null)
            {
                return HttpNotFound();
            }
            return View(codeTable);
        }

        // POST: CodeTables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            CodeTable codeTable = await db.CodeTables.FindAsync(id);
            db.CodeTables.Remove(codeTable);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
