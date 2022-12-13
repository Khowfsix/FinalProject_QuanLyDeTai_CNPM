using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using QuanLyDeTai.Models;
using QuanLyDeTai.ViewModel;

namespace QuanLyDeTai.Controllers
{
    public class DeTaisController : Controller
    {
        private QuanLyDeTaiEntities db = new QuanLyDeTaiEntities();

        // GET: DeTais
        public ActionResult Index()
        {
            var userId = User.Identity.GetUserId();
            var deTais = db.DeTais.Include(d => d.ChuyenNganh).Include(d => d.LoaiDeTai1);
            if (User.IsInRole("Giảng viên"))
                ViewBag.maGiangVien = db.GiangViens.Where(p => p.account_ID == userId).First().maGiangVien;
            else if (User.IsInRole("Sinh viên"))
            {
                ViewBag.masinhvien = db.SinhViens.Where(p => p.account_ID == userId).First().MSSV;
            }

            return View(deTais.ToList());
        }

        //: Giảng viên đăng Ký Đề Tài mới
        public ActionResult GiangVienDangKy()
        {
            var accountId = User.Identity.GetUserId();
            ViewBag.maChuyenNganh = new SelectList(db.ChuyenNganhs, "maChuyenNganh", "tenChuyenNganh");
            ViewBag.loaiDeTai = new SelectList(db.LoaiDeTais, "maLoaiDeTai", "tenLoaiDeTai");
            ViewBag.MaGiangVien = db.GiangViens.Where(p => p.account_ID == accountId).Select(p => p.maGiangVien).First();
            return View("Create");
        }
        //: Giảng viên đăng Ký Đề Tài mới
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult GiangVienDangKy([Bind(Include = "maDeTai,tenDeTai,mucTieu,yeuCau,sanPham,chuThich,soLuongSinhVienToiDa,duocDangKyKhacChuyenNganh,nienKhoa,loaiDeTai,diem,truongNhom,gvHuongDan,TrangThai,maChuyenNganh")] DeTai deTai)
        {
            if (ModelState.IsValid)
            {
                deTai.TrangThai = "Đang chờ duyệt";
                db.DeTais.Add(deTai);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.maChuyenNganh = new SelectList(db.ChuyenNganhs, "maChuyenNganh", "tenChuyenNganh", deTai.maChuyenNganh);
            ViewBag.loaiDeTai = new SelectList(db.LoaiDeTais, "maLoaiDeTai", "tenLoaiDeTai", deTai.loaiDeTai);
            return View(deTai);
        }
        //: Sinh viên hủy đăng Ký Đề Tài
        public ActionResult SinhVienHuyDangKy(int maDeTai)
        {
            var userId = User.Identity.GetUserId();
            DeTai dt = db.DeTais.Where(p => p.maDeTai == maDeTai).FirstOrDefault();
            SinhVien sv = db.SinhViens.Where(s => s.account_ID == userId).FirstOrDefault();

            foreach (var item in dt.Nhoms)
            {
                if (sv.MSSV == item.MSSV)
                {
                    dt.Nhoms.Remove(item);
                    break;
                }

            }

            if (dt.Nhoms.Count != 0)
                dt.truongNhom = dt.Nhoms.First().MSSV;
            else
            {
                dt.truongNhom = null;
                dt.TrangThai = "Trống";
            }


            db.SaveChanges();

            ViewBag.masinhvien = db.SinhViens.Where(p => p.account_ID == userId).First().MSSV;
            var deTais = db.DeTais.Include(d => d.ChuyenNganh).Include(d => d.LoaiDeTai1);
            return View("Index", deTais.ToList());
        }
        //: Sinh viên đăng Ký Đề Tài
        public ActionResult SinhVienDangKy(int maDeTai)
        {
            var userId = User.Identity.GetUserId();
            DeTai dt = db.DeTais.Where(p => p.maDeTai == maDeTai).FirstOrDefault();
            SinhVien sv = db.SinhViens.Where(s => s.account_ID == userId).FirstOrDefault();
            if (DateTime.Now > dt.LoaiDeTai1.tgDangKy && DateTime.Now < dt.LoaiDeTai1.tgKetThuc)
            {
                if (dt.Nhoms.Count == 0)
                {
                    Nhom nhom = new Nhom();
                    nhom.maDeTai = dt.maDeTai;
                    nhom.DeTai = dt;
                    nhom.MSSV = sv.MSSV;
                    dt.Nhoms.Add(nhom);
                    dt.truongNhom = sv.MSSV;
                    dt.TrangThai = "Đã có người đăng ký";
                }
                db.SaveChanges();
            }

            ViewBag.masinhvien = db.SinhViens.Where(p => p.account_ID == userId).First().MSSV;
            var deTais = db.DeTais.Include(d => d.ChuyenNganh).Include(d => d.LoaiDeTai1);
            //return View("Index", deTais.ToList());
            return RedirectToAction("getListDeTaisByLoaiDeTai", "DeTais", new { maLoaiDeTai = maDeTai});
        }
        //GET: Menu Of Actions
        public ActionResult MenuAction()
        {
            return View("MenuAction");
        }

        //GET: List DeTais by LoaiDeTais
        public ActionResult getListDeTaisByLoaiDeTai(int? maLoaiDeTai)
        {
            var userId = User.Identity.GetUserId();
            var deTais = db.DeTais.Where(t => t.loaiDeTai == maLoaiDeTai).Include(d => d.ChuyenNganh).Include(d => d.LoaiDeTai1).Where(d => !d.TrangThai.Equals("Đang chờ duyệt"));
            if (User.IsInRole("Giảng viên"))
                ViewBag.maGiangVien = db.GiangViens.Where(p => p.account_ID == userId).First().maGiangVien;
            else if (User.IsInRole("Sinh viên"))
            {
                ViewBag.masinhvien = db.SinhViens.Where(p => p.account_ID == userId).First().MSSV;
            }
            return View("Index", deTais.ToList());
        }

        // GET: DeTais/Details/5
        public ActionResult Details(int? id)
        {
            var accountId = User.Identity.GetUserId();

            if (User.IsInRole("Giảng viên"))
            {
                var maGiangVien = db.GiangViens.Where(p => p.account_ID == accountId).Select(p => p.maGiangVien).FirstOrDefault();

                ViewBag.maGiangVien = maGiangVien;
            }
            else if (User.IsInRole("Sinh viên"))
            {
                var maSinhVien = db.SinhViens.Where(p => p.account_ID == accountId).Select(p => p.MSSV).FirstOrDefault();

                ViewBag.maSinhVien = maSinhVien;
            }
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DeTai deTai = db.DeTais.Find(id);
            if (deTai == null)
            {
                return HttpNotFound();
            }
            return View(deTai);
        }


        // GET: DeTais/Create
        public ActionResult Create()
        {
            var accountId = User.Identity.GetUserId();
            ViewBag.maChuyenNganh = new SelectList(db.ChuyenNganhs, "maChuyenNganh", "tenChuyenNganh");
            ViewBag.loaiDeTai = new SelectList(db.LoaiDeTais, "maLoaiDeTai", "tenLoaiDeTai");
            return View();
        }

        // POST: DeTais/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "maDeTai,tenDeTai,mucTieu,yeuCau,sanPham,chuThich,soLuongSinhVienToiDa,duocDangKyKhacChuyenNganh,nienKhoa,loaiDeTai,diem,truongNhom,gvHuongDan,TrangThai,maChuyenNganh")] DeTai deTai)
        {
            if (ModelState.IsValid)
            {
                db.DeTais.Add(deTai);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.maChuyenNganh = new SelectList(db.ChuyenNganhs, "maChuyenNganh", "tenChuyenNganh", deTai.maChuyenNganh);
            ViewBag.loaiDeTai = new SelectList(db.LoaiDeTais, "maLoaiDeTai", "tenLoaiDeTai", deTai.loaiDeTai);
            return View(deTai);
        }

        // GET: DeTais/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DeTai deTai = db.DeTais.Find(id);
            if (deTai == null)
            {
                return HttpNotFound();
            }
            ViewBag.maChuyenNganh = new SelectList(db.ChuyenNganhs, "maChuyenNganh", "tenChuyenNganh", deTai.maChuyenNganh);
            ViewBag.loaiDeTai = new SelectList(db.LoaiDeTais, "maLoaiDeTai", "tenLoaiDeTai", deTai.loaiDeTai);
            return View(deTai);
        }

        // POST: DeTais/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "maDeTai,tenDeTai,mucTieu,yeuCau,sanPham,chuThich,soLuongSinhVienToiDa,duocDangKyKhacChuyenNganh,nienKhoa,loaiDeTai,diem,truongNhom,gvHuongDan,TrangThai,maChuyenNganh")] DeTai deTai)
        {
            if (ModelState.IsValid)
            {
                db.Entry(deTai).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Details", new { id = deTai.maDeTai });
            }
            ViewBag.maChuyenNganh = new SelectList(db.ChuyenNganhs, "maChuyenNganh", "tenChuyenNganh", deTai.maChuyenNganh);
            ViewBag.loaiDeTai = new SelectList(db.LoaiDeTais, "maLoaiDeTai", "tenLoaiDeTai", deTai.loaiDeTai);
            return View(deTai);
        }

        // GET: DeTais/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DeTai deTai = db.DeTais.Find(id);
            if (deTai == null)
            {
                return HttpNotFound();
            }
            return View(deTai);
        }

        // POST: DeTais/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DeTai deTai = db.DeTais.Find(id);
            db.DeTais.Remove(deTai);
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
