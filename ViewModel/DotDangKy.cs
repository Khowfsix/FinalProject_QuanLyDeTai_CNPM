using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace QuanLyDeTai.ViewModel
{
    public class DotDangKy
    {
        [Required]
        public int maLoaiDeTai { get; set; }
        [Required]
        [ValidTime]
        public string gioBatDau { get; set; }
        [Required]
        [ValidTime]
        public string gioKetThuc { get; set; }
        [Required]
        public string ngayBatDau { get; set; }
        [FutureDate]
        [Required]
        public string ngayKetThuc { get; set; }
    }
}