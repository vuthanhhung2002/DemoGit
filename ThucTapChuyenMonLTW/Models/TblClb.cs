using System;
using System.Collections.Generic;

namespace ThucTapChuyenMonLTW.Models;

public partial class TblClb
{
    public string IdClb { get; set; } = null!;

    public string? TenClb { get; set; }

    public string? TenSvd { get; set; }

    public string? LogoClb { get; set; }

    public string? IdQuocGia { get; set; }

    public virtual TblQuocGium? IdQuocGiaNavigation { get; set; }

    public virtual ICollection<TblCauThu> TblCauThus { get; set; } = new List<TblCauThu>();

    public virtual ICollection<TblHlv> TblHlvs { get; set; } = new List<TblHlv>();

    public virtual ICollection<TblTranDau> TblTranDauDoiKhachNavigations { get; set; } = new List<TblTranDau>();

    public virtual ICollection<TblTranDau> TblTranDauDoiNhaNavigations { get; set; } = new List<TblTranDau>();
}
