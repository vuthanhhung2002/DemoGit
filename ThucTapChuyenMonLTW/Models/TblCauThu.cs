using System;
using System.Collections.Generic;

namespace ThucTapChuyenMonLTW.Models;

public partial class TblCauThu
{
    public string IdCauThu { get; set; } = null!;

    public string? IdClb { get; set; }

    public string? Hoten { get; set; }

    public DateTime? Ngaysinh { get; set; }


	public string? Vitri { get; set; }

    public string? Soao { get; set; }

    public string? Anh { get; set; }

    public string? QuocTich { get; set; }

    public virtual TblClb? IdClbNavigation { get; set; }

    public virtual ICollection<TblBanThang> TblBanThangs { get; set; } = new List<TblBanThang>();
}
