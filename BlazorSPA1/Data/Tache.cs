using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace BlazorSPA1.Data
{
    public partial class Tache
    {   /* public Company()
         {
             Employees= new HashSet<Employee>();
         }*/


        
        public string Id { get; set; }

        public string caracteristique { get; set; }
        public string type { get; set; }


        public  virtual ICollection<TacheResp> Personnes { get; set; }


    }
}
