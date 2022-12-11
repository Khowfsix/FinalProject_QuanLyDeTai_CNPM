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
    public class GiangViensController : Controller
    {
        private QuanLyDeTai2Entities db = new QuanLyDeTai2Entities();

        // GET: GiangViens
        public ActionResult Index()
        {
            var giangViens = db.GiangViens.Include(g => g.AspNetUser);
            return View(giangViens.ToList());
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
        // GET: GiangViens/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GiangVien giangVien = db.GiangViens.Find(id);
            if (giangVien == null)
            {
                return HttpNotFound();
            }
            return View(giangVien);
        }

        // GET: GiangViens/Create
        public ActionResult Create()
        {
            ViewBag.account_ID = new SelectList(db.AspNetUsers, "Id", "Email");
            return View();
        }

        // POST: GiangViens/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "account_ID,tenGiangVien,loaiGiangVien,maGiangVien")] GiangVien giangVien)
        {
            if (ModelState.IsValid)
            {
                db.GiangViens.Add(giangVien);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.account_ID = new SelectList(db.AspNetUsers, "Id", "Email", giangVien.account_ID);
            return View(giangVien);
        }

        // GET: GiangViens/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GiangVien giangVien = db.GiangViens.Find(id);
            if (giangVien == null)
            {
                return HttpNotFound();
            }
            ViewBag.account_ID = new SelectList(db.AspNetUsers, "Id", "Email", giangVien.account_ID);
            return View(giangVien);
        }

        // POST: GiangViens/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "account_ID,tenGiangVien,loaiGiangVien,maGiangVien")] GiangVien giangVien)
        {
            if (ModelState.IsValid)
            {
                db.Entry(giangVien).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.account_ID = new SelectList(db.AspNetUsers, "Id", "Email", giangVien.account_ID);
            return View(giangVien);
        }

        // GET: GiangViens/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GiangVien giangVien = db.GiangViens.Find(id);
            if (giangVien == null)
            {
                return HttpNotFound();
            }
            return View(giangVien);
        }

        // POST: GiangViens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            GiangVien giangVien = db.GiangViens.Find(id);
            db.GiangViens.Remove(giangVien);
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
