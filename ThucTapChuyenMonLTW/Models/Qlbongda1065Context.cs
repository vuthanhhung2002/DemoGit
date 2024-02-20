using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace ThucTapChuyenMonLTW.Models;

public partial class Qlbongda1065Context : DbContext
{
    public Qlbongda1065Context()
    {
    }

    public Qlbongda1065Context(DbContextOptions<Qlbongda1065Context> options)
        : base(options)
    {
    }

    public virtual DbSet<TblBanThang> TblBanThangs { get; set; }

    public virtual DbSet<TblCauThu> TblCauThus { get; set; }

    public virtual DbSet<TblClb> TblClbs { get; set; }

    public virtual DbSet<TblGiaiDau> TblGiaiDaus { get; set; }

    public virtual DbSet<TblHlv> TblHlvs { get; set; }

    public virtual DbSet<TblQuocGium> TblQuocGia { get; set; }

    public virtual DbSet<TblTranDau> TblTranDaus { get; set; }

    public virtual DbSet<TblUser> TblUsers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=MSI\\SQLEXPRESS;Initial Catalog=qlbongda1065;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TblBanThang>(entity =>
        {
            entity.HasKey(e => e.IdBanThang).HasName("pk_bt");

            entity.ToTable("tblBanThang");

            entity.Property(e => e.IdBanThang)
                .HasMaxLength(20)
                .HasColumnName("ID_BanThang");
            entity.Property(e => e.IdCauThu)
                .HasMaxLength(20)
                .HasColumnName("ID_CauThu");
            entity.Property(e => e.IdTran)
                .HasMaxLength(20)
                .HasColumnName("ID_Tran");
            entity.Property(e => e.ThoiGian).HasColumnType("datetime");

            entity.HasOne(d => d.IdCauThuNavigation).WithMany(p => p.TblBanThangs)
                .HasForeignKey(d => d.IdCauThu)
                .HasConstraintName("fk02_bt");

            entity.HasOne(d => d.IdTranNavigation).WithMany(p => p.TblBanThangs)
                .HasForeignKey(d => d.IdTran)
                .HasConstraintName("fk01_bt");
        });

        modelBuilder.Entity<TblCauThu>(entity =>
        {
            entity.HasKey(e => e.IdCauThu).HasName("pk_ct");

            entity.ToTable("tblCauThu");

            entity.Property(e => e.IdCauThu)
                .HasMaxLength(20)
                .HasColumnName("ID_CauThu");
            entity.Property(e => e.Anh)
                .HasMaxLength(100)
                .HasColumnName("ANH");
            entity.Property(e => e.Hoten)
                .HasMaxLength(40)
                .HasColumnName("HOTEN");
            entity.Property(e => e.IdClb)
                .HasMaxLength(20)
                .HasColumnName("ID_CLB");
            entity.Property(e => e.Ngaysinh)
                .HasColumnType("date")
                .HasColumnName("NGAYSINH");
            entity.Property(e => e.QuocTich).HasMaxLength(30);
            entity.Property(e => e.Soao)
                .HasMaxLength(10)
                .HasColumnName("SOAO");
            entity.Property(e => e.Vitri)
                .HasMaxLength(20)
                .HasColumnName("VITRI");

            entity.HasOne(d => d.IdClbNavigation).WithMany(p => p.TblCauThus)
                .HasForeignKey(d => d.IdClb)
                .HasConstraintName("fk01_ct");
        });

        modelBuilder.Entity<TblClb>(entity =>
        {
            entity.HasKey(e => e.IdClb).HasName("pk_clb");

            entity.ToTable("tblCLB");

            entity.Property(e => e.IdClb)
                .HasMaxLength(20)
                .HasColumnName("ID_CLB");
            entity.Property(e => e.IdQuocGia)
                .HasMaxLength(20)
                .HasColumnName("ID_QuocGia");
            entity.Property(e => e.LogoClb)
                .HasMaxLength(20)
                .HasColumnName("LogoCLB");
            entity.Property(e => e.TenClb)
                .HasMaxLength(40)
                .HasColumnName("TenCLB");
            entity.Property(e => e.TenSvd)
                .HasMaxLength(20)
                .HasColumnName("TenSVD");

            entity.HasOne(d => d.IdQuocGiaNavigation).WithMany(p => p.TblClbs)
                .HasForeignKey(d => d.IdQuocGia)
                .HasConstraintName("fk01_clb");
        });

        modelBuilder.Entity<TblGiaiDau>(entity =>
        {
            entity.HasKey(e => e.IdGiaiDau).HasName("pk_gdt");

            entity.ToTable("tblGiaiDau");

            entity.Property(e => e.IdGiaiDau)
                .HasMaxLength(20)
                .HasColumnName("ID_GiaiDau");
            entity.Property(e => e.TenGiaiDau).HasMaxLength(60);
        });

        modelBuilder.Entity<TblHlv>(entity =>
        {
            entity.HasKey(e => e.IdHlv).HasName("pk_hlv");

            entity.ToTable("tblHLV");

            entity.Property(e => e.IdHlv)
                .HasMaxLength(20)
                .HasColumnName("ID_HLV");
            entity.Property(e => e.Anh).HasMaxLength(30);
            entity.Property(e => e.IdClb)
                .HasMaxLength(20)
                .HasColumnName("ID_CLB");
            entity.Property(e => e.Ngaysinh)
                .HasColumnType("date")
                .HasColumnName("NGAYSINH");
            entity.Property(e => e.Quoctich)
                .HasMaxLength(20)
                .HasColumnName("QUOCTICH");
            entity.Property(e => e.TenHlv)
                .HasMaxLength(20)
                .HasColumnName("Ten_HLV");

            entity.HasOne(d => d.IdClbNavigation).WithMany(p => p.TblHlvs)
                .HasForeignKey(d => d.IdClb)
                .HasConstraintName("fk01_hlv");
        });

        modelBuilder.Entity<TblQuocGium>(entity =>
        {
            entity.HasKey(e => e.IdQuocgia).HasName("pk_qg");

            entity.ToTable("tblQuocGia");

            entity.Property(e => e.IdQuocgia)
                .HasMaxLength(20)
                .HasColumnName("ID_Quocgia");
            entity.Property(e => e.TenQuocGia).HasMaxLength(20);
        });

        modelBuilder.Entity<TblTranDau>(entity =>
        {
            entity.HasKey(e => e.IdTran).HasName("pk_td");

            entity.ToTable("tblTranDau");

            entity.Property(e => e.IdTran)
                .HasMaxLength(20)
                .HasColumnName("ID_Tran");
            entity.Property(e => e.DoiKhach).HasMaxLength(20);
            entity.Property(e => e.DoiNha).HasMaxLength(20);
            entity.Property(e => e.GiaiDau).HasMaxLength(20);
            entity.Property(e => e.GioTd).HasColumnName("Gio_TD");
            entity.Property(e => e.KetQua).HasMaxLength(20);
            entity.Property(e => e.Ngaythidau).HasColumnType("date");

            entity.HasOne(d => d.DoiKhachNavigation).WithMany(p => p.TblTranDauDoiKhachNavigations)
                .HasForeignKey(d => d.DoiKhach)
                .HasConstraintName("fk02_td");

            entity.HasOne(d => d.DoiNhaNavigation).WithMany(p => p.TblTranDauDoiNhaNavigations)
                .HasForeignKey(d => d.DoiNha)
                .HasConstraintName("fk01_td");

            entity.HasOne(d => d.GiaiDauNavigation).WithMany(p => p.TblTranDaus)
                .HasForeignKey(d => d.GiaiDau)
                .HasConstraintName("fk03_td");
        });

        modelBuilder.Entity<TblUser>(entity =>
        {
            entity.HasKey(e => e.IdUser).HasName("pk_kh");

            entity.ToTable("tblUser");

            entity.Property(e => e.IdUser)
                .HasMaxLength(20)
                .HasColumnName("ID_USER");
            entity.Property(e => e.Dchi)
                .HasMaxLength(50)
                .HasColumnName("DCHI");
            entity.Property(e => e.Email)
                .HasMaxLength(20)
                .HasColumnName("EMAIL");
            entity.Property(e => e.Hoten)
                .HasMaxLength(40)
                .HasColumnName("HOTEN");
            entity.Property(e => e.IsAdmin).HasColumnName("IS_ADMIN");
            entity.Property(e => e.IsUser).HasColumnName("IS_USER");
            entity.Property(e => e.Pass)
                .HasMaxLength(50)
                .HasColumnName("PASS");
            entity.Property(e => e.Sodt)
                .HasMaxLength(20)
                .HasColumnName("SODT");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
