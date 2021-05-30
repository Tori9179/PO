using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CiekaweMiejsca.Models;

namespace CiekaweMiejsca
{
    public class Logowanie
    {
        public static Uzytkownik uzytkownik { get; set;} = null;
        public static bool zalogowany { get; set;} = false;
    }
}
