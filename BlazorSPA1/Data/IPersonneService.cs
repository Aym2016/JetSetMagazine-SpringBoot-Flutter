using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorSPA1.Data
{
    interface IPersonneService
    {

        Task<List<Personne>> GetPersonnes();
        Task<bool> CreatePersonne(Personne personne);
        Task<bool> EditPersonne(string id, Personne personne);
        Task<Personne> SinglePersonne(string id);
        Task<bool> DeletePersonne(string id);
    }
}
