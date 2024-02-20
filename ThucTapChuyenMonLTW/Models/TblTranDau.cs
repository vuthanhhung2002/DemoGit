using System;
using System.Collections.Generic;

namespace ThucTapChuyenMonLTW.Models;

public partial class TblTranDau
{
    public string IdTran { get; set; } = null!;

    public TimeSpan? GioTd { get; set; }

    public DateTime? Ngaythidau { get; set; }

    public string? DoiNha { get; set; }

    public string? DoiKhach { get; set; }

    public string? KetQua { get; set; }

    public string? GiaiDau { get; set; }

    public virtual TblClb? DoiKhachNavigation { get; set; }

    public virtual TblClb? DoiNhaNavigation { get; set; }

    public virtual TblGiaiDau? GiaiDauNavigation { get; set; }

    public virtual ICollection<TblBanThang> TblBanThangs { get; set; } = new List<TblBanThang>();
}
