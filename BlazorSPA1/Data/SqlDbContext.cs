using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations.Schema;
using System.IO;
//using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using BlazorSPA1.Pages;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace BlazorSPA1.Data
{

    public class SqlDbContext : DbContext
    {
        public SqlDbContext(DbContextOptions<SqlDbContext> options)
           : base(options)
        {
        }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<Personne> Personnes { get; set; }
        public DbSet<Tache> Taches { get; set; }
        public DbSet<Enfant> Enfants { get; set; }
        public DbSet<Parent> Parents { get; set; }
        public DbSet<Conjointe> Conjointes { get; set; }
        public DbSet<TacheResp> TacheResps { get; set; }



        public DbSet<Company> Companies { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            modelBuilder.Entity<Company>()
        .HasMany(c => c.Employees)
        .WithOne(d=>d.Company).HasForeignKey(d => d.CompanyID)
               .HasConstraintName("FK_Employees_Companies_CompanyId");
            modelBuilder.Entity<Personne>()
        .HasMany(c => c.Parents)
        .WithOne(d => d.Personne).HasForeignKey(d => d.idper);
            modelBuilder.Entity<Personne>()
        .HasMany(c => c.Enfants)
        .WithOne(d => d.Personne).HasForeignKey(d => d.idper);
            modelBuilder.Entity<Personne>()
        .HasMany(c => c.Conjointes)
        .WithOne(d => d.Personne).HasForeignKey(d => d.idper);
            modelBuilder.Entity<TacheResp>()
        .HasKey(bc => new { bc.IdPer, bc.IdTache });
            modelBuilder.Entity<TacheResp>()
                .HasOne(bc => bc.Personne)
                .WithMany(b => b.Taches)
                .HasForeignKey(bc => bc.IdPer);
            modelBuilder.Entity<TacheResp>()
                .HasOne(bc => bc.Tache)
                .WithMany(c => c.Personnes)
                .HasForeignKey(bc => bc.IdTache);








        }

    }
}
