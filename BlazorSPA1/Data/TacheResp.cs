using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace BlazorSPA1.Data
{
    public partial class TacheResp
    {   /* public Company()
         {
             Employees= new HashSet<Employee>();
         }*/
        
        public string IdPer { get; set; }
        public virtual Personne Personne { get; set; }
        public string IdTache { get; set; }
        public virtual Tache Tache { get; set; }

        /*public string Id { get; set; }

        public string Name { get; set; }


        public  virtual ICollection<Employee> Employees { get; set; }*/


    }
}
