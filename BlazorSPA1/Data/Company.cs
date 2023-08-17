using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace BlazorSPA1.Data
{
    public partial class Company
    {    public Company()
         {
             Employees= new HashSet<Employee>();
         }


        
        public string Id { get; set; }

        public string Name { get; set; }


        public  virtual ICollection<Employee> Employees { get; set; }


    }
}
