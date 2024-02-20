using ThucTapChuyenMonLTW.Models;
namespace ThucTapChuyenMonLTW.Reponsitory
{
    public interface ICauLacBoRepository
    {
        TblClb Add(TblClb clb);
        TblClb Update(TblClb clb);
        TblClb Delete(TblClb clb);
        TblClb Get(string maclb);
        IEnumerable<TblClb> GetAll();
    }
}
