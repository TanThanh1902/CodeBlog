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
    
    public partial class DanhMuc_TheLoaiTable
    {
        public int MaDanhMuc_TheLoai { get; set; }
        public Nullable<int> MaDanhMuc { get; set; }
        public Nullable<int> MaTheLoai { get; set; }
    
        public virtual DanhMucTable DanhMucTable { get; set; }
        public virtual TheLoaiTable TheLoaiTable { get; set; }
    }
}
