using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace BlazorSPA1.Data
{
    public class ParentService : IParentService
    {
        private readonly SqlDbContext _dbContext;

        public ParentService(SqlDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<List<Parent>> GetParents()
        {
             return await _dbContext.Parents.ToListAsync();
        }
        public async Task<bool> CreateParent(Parent parent)
        {
            parent.Id = Guid.NewGuid().ToString();
            _dbContext.Add(parent);
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
        public async Task<Parent> SingleParent(string id)
        {
            return await _dbContext.Parents.FindAsync(id);
        }
        public async Task<bool> EditParent(string id, Parent parent)
        {
            if (id != parent.Id)
            {
                return false;
            }

            _dbContext.Entry(parent).State = EntityState.Modified;
            await _dbContext.SaveChangesAsync();
            return true;
        }
        public async Task<bool> DeleteParent(string id) { 
        
            var patient = await _dbContext.Parents.FindAsync(id);
            if (patient == null)
            {
                return false;
            }

            _dbContext.Parents.Remove(patient);
            await _dbContext.SaveChangesAsync();
            return true;
        }
    }
}
