﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class CodeBlogEntities : DbContext
    {
        public CodeBlogEntities()
            : base("name=CodeBlogEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<AdminTable> AdminTables { get; set; }
        public virtual DbSet<BlogTable> BlogTables { get; set; }
        public virtual DbSet<ChuDeTable> ChuDeTables { get; set; }
        public virtual DbSet<CodeTable> CodeTables { get; set; }
        public virtual DbSet<DanhMuc_TheLoaiTable> DanhMuc_TheLoaiTable { get; set; }
        public virtual DbSet<DanhMucTable> DanhMucTables { get; set; }
        public virtual DbSet<NgonNgu_BlogTable> NgonNgu_BlogTable { get; set; }
        public virtual DbSet<NgonNgu_CodeTable> NgonNgu_CodeTable { get; set; }
        public virtual DbSet<NgonNguTable> NgonNguTables { get; set; }
        public virtual DbSet<NguoiDungTable> NguoiDungTables { get; set; }
        public virtual DbSet<TheLoaiTable> TheLoaiTables { get; set; }
        public virtual DbSet<TinTucTable> TinTucTables { get; set; }
    }
}
