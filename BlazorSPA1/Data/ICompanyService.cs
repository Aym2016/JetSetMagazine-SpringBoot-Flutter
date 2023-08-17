using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorSPA1.Data
{
    interface ICompanyService
    {

        Task<List<Company>> GetCompanies();
        Task<bool> CreateCompany(Company company);
        Task<bool> EditCompany(string id, Company company);
        Task<Company> SingleCompany(string id);
        Task<bool> DeleteCompany(string id);
    }
}
