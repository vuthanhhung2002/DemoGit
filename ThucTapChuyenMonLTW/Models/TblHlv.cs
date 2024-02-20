using System;
using System.Collections.Generic;

namespace ThucTapChuyenMonLTW.Models;

public partial class TblHlv
{
    public string IdHlv { get; set; } = null!;

    public string? TenHlv { get; set; }

    public string? IdClb { get; set; }

    public DateTime? Ngaysinh { get; set; }

    public string? Quoctich { get; set; }

    public string? Anh { get; set; }

    public virtual TblClb? IdClbNavigation { get; set; }
}
