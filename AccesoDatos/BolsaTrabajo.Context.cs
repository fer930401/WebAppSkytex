﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AccesoDatos
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class skytexEntities : DbContext
    {
        public skytexEntities()
            : base("name=skytexEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<itmov> itmov { get; set; }
        public virtual DbSet<cccatcc> cccatcc { get; set; }
        public virtual DbSet<xcdivef> xcdivef { get; set; }
        public virtual DbSet<xcuser> xcuser { get; set; }
    }
}