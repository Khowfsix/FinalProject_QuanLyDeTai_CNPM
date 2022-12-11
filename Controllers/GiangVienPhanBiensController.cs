﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QuanLyDeTai.Models;
using QuanLyDeTai.ViewModel;

namespace QuanLyDeTai.Controllers
{
    public class GiangVienPhanBiensController : Controller
    {
        private QuanLyDeTaiEntities1 db = new QuanLyDeTaiEntities1();

        // GET: GiangVienPhanBiens
        public ActionResult Index()
        {
            var giangVienPhanBiens = db.GiangVienPhanBiens.Include(g => g.DeTai);
            return View(giangVienPhanBiens.ToList());
        }
        public ActionResult PhanPhanBien()
        {
            var deTais = db.DeTais.Include(d => d.LoaiDeTai1);
            var giangViens = db.GiangViens.Include(g => g.AspNetUser);
            PhanPhanBienViewModel phanPhanBien = new PhanPhanBienViewModel();
            phanPhanBien.deTais = deTais.ToList();
            phanPhanBien.giangViens = giangViens.ToList();
            return View(phanPhanBien);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult PhanPhanBien(FormCollection form)
        {
            int maDeTai = Convert.ToInt32(form["maDeTai"]);
            int maGiangVien = Convert.ToInt32(form["maGiangVien"]);
            GiangVienPhanBien phanPhanBien = new GiangVienPhanBien();
            phanPhanBien.maDeTai = maDeTai;
            phanPhanBien.maGiangVien = maGiangVien;
            db.GiangVienPhanBiens.Add(phanPhanBien);
            db.SaveChanges();
            return Redirect("PhanPhanBien");
        }

        public ActionResult PhanHoiDong()
        {
            var deTais = db.DeTais.Include(d => d.LoaiDeTai1);
            var giangViens = db.GiangViens.Include(g => g.AspNetUser);
            HoiDongChamViewModel hoiDongCham = new HoiDongChamViewModel();
            hoiDongCham.deTais = deTais.ToList();
            hoiDongCham.giangViens = giangViens.ToList();
            return View(hoiDongCham);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult PhanHoiDong(FormCollection form)
        {
            int maDeTai = Convert.ToInt32(form["maDeTai"]);
            int maGiangVien = Convert.ToInt32(form["maGiangVien"]);
            HoiDongCham hoiDongCham = new HoiDongCham();
            hoiDongCham.maDeTai = maDeTai;
            hoiDongCham.maGiangVien = maGiangVien;
            db.HoiDongChams.Add(hoiDongCham);
            db.SaveChanges();
            return Redirect("PhanPhanBien");
        }
        // GET: GiangVienPhanBiens/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GiangVienPhanBien giangVienPhanBien = db.GiangVienPhanBiens.Find(id);
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
        public ActionResult Create([Bind(Include = "maPhanBien,maGiangVien,maDeTai")] GiangVienPhanBien giangVienPhanBien)
        {
            if (ModelState.IsValid)
            {
                db.GiangVienPhanBiens.Add(giangVienPhanBien);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.maDeTai = new SelectList(db.DeTais, "maDeTai", "tenDeTai", giangVienPhanBien.maDeTai);
            return View(giangVienPhanBien);
        }

        // GET: GiangVienPhanBiens/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GiangVienPhanBien giangVienPhanBien = db.GiangVienPhanBiens.Find(id);
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
        public ActionResult Edit([Bind(Include = "maPhanBien,maGiangVien,maDeTai")] GiangVienPhanBien giangVienPhanBien)
        {
            if (ModelState.IsValid)
            {
                db.Entry(giangVienPhanBien).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.maDeTai = new SelectList(db.DeTais, "maDeTai", "tenDeTai", giangVienPhanBien.maDeTai);
            return View(giangVienPhanBien);
        }

        // GET: GiangVienPhanBiens/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GiangVienPhanBien giangVienPhanBien = db.GiangVienPhanBiens.Find(id);
            if (giangVienPhanBien == null)
            {
                return HttpNotFound();
            }
            return View(giangVienPhanBien);
        }

        // POST: GiangVienPhanBiens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            GiangVienPhanBien giangVienPhanBien = db.GiangVienPhanBiens.Find(id);
            db.GiangVienPhanBiens.Remove(giangVienPhanBien);
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
