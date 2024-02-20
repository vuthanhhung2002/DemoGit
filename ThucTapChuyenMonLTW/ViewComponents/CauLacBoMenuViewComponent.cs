using Microsoft.AspNetCore.Mvc;
using ThucTapChuyenMonLTW.Reponsitory;

namespace ThucTapChuyenMonLTW.ViewComponents
{
    public class CauLacBoMenuViewComponent : ViewComponent
    {
        private readonly ICauLacBoRepository _cauLacBoRepository;
        public CauLacBoMenuViewComponent(ICauLacBoRepository cauLacBoRepository)
        {
            _cauLacBoRepository = cauLacBoRepository;
        }
        public IViewComponentResult Invoke()
        {
            var clb = _cauLacBoRepository.GetAll().OrderBy(x => x.IdClb);
            return View(clb);
        }
    }
}
