using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorSPA1.Data
{
    interface IParentService
    {

        Task<List<Parent>> GetParents();
        Task<bool> CreateParent(Parent parent);
        Task<bool> EditParent(string id, Parent parent);
        Task<Parent> SingleParent(string id);
        Task<bool> DeleteParent(string id);
    }
}
