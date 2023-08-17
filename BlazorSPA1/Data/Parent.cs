using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Reflection;

namespace BlazorSPA1.Data
{
    public partial class Parent
    {    /*public Company()
         {
             Employees= new HashSet<Employee>();
         }*/


        
        public string Id { get; set; }

        public string nom{ get; set; }
        public string prenom { get; set; }
        public string fonction { get; set; }
        
        public DateTime dateNaiss;

        //public string mail { get; set; }

        public string sexe { get; set; }
        //public string situation { get; set; }
        //public string MotDePass { get; set; }
        //public string NumTel { get; set; }
        //public bool parent { get; set; }
        //public bool enfant { get; set; }
        //public int NbEnfant { get; set; }
        public string? idper { get; set; }
        public virtual Personne Personne { get; set; }


        /* public  virtual ICollection<Employee> Employees { get; set; }*/


    }
}
