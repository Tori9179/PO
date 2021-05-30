using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace CiekaweMiejsca.Pages
{
    public class WylogowanoModel : PageModel
    {
        public void OnGet()
        {
            Logowanie.zalogowany = false;
            Logowanie.uzytkownik = null;
        }
    }
}
