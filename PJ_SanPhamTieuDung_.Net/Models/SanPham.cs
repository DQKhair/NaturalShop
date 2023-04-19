﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PJ_SanPhamTieuDung_.Net.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;

    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            this.ChiTietHoaDons = new HashSet<ChiTietHoaDon>();
        }
    
        public int MaSanPham { get; set; }
        [DisplayName("Tên sản phẩm")]
        public string TenSanPham { get; set; }
        [DisplayName("Đơn giá")]
        public Nullable<int> DonGia { get; set; }
        public string MoTaSanPham { get; set; }
        [DisplayName("Hình ảnh")]
        public string HinhAnh { get; set; }
        public string MoTaChiTietSanPham { get; set; }
        public Nullable<int> MaDanhMucSanPham { get; set; }
        public string CachDungSanPham { get; set; }
        public string HinhAnh2 { get; set; }
        public string HinhAnh3 { get; set; }
        public string khuyenmai { get; set; }
        [DisplayName("Số lượng")]
        public Nullable<int> SoLuong { get; set; }
        [DisplayName("Thành Tiền")]
        public Nullable<int> Tien { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; }
        public virtual DanhMucSanPham DanhMucSanPham { get; set; }
    }
}