using System;
using System.Collections.Generic;

namespace ThucTapChuyenMonLTW.Models;

public partial class TblBanThang
{
    public string IdBanThang { get; set; } = null!;

    public string? IdTran { get; set; }

    public string? IdCauThu { get; set; }

    public DateTime? ThoiGian { get; set; }

    public virtual TblCauThu? IdCauThuNavigation { get; set; }

    public virtual TblTranDau? IdTranNavigation { get; set; }
}
