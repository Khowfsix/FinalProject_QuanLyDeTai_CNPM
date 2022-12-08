using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using QuanLyDeTai.Models;

namespace QuanLyDeTai.ViewsModel
{
    public class NhomsViewsModel
    {
        public List<SinhVien> danhsach { get; set; }
        public int? truongNhom { get; set; }

        public NhomsViewsModel()
        {
            this.danhsach = new List<SinhVien>();
            
        }
        public NhomsViewsModel(List<SinhVien> danhsach, int? truongNhom)
        {
            this.danhsach = danhsach;
            this.truongNhom = truongNhom;
          
        }
    }
}