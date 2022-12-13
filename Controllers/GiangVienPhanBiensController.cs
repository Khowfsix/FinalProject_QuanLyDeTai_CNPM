using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QuanLyDeTai.Models;

namespace QuanLyDeTai.Controllers
{
    public class GiangVienPhanBiensController : Controller
    {
        private QuanLyDeTaiEntities db = new QuanLyDeTaiEntities();

        // GET: GiangVienPhanBiens
        public async Task<ActionResult> Index()
        {
            var giangVienPhanBiens = db.GiangVienPhanBiens.Include(g => g.DeTai);
            return View(await giangVienPhanBiens.ToListAsync());
        }

        // GET: GiangVienPhanBiens/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GiangVienPhanBien giangVienPhanBien = await db.GiangVienPhanBiens.FindAsync(id);
            if (giangVienPhanBien == null)
            {
                return HttpNotFound();
            }
            return View(giangVienPhanBien);
        }

        // GET: GiangVienPhanBiens/Create
        public ActionResult Create()
        {
            ViewBag.maDeTai = new SelectList(db.DeTais, "maDeTai", "tenDeTai");
            return View();
        }

        // POST: GiangVienPhanBiens/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "id,maGiangVien,maDeTai")] GiangVienPhanBien giangVienPhanBien)
        {
            if (ModelState.IsValid)
            {
                db.GiangVienPhanBiens.Add(giangVienPhanBien);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.maDeTai = new SelectList(db.DeTais, "maDeTai", "tenDeTai", giangVienPhanBien.maDeTai);
            return View(giangVienPhanBien);
        }

        // GET: GiangVienPhanBiens/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GiangVienPhanBien giangVienPhanBien = await db.GiangVienPhanBiens.FindAsync(id);
            if (giangVienPhanBien == null)
            {
                return HttpNotFound();
            }
            ViewBag.maDeTai = new SelectList(db.DeTais, "maDeTai", "tenDeTai", giangVienPhanBien.maDeTai);
            return View(giangVienPhanBien);
        }

        // POST: GiangVienPhanBiens/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "id,maGiangVien,maDeTai")] GiangVienPhanBien giangVienPhanBien)
        {
            if (ModelState.IsValid)
            {
                db.Entry(giangVienPhanBien).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.maDeTai = new SelectList(db.DeTais, "maDeTai", "tenDeTai", giangVienPhanBien.maDeTai);
            return View(giangVienPhanBien);
        }

        // GET: GiangVienPhanBiens/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GiangVienPhanBien giangVienPhanBien = await db.GiangVienPhanBiens.FindAsync(id);
            if (giangVienPhanBien == null)
            {
                return HttpNotFound();
            }
            return View(giangVienPhanBien);
        }

        // POST: GiangVienPhanBiens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            GiangVienPhanBien giangVienPhanBien = await db.GiangVienPhanBiens.FindAsync(id);
            db.GiangVienPhanBiens.Remove(giangVienPhanBien);
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
