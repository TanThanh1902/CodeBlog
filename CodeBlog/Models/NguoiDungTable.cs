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
    
    public partial class NguoiDungTable
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NguoiDungTable()
        {
            this.BlogTables = new HashSet<BlogTable>();
            this.CodeTables = new HashSet<CodeTable>();
        }
    
        public int MaNguoiDung { get; set; }
        public string TenHienThi { get; set; }
        public string TaiKhoan { get; set; }
        public string MatKhau { get; set; }
        public string AnhDaiDien { get; set; }
        public Nullable<System.DateTime> NgayTao { get; set; }
        public string Token { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BlogTable> BlogTables { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CodeTable> CodeTables { get; set; }
    }
}
