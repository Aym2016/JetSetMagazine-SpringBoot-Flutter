using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BlazorSPA1.Data
{
    public class TacheService : ITacheService
    {
        private readonly SqlDbContext _dbContext;

        public TacheService(SqlDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<List<Tache>> GetTaches()
        {
            return await _dbContext.Taches.ToListAsync();
        }
        public async Task<bool> CreateTache(Tache tache)
        {
            tache.Id = Guid.NewGuid().ToString();
            _dbContext.Add(tache);
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
        public async Task<Tache> SingleTache(string id)
        {
            return await _dbContext.Taches.FindAsync(id);
        }
        public async Task<bool> EditTache(string id, Tache tache)
        {
            if (id != tache.Id)
            {
                return false;
            }

            _dbContext.Entry(tache).State = EntityState.Modified;
            await _dbContext.SaveChangesAsync();
            return true;
        }
        public async Task<bool> DeleteTache(string id)
        {
            var patient = await _dbContext.Taches.FindAsync(id);
            if (patient == null)
            {
                return false;
            }

            _dbContext.Taches.Remove(patient);
            await _dbContext.SaveChangesAsync();
            return true;
        }
    }
}
