
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace BlazorSPA1.Data
{
    public partial class Employee
    {   public string Id { get; set; }

        public string Name { get; set; }
        public string Department { get; set; }
        public string Designation { get; set; }
        public string City { get; set; }              
        public string? CompanyID { get; set;} 


        public virtual Company Company { get; set; }
        }
}
