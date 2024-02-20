using ThucTapChuyenMonLTW.Models;

namespace ThucTapChuyenMonLTW.Reponsitory
{
    public class CauLacBoRepository : ICauLacBoRepository
    {
        private readonly Qlbongda1065Context _context;
        public CauLacBoRepository(Qlbongda1065Context context)
        {
            _context = context;
        }

        public TblClb Add(TblClb clb)
        {
            _context.TblClbs.Add(clb);
            _context.SaveChanges();
            return clb;
        }

        public TblClb Delete(TblClb clb)
        {
            throw new NotImplementedException();
        }

        public TblClb Get(string maclb)
        {
            return _context.TblClbs.Find(maclb); ;
        }

        public IEnumerable<TblClb> GetAll()
        {
            return _context.TblClbs;
        }

        public TblClb Update(TblClb clb)
        {
            _context.Update(clb);
            _context.SaveChanges();
            return clb;
        }
    }
}
