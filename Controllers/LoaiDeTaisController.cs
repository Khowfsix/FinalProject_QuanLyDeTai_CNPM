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
using QuanLyDeTai.ViewModel;

namespace QuanLyDeTai.Controllers
{
    public class LoaiDeTaisController : Controller
    {
        private QuanLyDeTaiEntities db = new QuanLyDeTaiEntities();

        // GET: LoaiDeTais
        public ActionResult Index()
        {
            var loaiDeTais = db.LoaiDeTais;
            return View(loaiDeTais.ToList());
        }
        public ActionResult DanhSachDotDangKy()
        {
            var loaiDeTais = db.LoaiDeTais;
            return View(loaiDeTais.ToList());
        }
        // GET: LoaiDeTais/Delete/5
        public async Task<ActionResult> XoaDotDangKy(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiDeTai loaiDeTai = await db.LoaiDeTais.FindAsync(id);
            if (loaiDeTai == null)
            {
                return HttpNotFound();
            }
            return View(loaiDeTai);
        }

        // POST: LoaiDeTais/Delete/5
        [HttpPost, ActionName("XoaDotDangKy")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> XoaDotDangKyConfirmed(int id)
        {
            LoaiDeTai loaiDeTai = await db.LoaiDeTais.FindAsync(id);
            loaiDeTai.tgKetThuc = null;
            loaiDeTai.tgDangKy = null;
            await db.SaveChangesAsync();
            return RedirectToAction("DanhSachDotDangKy");
        }
        // GET: DeTais/Create
        public ActionResult TaoDotDangKy()
        {
            ViewBag.maLoaiDeTai = new SelectList(db.LoaiDeTais, "maLoaiDeTai", "tenLoaiDeTai");
            return View();
        }

        // POST: DeTais/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TaoDotDangKy([Bind(Include = "maLoaiDeTai,gioBatDau,gioKetThuc,ngayBatDau,ngayKetThuc")] DotDangKy dotDangKy)
        {
            if (ModelState.IsValid)
            {

                LoaiDeTai loaiDeTai = db.LoaiDeTais.Where(p => p.maLoaiDeTai == dotDangKy.maLoaiDeTai).FirstOrDefault();
                DateTime temp = new DateTime();
                var isValidDate = DateTime.TryParse(dotDangKy.ngayBatDau + " " + dotDangKy.gioBatDau, out temp);

                if (isValidDate)
                    loaiDeTai.tgDangKy = temp;

                isValidDate = DateTime.TryParse(dotDangKy.ngayKetThuc + " " + dotDangKy.gioKetThuc, out temp);

                if (isValidDate)
                    loaiDeTai.tgKetThuc = temp;

                db.SaveChanges();

                return RedirectToAction("MenuAction", "DeTais");
            }
            ViewBag.maLoaiDeTai = new SelectList(db.LoaiDeTais, "maLoaiDeTai", "tenLoaiDeTai");
            return View(dotDangKy);
        }
        public ActionResult ChonLoaiDeTai()
        {
            var loaiDeTais = db.LoaiDeTais.Select(p => p);
            return View(loaiDeTais.ToList());
        }

        // GET: LoaiDeTais/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiDeTai loaiDeTai = await db.LoaiDeTais.FindAsync(id);
            if (loaiDeTai == null)
            {
                return HttpNotFound();
            }
            return View(loaiDeTai);
        }

        // GET: LoaiDeTais/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LoaiDeTais/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "maLoaiDeTai,tenLoaiDeTai,nienKhoa,hocKy,tgDangKy,tgKetThuc")] LoaiDeTai loaiDeTai)
        {
            if (ModelState.IsValid)
            {
                db.LoaiDeTais.Add(loaiDeTai);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(loaiDeTai);
        }

        // GET: LoaiDeTais/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiDeTai loaiDeTai = await db.LoaiDeTais.FindAsync(id);
            if (loaiDeTai == null)
            {
                return HttpNotFound();
            }
            return View(loaiDeTai);
        }

        // POST: LoaiDeTais/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "maLoaiDeTai,tenLoaiDeTai,nienKhoa,hocKy,tgDangKy,tgKetThuc")] LoaiDeTai loaiDeTai)
        {
            if (ModelState.IsValid)
            {
                db.Entry(loaiDeTai).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(loaiDeTai);
        }

        // GET: LoaiDeTais/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiDeTai loaiDeTai = await db.LoaiDeTais.FindAsync(id);
            if (loaiDeTai == null)
            {
                return HttpNotFound();
            }
            return View(loaiDeTai);
        }

        // POST: LoaiDeTais/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            LoaiDeTai loaiDeTai = await db.LoaiDeTais.FindAsync(id);
            db.LoaiDeTais.Remove(loaiDeTai);
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
