using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Web;
using System.Web.Mvc;
using QuanLyDeTai.Models;

namespace QuanLyDeTai.Controllers
{
    public class SearchController : Controller
    {
        private QuanLyDeTai2Entities db = new QuanLyDeTai2Entities();

        //POST: Search
        [HttpPost]
        public ActionResult Index(FormCollection form)
        {
            string searchString = form["searchString"];
            string param_option = form["param_option"];
            string group_loaidt = form["group_loaidt"];
            var giangViens = db.GiangViens.Include(g => g.AspNetUser);
            var sinhViens = db.SinhViens.Include(s => s.AspNetUser).Include(s => s.ChuyenNganh);
            var deTais = db.DeTais.Include(d => d.LoaiDeTai1);
            List<GiangVien> resultSearchGV = new List<GiangVien>();
            List<SinhVien> resultSearchSV = new List<SinhVien>();
            List<DeTai> resultSearchDT = new List<DeTai>();
            ViewBag.Keyword = searchString;
            if (param_option == "timkiemgiangvien")
            {
                if (!String.IsNullOrEmpty(searchString))
                {
                    searchString = searchString.ToLower();
                    foreach (var giangVien in giangViens)
                    {
                        var chuyenNganh = db.ChuyenNganhs.Where(c => c.tenChuyenNganh.ToLower().Contains(searchString)).FirstOrDefault();
                        if (giangVien.tenGiangVien.ToLower().Contains(searchString))
                        {
                            resultSearchGV.Add(giangVien);
                        }
                        else if (giangVien.loaiGiangVien.ToLower().Contains(searchString))
                        {
                            resultSearchGV.Add(giangVien);
                        }
                        else if (giangVien.maGiangVien.ToString().Contains(searchString))
                        {
                            resultSearchGV.Add(giangVien);
                        }
                        else if (giangVien.AspNetUser.Email.ToString().Contains(searchString))
                        {
                            resultSearchGV.Add(giangVien);
                        }
                        else if (chuyenNganh != null && giangVien.ChuyenNganhs.Equals(chuyenNganh))
                        {
                            resultSearchGV.Add(giangVien);
                        }

                    }
                    return View("resultSearchGV", resultSearchGV);
                }
                else
                {
                    return View("resultSearchGV", giangViens); ;
                }    
            }
            else if (param_option == "timkiemsinhvien")
            {
                if (!String.IsNullOrEmpty(searchString))
                {
                    searchString = searchString.ToLower();
                    foreach (var sinhVien in sinhViens)
                    {
                        var chuyenNganh = db.ChuyenNganhs.Where(c => c.tenChuyenNganh.ToLower().Contains(searchString)).FirstOrDefault();
                        if (sinhVien.tenSinhVien.ToLower().Contains(searchString))
                        {
                            resultSearchSV.Add(sinhVien);
                        }
                        else if (sinhVien.MSSV.ToString().Contains(searchString))
                        {
                            resultSearchSV.Add(sinhVien);
                        }
                        else if (chuyenNganh != null && sinhVien.maChuyenNganh.Equals(chuyenNganh.maChuyenNganh))
                        {
                            resultSearchSV.Add(sinhVien);
                        }
                    }
                    return View("resultSearchSV", resultSearchSV);
                }
                else
                {
                    return View("resultSearchSV", sinhViens);
                }
            }
            else
            {
                if (!String.IsNullOrEmpty(searchString))
                {
                    /*
                     * var loaiDeTai = db.LoaiDeTais.Include(l => l.ChuyenNganh).Where(c=>c.tenLoaiDeTai.Contains(group_loaidt)).FirstOrDefault();
                    searchString = searchString.ToLower();
                    deTais = deTais.Where(c => c.LoaiDeTai1.Equals(loaiDeTai));
                    **/
                    foreach (var deTai in deTais)
                    {
                        if (deTai.tenDeTai.ToLower().Contains(searchString))
                        {
                            resultSearchDT.Add(deTai);
                        }
                        else if (deTai.soLuongSinhVienToiDa.ToString().Contains(searchString))
                        {
                            resultSearchDT.Add(deTai);
                        }
                        else if (deTai.truongNhom.ToString().Contains(searchString))
                        {
                            resultSearchDT.Add(deTai);
                        }
                        else if (deTai.gvHuongDan.ToString().Contains(searchString))
                        {
                            resultSearchDT.Add(deTai);
                        }
                        else if (deTai.LoaiDeTai1.ChuyenNganh.tenChuyenNganh.ToString().Contains(searchString))
                        {
                            resultSearchDT.Add(deTai);
                        }
                        else if (deTai.LoaiDeTai1.tenLoaiDeTai.ToString().Contains(searchString))
                        {
                            resultSearchDT.Add(deTai);
                        }
                    }
                    return View("resultSearchDT", deTais);
                }
                else
                {
                    return View("resultSearchDT", deTais);
                }
            }
        }
        
        // GET: Search
        public ActionResult Index()
        {
            var loaiDeTais = db.LoaiDeTais.Include(l => l.ChuyenNganh);
            return View(loaiDeTais.ToList());
           
        }

    }
}