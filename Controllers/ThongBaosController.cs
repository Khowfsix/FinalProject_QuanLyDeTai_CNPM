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
    public class ThongBaosController : Controller
    {
        private QuanLyDeTaiEntities db = new QuanLyDeTaiEntities();

        // GET: ThongBaos
        public async Task<ActionResult> Index()
        {
            var thongBaos = db.ThongBaos.Include(t => t.LoaiDeTai);
            return View(await thongBaos.ToListAsync());
        }

        // GET: ThongBaos/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThongBao thongBao = await db.ThongBaos.FindAsync(id);
            if (thongBao == null)
            {
                return HttpNotFound();
            }
            return View(thongBao);
        }

        // GET: ThongBaos/Create
        public ActionResult Create()
        {
            ViewBag.maLoaiDeTai = new SelectList(db.LoaiDeTais, "maLoaiDeTai", "tenLoaiDeTai");
            return View();
        }

        // POST: ThongBaos/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "maThongBao,tieuDe,moTa,noiDung,trangThai,ngayTao,fileDinhKem,maLoaiDeTai")] ThongBao thongBao)
        {
            if (ModelState.IsValid)
            {
                db.ThongBaos.Add(thongBao);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.maLoaiDeTai = new SelectList(db.LoaiDeTais, "maLoaiDeTai", "tenLoaiDeTai", thongBao.maLoaiDeTai);
            return View(thongBao);
        }

        // GET: ThongBaos/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThongBao thongBao = await db.ThongBaos.FindAsync(id);
            if (thongBao == null)
            {
                return HttpNotFound();
            }
            ViewBag.maLoaiDeTai = new SelectList(db.LoaiDeTais, "maLoaiDeTai", "tenLoaiDeTai", thongBao.maLoaiDeTai);
            return View(thongBao);
        }

        // POST: ThongBaos/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "maThongBao,tieuDe,moTa,noiDung,trangThai,ngayTao,fileDinhKem,maLoaiDeTai")] ThongBao thongBao)
        {
            if (ModelState.IsValid)
            {
                db.Entry(thongBao).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.maLoaiDeTai = new SelectList(db.LoaiDeTais, "maLoaiDeTai", "tenLoaiDeTai", thongBao.maLoaiDeTai);
            return View(thongBao);
        }

        // GET: ThongBaos/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThongBao thongBao = await db.ThongBaos.FindAsync(id);
            if (thongBao == null)
            {
                return HttpNotFound();
            }
            return View(thongBao);
        }

        // POST: ThongBaos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            ThongBao thongBao = await db.ThongBaos.FindAsync(id);
            db.ThongBaos.Remove(thongBao);
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
