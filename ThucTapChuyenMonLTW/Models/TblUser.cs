using System;
using System.Collections.Generic;

namespace ThucTapChuyenMonLTW.Models;

public partial class TblUser
{
    public string IdUser { get; set; } = null!;

    public string? Hoten { get; set; }

    public string? Dchi { get; set; }

    public string? Sodt { get; set; }

    public string? Email { get; set; }

    public string? Pass { get; set; }

    public int? IsUser { get; set; }

    public int? IsAdmin { get; set; }
}
