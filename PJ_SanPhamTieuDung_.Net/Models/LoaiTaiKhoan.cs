//------------------------------------------------------------------------------
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
    
    public partial class LoaiTaiKhoan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LoaiTaiKhoan()
        {
            this.NguoiDungs = new HashSet<NguoiDung>();
            this.ChucNangs = new HashSet<ChucNang>();
        }
    
        public int MaLoaiTaiKhoan { get; set; }
        public string TenLoaiTaiKhoan { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NguoiDung> NguoiDungs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChucNang> ChucNangs { get; set; }
    }
}
