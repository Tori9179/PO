using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using CiekaweMiejsca.Models;

namespace CiekaweMiejsca.Pages
{
    public class MojekontoModel : PageModel
    {
        [BindProperty]
        public Uzytkownik uzytkownik { get; set; }
        public void OnGet()
        {

            uzytkownik = Logowanie.uzytkownik;
        }

        //public async Task<IActionResult> OnGetAsync()
        //{


        //    uzytkownik = Logowanie.uzytkownik;
           
        //    return Page();
        //}
    }
}
