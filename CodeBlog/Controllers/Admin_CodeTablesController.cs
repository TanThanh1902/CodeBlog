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
using PagedList;

namespace CodeBlog.Controllers.Admin
{
    public class Admin_CodeTablesController : Controller
    {
        private CodeBlogEntities db = new CodeBlogEntities();
        const int PAGE_SIZE = 20;
        // GET: Admin_CodeTables
        public async Task<ActionResult> Index()
        {
            var codeTables = db.CodeTables.Include(c => c.AdminTable).Include(c => c.NguoiDungTable).Include(c => c.TheLoaiTable);
            return View(await codeTables.ToListAsync());
        }
        public ActionResult dsChoDuyetBai(int? page)
        {
            IPagedList<CodeTable> model = db.CodeTables.Where(t => t.MaAdmin == null).OrderBy(t => t.NgayDang).ToPagedList(page?? 1, PAGE_SIZE);
            return View("dsCode", model);
        }
        public ActionResult DuyetBai(int? maCode)
        {
            HttpCookie maAdmin = Request.Cookies["MaAd"];
            if(maCode == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            db.CodeTables.Find(maCode).MaAdmin = int.Parse(maAdmin.Value.ToString());
            db.SaveChanges();
            return RedirectToAction("dsChoDuyetBai");
        }
        // GET: Admin_CodeTables/Details/5
        public async Task<ActionResult> Details(int? id)
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

        // GET: Admin_CodeTables/Create
        public ActionResult Create()
        {
            ViewBag.MaAdmin = new SelectList(db.AdminTables, "MaAdmin", "TenHienThi");
            ViewBag.MaNguoiDung = new SelectList(db.NguoiDungTables, "MaNguoiDung", "TenHienThi");
            ViewBag.MaTheLoai = new SelectList(db.TheLoaiTables, "MaTheLoai", "TheLoai");
            return View();
        }

        // POST: Admin_CodeTables/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "MaCode,TenCode,AnhMinhHoa,NgayDang,LuotXem,LuotYeuThich,MaNguoiDung,MaAdmin,MaTheLoai,LuotTai,LinkTai,DonGia,MoTaNgan,MoTaChiTiet,HuongDanCaiDat,AnhXemThem")] CodeTable codeTable)
        {
            if (ModelState.IsValid)
            {
                db.CodeTables.Add(codeTable);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.MaAdmin = new SelectList(db.AdminTables, "MaAdmin", "TenHienThi", codeTable.MaAdmin);
            ViewBag.MaNguoiDung = new SelectList(db.NguoiDungTables, "MaNguoiDung", "TenHienThi", codeTable.MaNguoiDung);
            ViewBag.MaTheLoai = new SelectList(db.TheLoaiTables, "MaTheLoai", "TheLoai", codeTable.MaTheLoai);
            return View(codeTable);
        }

        // GET: Admin_CodeTables/Edit/5
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

        // POST: Admin_CodeTables/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "MaCode,TenCode,AnhMinhHoa,NgayDang,LuotXem,LuotYeuThich,MaNguoiDung,MaAdmin,MaTheLoai,LuotTai,LinkTai,DonGia,MoTaNgan,MoTaChiTiet,HuongDanCaiDat,AnhXemThem")] CodeTable codeTable)
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

        // GET: Admin_CodeTables/Delete/5
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

        // POST: Admin_CodeTables/Delete/5
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
