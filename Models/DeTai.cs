//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyDeTai.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class DeTai
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DeTai()
        {
            this.HoiDongChams = new HashSet<HoiDongCham>();
            this.Nhoms = new HashSet<Nhom>();
            this.GiangVienPhanBiens = new HashSet<GiangVienPhanBien>();
        }
    
        public int maDeTai { get; set; }
        public string tenDeTai { get; set; }
        public string mucTieu { get; set; }
        public string yeuCau { get; set; }
        public string sanPham { get; set; }
        public string chuThich { get; set; }
        public Nullable<int> soLuongSinhVienToiDa { get; set; }
        public Nullable<bool> duocDangKyKhacChuyenNganh { get; set; }
        public string nienKhoa { get; set; }
        public Nullable<int> loaiDeTai { get; set; }
        public Nullable<double> diem { get; set; }
        public Nullable<int> truongNhom { get; set; }
        public Nullable<int> gvHuongDan { get; set; }
    
        public virtual LoaiDeTai LoaiDeTai1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HoiDongCham> HoiDongChams { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Nhom> Nhoms { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GiangVienPhanBien> GiangVienPhanBiens { get; set; }
    }
}
