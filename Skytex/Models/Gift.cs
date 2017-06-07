using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Skytex.Models
{
    public class Gift
    {
        public int GiftID { get; set; }   // Unique key
        public string Name { get; set; }
        public double? Price { get; set; }
    }
}