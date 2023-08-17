using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BlazorSPA1.Data
{
    public class TacheRespService : ITacheRespService
    {
        private readonly SqlDbContext _dbContext;

        public TacheRespService(SqlDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<List<TacheResp>> GetTacheResps()
        {
            return await _dbContext.TacheResps.ToListAsync();
        }
        public async Task<bool> CreateTacheResp(TacheResp tacheResp )
        {
            tacheResp.IdPer = Guid.NewGuid().ToString();
            tacheResp.IdTache = Guid.NewGuid().ToString();

            _dbContext.Add(tacheResp);
            try
            {
                await _dbContext.SaveChangesAsync();
                return true;
            }
            catch (DbUpdateException)
            {
                return false;
            }

        }
        public async Task<TacheResp> SingleTacheResp(string id)
        {
            return await _dbContext.TacheResps.FindAsync(id);
        }
        public async Task<bool> EditTacheResp(string id, TacheResp tacheResp)
        {
            if (id != tacheResp.Id)
            {
                return false;
            }

            _dbContext.Entry(tacheResp).State = EntityState.Modified;
            await _dbContext.SaveChangesAsync();
            return true;
        }
        public async Task<bool> DeleteTacheResp(string id)
        {
            var patient = await _dbContext.TacheResps.FindAsync(id);
            if (patient == null)
            {
                return false;
            }

            _dbContext.TacheResps.Remove(patient);
            await _dbContext.SaveChangesAsync();
            return true;
        }
    }
}
