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
    
    public partial class ThongBao
    {
        public int maThongBao { get; set; }
        public string tieuDe { get; set; }
        public string moTa { get; set; }
        public string noiDung { get; set; }
        public Nullable<byte> trangThai { get; set; }
        public Nullable<System.DateTime> ngayTao { get; set; }
        public string fileDinhKem { get; set; }
        public Nullable<int> maLoaiDeTai { get; set; }
    
        public virtual LoaiDeTai LoaiDeTai { get; set; }
    }
}
