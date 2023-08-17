using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorSPA1.Data
{
    interface IConjointeService
    {

        Task<List<Conjointe>> GetConjointes();
        Task<bool> CreateConjointe(Conjointe conjointe);
        Task<bool> EditConjointe(string id, Conjointe conjointe);
        Task<Conjointe> SingleConjointe(string id);
        Task<bool> DeleteConjointe(string id);
    }
}
