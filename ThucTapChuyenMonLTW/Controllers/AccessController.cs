using Microsoft.AspNetCore.Mvc;
using ThucTapChuyenMonLTW.Models;

namespace ThucTapChuyenMonLTW.Controllers
{
    public class AccessController : Controller
    {
        Qlbongda1065Context db = new Qlbongda1065Context();
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Login()
        {
            if (HttpContext.Session.GetString("Email") == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
        [HttpPost]

        public IActionResult Login(TblUser user)
        {
            if (HttpContext.Session.GetString("Email") == null)
            {
                var u = db.TblUsers.Where(x => x.Email.Equals(user.Email) && x.Pass.Equals(user.Pass)).FirstOrDefault();
                if (u != null)
                {
                    if (u.IsAdmin == 1)
                    {
                        return RedirectToAction("danhsachct", "Admin");
                    }
                    else
                    {
                        HttpContext.Session.SetString("Email", u.Email.ToString());
                        return RedirectToAction("Index", "Home");
                    }



                }

            }
            return View();
        }
        [Route("signup")]
        [HttpGet]
        public IActionResult Signup()
        {
            return View();
        }
        [Route("signup")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Signup(TblUser user)
        {
            if (ModelState.IsValid)
            {
                db.TblUsers.Add(user);
                db.SaveChanges();
                return RedirectToAction("Login", "Access");
            }
            return View(user);
        }
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            HttpContext.Session.Remove("Email");
            return RedirectToAction("Login", "Access");
        }
    }
}
