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
    public class Admin_NguoiDungTablesController : Controller
    {
        private CodeBlogEntities db = new CodeBlogEntities();

        // GET: Admin_NguoiDungTables
        public ActionResult Index()
        {
            return View(db.NguoiDungTables.ToList());
        }

        // GET: Admin_NguoiDungTables/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NguoiDungTable nguoiDungTable = db.NguoiDungTables.Find(id);
            if (nguoiDungTable == null)
            {
                return HttpNotFound();
            }
            return View(nguoiDungTable);
        }

        // GET: Admin_NguoiDungTables/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin_NguoiDungTables/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaNguoiDung,TenHienThi,TaiKhoan,MatKhau,AnhDaiDien,NgayTao,Token,Email")] NguoiDungTable nguoiDungTable)
        {
            if (ModelState.IsValid)
            {
                db.NguoiDungTables.Add(nguoiDungTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(nguoiDungTable);
        }

        // GET: Admin_NguoiDungTables/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NguoiDungTable nguoiDungTable = db.NguoiDungTables.Find(id);
            if (nguoiDungTable == null)
            {
                return HttpNotFound();
            }
            return View(nguoiDungTable);
        }

        // POST: Admin_NguoiDungTables/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaNguoiDung,TenHienThi,TaiKhoan,MatKhau,AnhDaiDien,NgayTao,Token,Email")] NguoiDungTable nguoiDungTable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nguoiDungTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(nguoiDungTable);
        }

        // GET: Admin_NguoiDungTables/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NguoiDungTable nguoiDungTable = db.NguoiDungTables.Find(id);
            if (nguoiDungTable == null)
            {
                return HttpNotFound();
            }
            return View(nguoiDungTable);
        }

        // POST: Admin_NguoiDungTables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NguoiDungTable nguoiDungTable = db.NguoiDungTables.Find(id);
            db.NguoiDungTables.Remove(nguoiDungTable);
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
