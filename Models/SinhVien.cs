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
    
    public partial class SinhVien
    {
        public string account_ID { get; set; }
        public int MSSV { get; set; }
        public string tenSinhVien { get; set; }
        public Nullable<int> maChuyenNganh { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual ChuyenNganh ChuyenNganh { get; set; }
    }
}
