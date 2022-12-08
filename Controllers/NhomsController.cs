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
using QuanLyDeTai.ViewsModel;
using Microsoft.AspNet.Identity;

namespace QuanLyDeTai.Controllers
{
    public class NhomsController : Controller
    {
        private QuanLyDeTaiEntities db = new QuanLyDeTaiEntities();

        // GET: Nhoms
        public ActionResult Index()
        {
            var nhoms = db.Nhoms.Include(n => n.DeTai);
            return View(nhoms.ToList());
        }
        // GET: Nhoms/Delete/5
        public async Task<ActionResult> XoaThanhVien(int maDeTai, int? id)
        {
            ViewBag.maDeTai = maDeTai;
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Nhom nhom = db.Nhoms.Where(p => p.MSSV == id).FirstOrDefault();
            if (nhom == null)
            {
                return HttpNotFound();
            }
            return View(nhom);
        }

        // POST: Nhoms/Delete/5
        [HttpPost, ActionName("XoaThanhVien")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> XoaThanhVienConfirmed(int maDeTai, int id)
        {
            ViewBag.maDeTai = maDeTai;
            Nhom nhom = db.Nhoms.Where(p => p.MSSV == id).FirstOrDefault();
            db.Nhoms.Remove(nhom);

            DeTai dt = db.DeTais.Where(p => p.maDeTai == maDeTai).FirstOrDefault();
            if (dt.Nhoms.Count >= 1)
                dt.truongNhom = dt.Nhoms.First().MSSV;
            else
            {
                dt.truongNhom = null;
                dt.TrangThai = "Trống";
            }   

            await db.SaveChangesAsync();
            return RedirectToAction("DanhSachThanhVien", new { maDeTai = maDeTai });
        }
        public ActionResult ThemThanhVien(int maDeTai)
        {
            ViewBag.maDeTai = maDeTai;
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ThemThanhVien([Bind(Include = "maDeTai,MSSV,id")] Nhom nhom)
        {
            DeTai deTai = db.DeTais.Where(p => p.maDeTai == nhom.maDeTai).First();
            if (ModelState.IsValid)
            {
                if (db.SinhViens.Select(p => p.MSSV).Contains(nhom.MSSV))
                    if (deTai.Nhoms.Count < deTai.soLuongSinhVienToiDa && !deTai.Nhoms.Select(p => p.MSSV).Contains(nhom.MSSV))
                    {
                        db.Nhoms.Add(nhom);
                        if (db.Nhoms.Count() == 0)
                        {
                            deTai.truongNhom = nhom.MSSV;
                            deTai.TrangThai = "Đã có người đăng ký";
                        }
                        await db.SaveChangesAsync();
                        return RedirectToAction("DanhSachThanhVien", new { maDeTai = nhom.maDeTai });
                    }    
               
            }
            ViewBag.maDeTai = nhom.maDeTai;
            return View(nhom);
        }
        // GET: Danh Sách Thành viên
        public ActionResult DanhSachThanhVien(int maDeTai)
        {
            var nhoms = db.Nhoms.Include(n => n.DeTai).Where(p => p.maDeTai == maDeTai).ToList();
            List<SinhVien> danhsach = new List<SinhVien>();
            foreach (var item in nhoms)
            {
                danhsach.Add(db.SinhViens.Where(p => p.MSSV == item.MSSV).First());
            }

            var maTruongNhom = db.DeTais.Where(p => p.maDeTai == maDeTai).First().truongNhom;

            NhomsViewsModel model = new NhomsViewsModel(danhsach, maTruongNhom);
            var userId = User.Identity.GetUserId();
            ViewBag.maDeTai = maDeTai;
            if (User.IsInRole("Sinh viên"))
            {
                ViewBag.userMSSV = db.SinhViens.Where(p => p.account_ID == userId)
               .FirstOrDefault().MSSV;
            }
            else
            {
                var maGiangVien = db.DeTais.Where(p => p.maDeTai == maDeTai).First().gvHuongDan;
                if (maGiangVien != null)
                    ViewBag.gvhdAccountId = db.GiangViens.Where(p => p.maGiangVien == maGiangVien).First().account_ID;
            }
           
           

            return View("DanhSachThanhVien", model);
        }
        // GET: Nhoms/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Nhom nhom = db.Nhoms.Find(id);
            if (nhom == null)
            {
                return HttpNotFound();
            }
            return View(nhom);
        }

        // GET: Nhoms/Create
        public ActionResult Create()
        {
            ViewBag.maDeTai = new SelectList(db.DeTais, "maDeTai", "tenDeTai");
            return View();
        }

        // POST: Nhoms/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "maDeTai,MSSV,id")] Nhom nhom)
        {
            if (ModelState.IsValid)
            {
                db.Nhoms.Add(nhom);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.maDeTai = new SelectList(db.DeTais, "maDeTai", "tenDeTai", nhom.maDeTai);
            return View(nhom);
        }

        // GET: Nhoms/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Nhom nhom = await db.Nhoms.FindAsync(id);
            if (nhom == null)
            {
                return HttpNotFound();
            }
            ViewBag.maDeTai = new SelectList(db.DeTais, "maDeTai", "tenDeTai", nhom.maDeTai);
            return View(nhom);
        }

        // POST: Nhoms/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "maDeTai,MSSV,id")] Nhom nhom)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nhom).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.maDeTai = new SelectList(db.DeTais, "maDeTai", "tenDeTai", nhom.maDeTai);
            return View(nhom);
        }

        // GET: Nhoms/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Nhom nhom = await db.Nhoms.FindAsync(id);
            if (nhom == null)
            {
                return HttpNotFound();
            }
            return View(nhom);
        }

        // POST: Nhoms/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Nhom nhom = await db.Nhoms.FindAsync(id);
            db.Nhoms.Remove(nhom);
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
