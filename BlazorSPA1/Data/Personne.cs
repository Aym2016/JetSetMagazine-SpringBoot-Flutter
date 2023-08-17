using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Reflection;

namespace BlazorSPA1.Data
{
    public partial class Personne
    {    /*public Company()
         {
             Employees= new HashSet<Employee>();
         }*/
        public Personne(){

           Taches= new HashSet<TacheResp>();
            Enfants = new HashSet<Enfant>();
            Conjointes = new HashSet<Conjointe>();
            Parents = new HashSet<Parent>();
       }



        public string Id { get; set; }

        public string nom { get; set; }
        public string prenom { get; set; }
        public string fonction { get; set; }

        public DateTime dateNaiss;

        public string mail { get; set; }

        public string sexe { get; set; }
        public string situation { get; set; }
        public string MotDePass { get; set; }
        public string NumTel { get; set; }
        public bool parent { get; set; }
        public bool enfant { get; set; }
        public int NbEnfant { get; set; }



        /* public  virtual ICollection<Employee> Employees { get; set; }*/
        public virtual ICollection<Conjointe> Conjointes
        {
            get; set;


        }
        public virtual ICollection<Enfant> Enfants { get; set; }
        public virtual ICollection<Parent> Parents { get; set; }
        public ICollection<TacheResp> Taches { get; set; }
    }
}
