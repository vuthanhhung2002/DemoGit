using ThucTapChuyenMonLTW.Models;
namespace ThucTapChuyenMonLTW.ViewModels
{
	public class ChiTietCauThuViewModel
	{
		public TblCauThu dscauthu { get; set; }
		public virtual TblClb? IdClbNavigation { get; set; }

	}
}
