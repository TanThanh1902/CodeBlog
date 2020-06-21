using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using CodeBlog.Models;

namespace CodeBlog.Controllers
{
    public class BlogTablesController : Controller
    {
        private CodeBlogEntities db = new CodeBlogEntities();

        // GET: BlogTables
        public ActionResult Index()
        {
            var blogTables = db.BlogTables.Include(b => b.NguoiDungTable).Include(b => b.TheLoaiTable);
            return View(blogTables.ToList());
        }

        // GET: BlogTables/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BlogTable blogTable = db.BlogTables.Find(id);
            if (blogTable == null)
            {
                return HttpNotFound();
            }
            return View(blogTable);
        }

        // GET: BlogTables/Create
        public ActionResult Create()
        {
            ViewBag.MaNguoiDung = new SelectList(db.NguoiDungTables, "MaNguoiDung", "TenHienThi");
            ViewBag.MaTheLoai = new SelectList(db.TheLoaiTables, "MaTheLoai", "TheLoai");
            return View();
        }

        // POST: BlogTables/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaBlog,TenBlog,NoiDung,NgayDang,MaNguoiDung,AnhMinhHoa,MaTheLoai")] BlogTable blogTable)
        {
            if (ModelState.IsValid)
            {
                db.BlogTables.Add(blogTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaTheLoai = new SelectList(db.TheLoaiTables, "MaTheLoai", "TheLoai", blogTable.MaTheLoai);
            return View(blogTable);
        }

        // GET: BlogTables/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BlogTable blogTable = db.BlogTables.Find(id);
            if (blogTable == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaTheLoai = new SelectList(db.TheLoaiTables, "MaTheLoai", "TheLoai", blogTable.MaTheLoai);
            return View(blogTable);
        }

        // POST: BlogTables/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaBlog,TenBlog,NoiDung,NgayDang,MaNguoiDung,AnhMinhHoa,MaTheLoai")] BlogTable blogTable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(blogTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaTheLoai = new SelectList(db.TheLoaiTables, "MaTheLoai", "TheLoai", blogTable.MaTheLoai);
            return View(blogTable);
        }

        // GET: BlogTables/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BlogTable blogTable = db.BlogTables.Find(id);
            if (blogTable == null)
            {
                return HttpNotFound();
            }
            return View(blogTable);
        }

        // POST: BlogTables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BlogTable blogTable = db.BlogTables.Find(id);
            db.BlogTables.Remove(blogTable);
            db.SaveChanges();
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
