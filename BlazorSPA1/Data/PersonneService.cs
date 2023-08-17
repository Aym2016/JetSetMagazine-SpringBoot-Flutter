using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BlazorSPA1.Data
{
    public class PersonneService : IPersonneService
    {
        private readonly SqlDbContext _dbContext;

        public PersonneService(SqlDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<List<Personne>> GetPersonnes()
        {
            return await _dbContext.Personnes.ToListAsync();
        }
        public async Task<bool> CreatePersonne(Personne personne)
        {
            personne.Id = Guid.NewGuid().ToString();
            _dbContext.Add(personne);
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
        public async Task<Personne> SinglePersonne(string id)
        {
            return await _dbContext.Personnes.FindAsync(id);
        }
        public async Task<bool> EditPersonne(string id, Personne personne)
        {
            if (id != personne.Id)
            {
                return false;
            }

            _dbContext.Entry(personne).State = EntityState.Modified;
            await _dbContext.SaveChangesAsync();
            return true;
        }
        public async Task<bool> DeletePersonne(string id)
        {
            var patient = await _dbContext.Personnes.FindAsync(id);
            if (patient == null)
            {
                return false;
            }

            _dbContext.Personnes.Remove(patient);
            await _dbContext.SaveChangesAsync();
            return true;
        }
    }
}
