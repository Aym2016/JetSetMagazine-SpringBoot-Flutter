using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorSPA1.Data
{
    public class CompanyService : ICompanyService
    {
        private readonly SqlDbContext _dbContext;

        public CompanyService(SqlDbContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<List<Company>> GetCompanies()
        {
            return await _dbContext.Companies.ToListAsync();
        }
        public async Task<bool> CreateCompany(Company company)
        {
            company.Id = Guid.NewGuid().ToString();

            ;
            ;
            _dbContext.Add(company);
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
        public async Task<Company> SingleCompany(string id)
        {
            return await _dbContext.Companies.FindAsync(id);
        }
        public async Task<bool> EditCompany(string id, Company company)
        {
            if (id != company.Id)
            {
                return false;
            }

            _dbContext.Entry(company).State = EntityState.Modified;
            await _dbContext.SaveChangesAsync();
            return true;
        }
        public async Task<bool> DeleteCompany(string id)
        {
            var patient = await _dbContext.Companies.FindAsync(id);
            if (patient == null)
            {
                return false;
            }

            _dbContext.Companies.Remove(patient);
            await _dbContext.SaveChangesAsync();
            return true;
        }
    }
}
