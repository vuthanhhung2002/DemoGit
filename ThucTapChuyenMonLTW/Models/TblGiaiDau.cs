using System;
using System.Collections.Generic;

namespace ThucTapChuyenMonLTW.Models;

public partial class TblGiaiDau
{
    public string IdGiaiDau { get; set; } = null!;

    public string? TenGiaiDau { get; set; }

    public virtual ICollection<TblTranDau> TblTranDaus { get; set; } = new List<TblTranDau>();
}
