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
    public class NgonNguTablesController : Controller
    {
        private CodeBlogEntities db = new CodeBlogEntities();

        // GET: NgonNguTables
        public ActionResult Index()
        {
            return View(db.NgonNguTables.ToList());
        }

        // GET: NgonNguTables/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NgonNguTable ngonNguTable = db.NgonNguTables.Find(id);
            if (ngonNguTable == null)
            {
                return HttpNotFound();
            }
            return View(ngonNguTable);
        }

        // GET: NgonNguTables/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: NgonNguTables/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaNgonNgu,NgonNgu")] NgonNguTable ngonNguTable)
        {
            if (ModelState.IsValid)
            {
                db.NgonNguTables.Add(ngonNguTable);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(ngonNguTable);
        }

        // GET: NgonNguTables/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NgonNguTable ngonNguTable = db.NgonNguTables.Find(id);
            if (ngonNguTable == null)
            {
                return HttpNotFound();
            }
            return View(ngonNguTable);
        }

        // POST: NgonNguTables/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaNgonNgu,NgonNgu")] NgonNguTable ngonNguTable)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ngonNguTable).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(ngonNguTable);
        }

        // GET: NgonNguTables/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NgonNguTable ngonNguTable = db.NgonNguTables.Find(id);
            if (ngonNguTable == null)
            {
                return HttpNotFound();
            }
            return View(ngonNguTable);
        }

        // POST: NgonNguTables/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NgonNguTable ngonNguTable = db.NgonNguTables.Find(id);
            db.NgonNguTables.Remove(ngonNguTable);
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
