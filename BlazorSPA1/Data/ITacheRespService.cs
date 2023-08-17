using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorSPA1.Data
{
    interface ITacheRespService
    {

        Task<List<TacheResp>> GetTacheResps();
        Task<bool> CreateTacheResp(TacheResp tacheResp);
        Task<bool> EditTacheResp(string id, TacheResp tacheResp);
        Task<TacheResp> SingleTacheResp(string id);
        Task<bool> DeleteTacheResp(string id);
    }
}
