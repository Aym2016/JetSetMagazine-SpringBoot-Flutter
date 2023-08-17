using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorSPA1.Data
{
    interface IEnfantService
    {

        Task<List<Enfant>> GetEnfants();
        Task<bool> CreateEnfant(Enfant enfant);
        Task<bool> EditEnfant(string id, Enfant Enfant);
        Task<Enfant> SingleEnfant(string id);
        Task<bool> DeleteEnfant(string id);
    }
}
