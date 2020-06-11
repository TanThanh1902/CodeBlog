//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CodeBlog.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CodeTable
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CodeTable()
        {
            this.NgonNgu_CodeTable = new HashSet<NgonNgu_CodeTable>();
        }
    
        public int MaCode { get; set; }
        public string TenCode { get; set; }
        public string MoTa { get; set; }
        public string AnhMinhHoa { get; set; }
        public Nullable<System.DateTime> NgayDang { get; set; }
        public Nullable<int> LuotXem { get; set; }
        public Nullable<int> LuotYeuThich { get; set; }
        public Nullable<double> DanhGia { get; set; }
        public Nullable<int> LuotDanhGia { get; set; }
        public Nullable<int> MaNguoiDung { get; set; }
        public Nullable<int> MaAdmin { get; set; }
        public Nullable<int> MaTheLoai { get; set; }
        public Nullable<int> LuotTai { get; set; }
        public string LinkTai { get; set; }
        public Nullable<decimal> DonGia { get; set; }
    
        public virtual AdminTable AdminTable { get; set; }
        public virtual NguoiDungTable NguoiDungTable { get; set; }
        public virtual TheLoaiTable TheLoaiTable { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NgonNgu_CodeTable> NgonNgu_CodeTable { get; set; }
    }
}
