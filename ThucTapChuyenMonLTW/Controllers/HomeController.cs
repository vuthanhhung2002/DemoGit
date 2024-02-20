using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using ThucTapChuyenMonLTW.Models;
using ThucTapChuyenMonLTW.ViewModels;
using X.PagedList;

namespace ThucTapChuyenMonLTW.Controllers
{
	
    public class HomeController : Controller
	{
		Qlbongda1065Context db = new Qlbongda1065Context();
		private readonly ILogger<HomeController> _logger;

		public HomeController(ILogger<HomeController> logger)
		{
			_logger = logger;
		}

		public IActionResult Index(int? page)
		{
            int pagesize = 9;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
			var dscthu = db.TblCauThus.AsNoTracking().OrderBy(x => x.Hoten);			
			PagedList<TblCauThu> tblCaus = new PagedList<TblCauThu>(dscthu, pageNumber, pagesize);
			return View(tblCaus);
        }
		public IActionResult TimKiem( string strSearch)
		{
            var results = db.TblCauThus.Where(p => p.Hoten.ToLower().Contains(strSearch.ToLower())); 
            return View(results.ToList());
        }
		public IActionResult CauThuTheoCauLacBo(String mact, int? page)
		{
			int pagesize = 9;
			int pageNumber = page == null || page < 0 ? 1 : page.Value;
			var dscthu = db.TblCauThus.AsNoTracking().Where(x => x.IdClb == mact).OrderBy(x => x.Hoten);
			PagedList<TblCauThu> tblCaus = new PagedList<TblCauThu>(dscthu, pageNumber, pagesize);
			ViewBag.mact = mact;
			return View(tblCaus);
		}
		public IActionResult ChiTietCauThu(string mact)
		{
			var cauThu = db.TblCauThus.Include(m => m.IdClbNavigation).SingleOrDefault(x => x.IdCauThu == mact);
			var chitietct = new ChiTietCauThuViewModel
			{
				dscauthu = cauThu,
			};
			return View(chitietct);

		}
		public IActionResult LichThiDau( int? page)
		{
            int pagesize = 2;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lichtd = db.TblTranDaus.Include(m => m.DoiKhachNavigation).Include(m => m.DoiNhaNavigation).AsNoTracking().OrderBy(x=>x.IdTran);
            PagedList<TblTranDau> tblCau = new PagedList<TblTranDau>(lichtd, pageNumber, pagesize);
            return View(tblCau);
		}


		public IActionResult Privacy()
		{
			return View();
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}