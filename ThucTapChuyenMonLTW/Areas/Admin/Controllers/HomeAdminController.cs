using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ThucTapChuyenMonLTW.Models;
using X.PagedList;

namespace thuctapltw.Areas.Admin.Controllers
{
        [Area("Admin")]
        [Route("admin")]
        [Route("admin/homeadmin")]
    public class HomeAdminController : Controller
    {
        Qlbongda1065Context db = new Qlbongda1065Context();
        [Route("")]
        [Route("index")]
        public IActionResult Index()
        {
            return View();
        }
        [Route("danhsachct")]
        public IActionResult DanhSachCauThu(int ? page)
        {
            int pagesize = 8;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var dsct = db.TblCauThus.Include(m => m.IdClbNavigation).AsNoTracking().OrderBy(x => x.Hoten);
            PagedList<TblCauThu> lst = new PagedList<TblCauThu>(dsct, pageNumber, pagesize);
            return View(lst);
        }
        [Route ("timkiemct")]
  
        public IActionResult TimKiemCT(string strSearch)
        {
            var results = db.TblCauThus.Where(p => p.Hoten.ToLower().Contains(strSearch.ToLower()));
            return View(results.ToList());
        }
        [Route("timkiemuser")]

        public IActionResult TimKiemUser(string strSearch)
        {
            var results = db.TblUsers.Where(p => p.IdUser.ToLower().Contains(strSearch.ToLower()));
            return View(results.ToList());
        }
        [Route("timkiemclb")]

        public IActionResult TimKiemCLB(string strSearch)
        {
            var results = db.TblClbs.Include(m=>m.IdQuocGiaNavigation).Where(p => p.TenClb.ToLower().Contains(strSearch.ToLower()));
            return View(results.ToList());
        }
        [Route("timkiemtrandau")]

        public IActionResult TimKiemTD(string strSearch)
        {
            var results = db.TblTranDaus.Include(m => m.DoiNhaNavigation).Include(m => m.DoiKhachNavigation)
                .Include(m => m.GiaiDauNavigation)
                .Where(p => p.DoiNhaNavigation.TenClb.ToLower().Contains(strSearch.ToLower())
                ||p.DoiKhachNavigation.TenClb.ToLower().Contains(strSearch.ToLower()));
            return View(results.ToList());
        }
        [Route("timkiembanthang")]
        public IActionResult TimKiemBT(string strSearch)
        {
            var results = db.TblBanThangs.Include(m => m.IdTranNavigation).Include(m => m.IdCauThuNavigation)
                .Where(p => p.IdCauThuNavigation.Hoten.ToLower().Contains(strSearch.ToLower()));
            return View(results.ToList());
        }
        [Route("danhsachuser")]
        public IActionResult DanhSachUser()
        {
            var dsuser = db.TblUsers.ToList();
            return View(dsuser);
        }
        [Route("danhsachgiaidau")]
        public IActionResult DanhSachGiaiDau()
        {
            var dsgd = db.TblGiaiDaus.ToList();
            return View(dsgd);
        }


        [Route("danhsachbanthang")]
        public IActionResult DanhSachBanThang()
        {
            var dsbt = db.TblBanThangs.Include(m => m.IdTranNavigation).Include(m => m.IdCauThuNavigation).ToList();
            return View(dsbt);
        }
        [Route("danhsachclb")]
        public IActionResult DanhSachCLB()
        {
            var dsclb = db.TblClbs.Include(m => m.IdQuocGiaNavigation).ToList();
            return View(dsclb);
        }
        [Route("danhsachquocgia")]
        public IActionResult DanhSachQuocGia()
        {
            var dsqg = db.TblQuocGia.ToList();
            return View(dsqg);
        }
        [Route("danhsachtrandau")]
        public IActionResult DanhSachTranDau()
        {
           
                var matches = db.TblTranDaus.Include(m => m.DoiNhaNavigation).Include(m => m.DoiKhachNavigation).Include(m => m.GiaiDauNavigation).ToList();
                return View(matches);
            
        }
        [Route("danhsachhlv")]
        public IActionResult DanhSachHLV()
        {

            var hlvs = db.TblHlvs.Include(m => m.IdClbNavigation).ToList();
            return View(hlvs);

        }
        [Route("themgiaidau")]
        [HttpGet]
        public IActionResult ThemGiaiDau()
        {
            ViewBag.IdClb = new SelectList(db.TblClbs.ToList(), "IdClb", "TenClb");
            return View();
        }
        [Route("themgiaidau")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemGiaiDau(TblGiaiDau giaiDau)
        {
            if (ModelState.IsValid)
            {
                db.TblGiaiDaus.Add(giaiDau);
                db.SaveChanges();
                return RedirectToAction("DanhSachGiaiDau");
            }
            return View(giaiDau);
        }

        [Route("themcauthu")]
        [HttpGet]
        public IActionResult ThemCauThu()
        {
            ViewBag.IdClb = new SelectList(db.TblClbs.ToList(), "IdClb", "TenClb");
            return View();
        }
        [Route("themcauthu")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemCauThu(TblCauThu cauThu)
        {
            if (ModelState.IsValid)
            {
                db.TblCauThus.Add(cauThu);
                db.SaveChanges();
                return RedirectToAction("DanhSachCauThu");
            }
            return View(cauThu);
        }
        [Route("themtrandau")]
        [HttpGet]
        public IActionResult ThemTranDau()
        {
            ViewBag.DoiNha = new SelectList(db.TblClbs.ToList(), "IdClb", "TenClb");
            ViewBag.DoiKhach = new SelectList(db.TblClbs.ToList(), "IdClb", "TenClb");
            ViewBag.GiaiDau = new SelectList(db.TblGiaiDaus.ToList(), "IdGiaiDau", "TenGiaiDau");
            return View();
        }
        [Route("themtrandau")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemTranDau(TblTranDau tranDau)
        {
            if (ModelState.IsValid)
            {
                db.TblTranDaus.Add(tranDau);
                db.SaveChanges();
                return RedirectToAction("DanhSachTranDau");
            }
            return View(tranDau);
        }
        [Route("themuser")]
        [HttpGet]
        public IActionResult ThemUser()
        {
           
            return View();
        }
        [Route("themuser")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemUser(TblUser user)
        {
            if (ModelState.IsValid)
            {
                db.TblUsers.Add(user);
                db.SaveChanges();
                return RedirectToAction("DanhSachUser");
            }
            return View(user);
        }
        [Route("themclb")]
        [HttpGet]
        public IActionResult ThemCLB()
        {
            ViewBag.IdQuocGia = new SelectList(db.TblQuocGia.ToList(), "IdQuocgia", "TenQuocGia");
            return View();
        }
        [Route("themclb")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemCLB(TblClb clb)
        {
            if (ModelState.IsValid)
            {
                db.TblClbs.Add(clb);
                db.SaveChanges();
                return RedirectToAction("DanhSachCLB");
            }
            return View(clb);
        }
        [Route("themhlv")]
        [HttpGet]
        public IActionResult ThemHLV()
        {
            ViewBag.IdClb = new SelectList(db.TblClbs.ToList(), "IdClb", "TenClb");
            return View();
        }
        [Route("themhlv")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemHLV(TblHlv hlv)
        {
            if (ModelState.IsValid)
            {
                db.TblHlvs.Add(hlv);
                db.SaveChanges();
                return RedirectToAction("DanhSachHLV");
            }
            return View(hlv);
        }
        [Route("thembt")]
        [HttpGet]
        public IActionResult ThemBanThang()
        {
            ViewBag.IdTran = new SelectList(db.TblTranDaus.ToList(), "IdTran", "IdTran");
            ViewBag.IdCauThu = new SelectList(db.TblCauThus/*.Include(m => m.IdClbNavigation.TblTranDauDoiKhachNavigations).Include(m => m.IdClbNavigation.TblTranDauDoiNhaNavigations)*/.ToList(), "IdCauThu", "Hoten");
            return View();
        }
        [Route("thembt")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemBanThang(TblBanThang banThang)
        {
            if (ModelState.IsValid)
            {
                db.TblBanThangs.Add(banThang);
                db.SaveChanges();
                return RedirectToAction("DanhSachBanThang");
            }
            return View(banThang);
        }
        [Route("themquocgia")]
        [HttpGet]
        public IActionResult ThemQuocGia()
        {
           
            return View();
        }
        [Route("themquocgia")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemQuocGia(TblQuocGium quocGium)
        {
            if (ModelState.IsValid)
            {
                db.TblQuocGia.Add(quocGium);
                db.SaveChanges();
                return RedirectToAction("DanhSachQuocGia");
            }
            return View(quocGium);
        }
        [Route("suagiaidau")]
        [HttpGet]
        public IActionResult SuaGiaiDau(string magd)
        {
          
            var giaidau = db.TblGiaiDaus.Find(magd);
            return View(giaidau);
        }
        [Route("suagiaidau")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaGiaiDau(TblGiaiDau giaiDau)
        {
            if (ModelState.IsValid)
            {
                db.Update(giaiDau);
                db.SaveChanges();
                return RedirectToAction("DanhSachGiaiDau", "HomeAdmin");
            }
            return View(giaiDau);
        }
        [Route("suacauthu")]
        [HttpGet]
        public IActionResult SuaCauThu(string mact)
        {
            ViewBag.IdClb = new SelectList(db.TblClbs.ToList(), "IdClb", "TenClb");
            var cauThu = db.TblCauThus.Find(mact);
            return View(cauThu);
        }
        [Route("suacauthu")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaCauThu(TblCauThu cauThu)
        {
            if (ModelState.IsValid)
            {
                db.Update(cauThu);
                db.SaveChanges();
                return RedirectToAction("DanhSachCauThu", "HomeAdmin");
            }
            return View(cauThu);
        }
        [Route("suaclb")]
        [HttpGet]
        public IActionResult SuaCLB(string maclb)
        {
            ViewBag.IdQuocGia = new SelectList(db.TblQuocGia.ToList(), "IdQuocgia", "TenQuocGia");
            var clb = db.TblClbs.Find(maclb);
            return View(clb);
        }
        [Route("suaclb")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaCLB(TblClb clb)
        {
            if (ModelState.IsValid)
            {
                db.Update(clb);
                db.SaveChanges();
                return RedirectToAction("DanhSachCLB", "HomeAdmin");
            }
            return View(clb);
        }
        [Route("suahlv")]
        [HttpGet]
        public IActionResult SuaHLV(string mahlv)
        {
            ViewBag.IdClb = new SelectList(db.TblClbs.ToList(), "IdClb", "TenClb");
            var hlv = db.TblHlvs.Find(mahlv);
            return View(hlv);
        }
        [Route("suahlv")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaHLV(TblHlv hlv)
        {
            if (ModelState.IsValid)
            {
                db.Update(hlv);
                db.SaveChanges();
                return RedirectToAction("DanhSachHLV", "HomeAdmin");
            }
            return View(hlv);
        }
        [Route("suaquocgia")]
        [HttpGet]
        public IActionResult SuaQuocGia(string maqg)
        {
            var quocgia = db.TblQuocGia.Find(maqg);
            return View(quocgia);
        }
        [Route("suaquocgia")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaQuocGia(TblQuocGium quocGium)
        {
            if (ModelState.IsValid)
            {
                db.Update(quocGium);
                db.SaveChanges();
                return RedirectToAction("DanhSachQuocGia", "HomeAdmin");
            }
            return View(quocGium);
        }
        [Route("suatrandau")]
        [HttpGet]
        public IActionResult SuaTranDau(string matd)
        {
            ViewBag.DoiNha = new SelectList(db.TblClbs.ToList(), "IdClb", "TenClb");
            ViewBag.DoiKhach = new SelectList(db.TblClbs.ToList(), "IdClb", "TenClb");
            ViewBag.GiaiDau = new SelectList(db.TblGiaiDaus.ToList(), "IdGiaiDau", "TenGiaiDau");
            var trandau = db.TblTranDaus.Find(matd);
            return View(trandau);
        }
        [Route("suatrandau")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaTranDau(TblTranDau tranDau)
        {
            if (ModelState.IsValid)
            {
                db.Update(tranDau);
                db.SaveChanges();
                return RedirectToAction("DanhSachTranDau", "HomeAdmin");
            }
            return View(tranDau);
        }
        [Route("suabt")]
        [HttpGet]
        public IActionResult SuaBanThang(string mabt)
        {
            ViewBag.IdTran = new SelectList(db.TblTranDaus.ToList(), "IdTran", "IdTran");
            ViewBag.IdCauThu = new SelectList(db.TblCauThus.ToList(), "IdCauThu", "Hoten");
            var banthang = db.TblBanThangs.Find(mabt);
            return View(banthang);
        }
        [Route("suabt")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaBanThang(TblBanThang banThang)
        {
            if (ModelState.IsValid)
            {
                db.Update(banThang);
                db.SaveChanges();
                return RedirectToAction("DanhSachBanThang", "HomeAdmin");
            }
            return View(banThang);
        }
        [Route("suauser")]
        [HttpGet]
        public IActionResult SuaUser(string mauser)
        {
      
            var user = db.TblUsers.Find(mauser);
            return View(user);
        }
        [Route("suauser")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaUser(TblUser user)
        {
            if (ModelState.IsValid)
            {
                db.Update(user);
                db.SaveChanges();
                return RedirectToAction("DanhSachUser", "HomeAdmin");
            }
            return View(user);
        }
        [Route("xoacauthu")]
        [HttpGet]
        public IActionResult XoaCauThu(string mact)
        {
            TempData["Message"] = "";
            var banthang = db.TblBanThangs.Where(m => m.IdCauThu == mact).ToList();
            if (banthang.Count() > 0)
            {
                TempData["Message"] = "Không xóa được";
                return RedirectToAction("DanhSachCauThu", "HomeAdmin");
            }


            db.Remove(db.TblCauThus.Find(mact));
            db.SaveChanges();
            TempData["Message"] = "Cầu thủ đã được xóa";
            return RedirectToAction("DanhSachCauThu", "HomeAdmin");
        }
        [Route("xoabanthang")]
        [HttpGet]
        public IActionResult XoaBanThang(string mabt)
        {
            TempData["Message"] = "";
            db.Remove(db.TblBanThangs.Find(mabt));
            db.SaveChanges();
            TempData["Message"] = "Bàn thắng đã được xóa";
            return RedirectToAction("DanhSachBanThang", "HomeAdmin");
        }
        [Route("xoaclb")]
        [HttpGet]
        public IActionResult XoaCLB(string maclb)
        {
            TempData["Message"] = "";
            var cauthu = db.TblCauThus.Where(m => m.IdClb == maclb).ToList();
            if (cauthu.Count() > 0)
            {
                TempData["Message"] = "Không xóa được";
                return RedirectToAction("DanhSachCLB", "HomeAdmin");
            }


            db.Remove(db.TblClbs.Find(maclb));
            db.SaveChanges();
            TempData["Message"] = "Câu lạc bộ đã được xóa";
            return RedirectToAction("DanhSachCLB", "HomeAdmin");
        }
        [Route("xoahlv")]
        [HttpGet]
        public IActionResult XoaHLV(string mahlv)
        {
            TempData["Message"] = "";
          
            db.Remove(db.TblHlvs.Find(mahlv));
            db.SaveChanges();
            TempData["Message"] = "Huấn luyện viên đã được xóa";
            return RedirectToAction("DanhSachHLV", "HomeAdmin");
        }
        [Route("xoatrandau")]
        [HttpGet]
        public IActionResult XoaTranDau(string matd)
        {
            TempData["Message"] = "";
            var banthang = db.TblBanThangs.Where(m => m.IdTran == matd).ToList();
            if (banthang.Count() > 0)
            {
                TempData["Message"] = "Không xóa được";
                return RedirectToAction("DanhSachTranDau", "HomeAdmin");
            }


            db.Remove(db.TblTranDaus.Find(matd));
            db.SaveChanges();
            TempData["Message"] = "Trận đấu đã được xóa";
            return RedirectToAction("DanhSachTranDau", "HomeAdmin");
        }
        [Route("xoaquocgia")]
        [HttpGet]
        public IActionResult XoaQuocGia(string maqg)
        {
            TempData["Message"] = "";
            var clb = db.TblClbs.Where(m => m.IdQuocGia == maqg).ToList();
            if (clb.Count() > 0)
            {
                TempData["Message"] = "Không xóa được";
                return RedirectToAction("DanhSachQuocGia", "HomeAdmin");
            }


            db.Remove(db.TblQuocGia.Find(maqg));
            db.SaveChanges();
            TempData["Message"] = "Quốc gia đã được xóa";
            return RedirectToAction("DanhSachQuocGia", "HomeAdmin");
        }
        [Route("xoauser")]
        [HttpGet]
        public IActionResult XoaUser(string mauser)
        {
            TempData["Message"] = "";

            db.Remove(db.TblUsers.Find(mauser));
            db.SaveChanges();
            TempData["Message"] = "Người dùng đã được xóa";
            return RedirectToAction("DanhSachUser", "HomeAdmin");
        }
        [Route("xoagiaidau")]
        [HttpGet]
        public IActionResult XoaGiaiDau(string magd)
        {
            TempData["Message"] = "";
            var td = db.TblTranDaus.Where(m => m.GiaiDau == magd).ToList();
            if (td.Count() > 0)
            {
                TempData["Message"] = "Không xóa được";
                return RedirectToAction("DanhSachGiaiDau", "HomeAdmin");
            }
            db.Remove(db.TblGiaiDaus.Find(magd));
            db.SaveChanges();
            TempData["Message"] = "Giải đấu đã được xóa";
            return RedirectToAction("DanhSachGiaiDau", "HomeAdmin");
        }
       
    }
}
