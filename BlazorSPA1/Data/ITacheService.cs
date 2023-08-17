using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorSPA1.Data
{
    interface ITacheService
    {

        Task<List<Tache>> GetTaches();
        Task<bool> CreateTache(Tache tache);
        Task<bool> EditTache(string id, Tache tache);
        Task<Tache> SingleTache(string id);
        Task<bool> DeleteTache(string id);
    }
}
