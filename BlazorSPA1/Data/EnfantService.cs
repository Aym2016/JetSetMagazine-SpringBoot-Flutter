using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BlazorSPA1.Data
{
    public class EnfantService : IEnfantService
    {
        private readonly SqlDbContext _dbContext;

        public EnfantService(SqlDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<List<Enfant>> GetEnfants()
        {
            return await _dbContext.Enfants.ToListAsync();
        }
        public async Task<bool> CreateEnfant(Enfant enfant)
        {
            enfant.Id = Guid.NewGuid().ToString();
            _dbContext.Add(enfant);
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
        public async Task<Enfant> SingleEnfant(string id)
        {
            return await _dbContext.Enfants.FindAsync(id);
        }
        public async Task<bool> EditEnfant(string id, Enfant enfant)
        {
            if (id != enfant.Id)
            {
                return false;
            }

            _dbContext.Entry(enfant).State = EntityState.Modified;
            await _dbContext.SaveChangesAsync();
            return true;
        }
        public async Task<bool> DeleteEnfant(string id)
        {
            var patient = await _dbContext.Enfants.FindAsync(id);
            if (patient == null)
            {
                return false;
            }

            _dbContext.Enfants.Remove(patient);
            await _dbContext.SaveChangesAsync();
            return true;
        }
    }
}
