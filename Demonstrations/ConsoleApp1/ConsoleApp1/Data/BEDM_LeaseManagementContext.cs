using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using ConsoleApp1.Models;

namespace ConsoleApp1.Data
{
    public partial class BEDM_LeaseManagementContext : DbContext
    {
        public BEDM_LeaseManagementContext()
        {
        }

        public BEDM_LeaseManagementContext(DbContextOptions<BEDM_LeaseManagementContext> options)
            : base(options)
        {
        }

        public virtual DbSet<CareType> CareTypes { get; set; } = null!;
        public virtual DbSet<Community> Communities { get; set; } = null!;
        public virtual DbSet<Lease> Leases { get; set; } = null!;
        public virtual DbSet<Leasee> Leasees { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=(localdb)\\mssqllocaldb;Initial Catalog=BEDM_LeaseManagement;Persist Security Info=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CareType>(entity =>
            {
                entity.ToTable("CareType", "LM");

                entity.HasComment("Represents a type of care provided by a community.");

                entity.Property(e => e.CareTypeId)
                    .ValueGeneratedNever()
                    .HasComment("Identifier for the care type record.");

                entity.Property(e => e.BackgroundColor)
                    .HasMaxLength(6)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("The background color to use when displaying the care type within the Glennis suite of products.");

                entity.Property(e => e.CareTypeCode)
                    .HasMaxLength(20)
                    .HasComment("The code assigned to the care type.");

                entity.Property(e => e.CareTypeName)
                    .HasMaxLength(100)
                    .HasComment("The name of the care type.");

                entity.Property(e => e.ExternalId)
                    .HasMaxLength(100)
                    .HasComment("The tenant's identifier for the care type.");

                entity.Property(e => e.ForegroundColor)
                    .HasMaxLength(6)
                    .IsUnicode(false)
                    .IsFixedLength()
                    .HasComment("The foreground color to use when displaying the care type within the Glennis suite of products.");
            });

            modelBuilder.Entity<Community>(entity =>
            {
                entity.ToTable("Community", "LM");

                entity.HasComment("Represents a community run by the tenant.");

                entity.HasIndex(e => e.CommunityNumber, "idxCommunity_CommunityNumber");

                entity.Property(e => e.CommunityId)
                    .ValueGeneratedNever()
                    .HasComment("The identifier of the community record.");

                entity.Property(e => e.CommunityName)
                    .HasMaxLength(200)
                    .HasComment("The name of the community.");

                entity.Property(e => e.CommunityNumber)
                    .HasMaxLength(50)
                    .HasComment("The tenant's number (identifier) for the community.");

                entity.Property(e => e.IsActive).HasComment("Flag indicating whether the community is active or not.");

                entity.Property(e => e.ProfileImageUrl)
                    .HasMaxLength(500)
                    .IsUnicode(false)
                    .HasComment("URL of the profile image for the community.");
            });

            modelBuilder.Entity<Lease>(entity =>
            {
                entity.ToTable("Lease", "LM");

                entity.Property(e => e.EffectiveDate).HasColumnType("date");

                entity.Property(e => e.PrimaryCost).HasColumnType("decimal(7, 2)");

                entity.HasOne(d => d.Community)
                    .WithMany(p => p.Leases)
                    .HasForeignKey(d => d.CommunityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fkLease_Community");

                entity.HasOne(d => d.Leasee)
                    .WithMany(p => p.Leases)
                    .HasForeignKey(d => d.LeaseeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fkLease_Leasee");
            });

            modelBuilder.Entity<Leasee>(entity =>
            {
                entity.ToTable("Leasee", "LM");

                entity.Property(e => e.LeaseeId).ValueGeneratedNever();

                entity.HasOne(d => d.CareType)
                    .WithMany(p => p.Leasees)
                    .HasForeignKey(d => d.CareTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fkCaree_CareType");

                entity.HasOne(d => d.Community)
                    .WithMany(p => p.Leasees)
                    .HasForeignKey(d => d.CommunityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("fkCaree_Community");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
