using System;
using System.Collections.Generic;

namespace ThucTapChuyenMonLTW.Models;

public partial class TblQuocGium
{
    public string IdQuocgia { get; set; } = null!;

    public string? TenQuocGia { get; set; }

    public virtual ICollection<TblClb> TblClbs { get; set; } = new List<TblClb>();
}
