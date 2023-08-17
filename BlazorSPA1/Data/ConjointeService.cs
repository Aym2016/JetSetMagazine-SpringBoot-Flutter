using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BlazorSPA1.Data
{
    public class ConjointeService : IConjointeService
    {
        private readonly SqlDbContext _dbContext;

        public ConjointeService(SqlDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<List<Conjointe>> GetConjointes()
        {
            return await _dbContext.Conjointes.ToListAsync();
        }
        public async Task<bool> CreateConjointe(Conjointe conjointe)
        {
            conjointe.Id = Guid.NewGuid().ToString();
            _dbContext.Add(conjointe);
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
        public async Task<Conjointe> SingleConjointe(string id)
        {
            return await _dbContext.Conjointes.FindAsync(id);
        }
        public async Task<bool> EditConjointe(string id, Conjointe conjointe)
        {
            if (id != conjointe.Id)
            {
                return false;
            }

            _dbContext.Entry(conjointe).State = EntityState.Modified;
            await _dbContext.SaveChangesAsync();
            return true;
        }
        public async Task<bool> DeleteConjointe(string id)
        {
            var patient = await _dbContext.Conjointes.FindAsync(id);
            if (patient == null)
            {
                return false;
            }

            _dbContext.Conjointes.Remove(patient);
            await _dbContext.SaveChangesAsync();
            return true;
        }
    }
}
