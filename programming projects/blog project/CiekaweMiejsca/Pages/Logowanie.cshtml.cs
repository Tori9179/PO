using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using CiekaweMiejsca.Models;

namespace CiekaweMiejsca.Pages
{
    public class LogowanieModel : PageModel
    {
        private readonly CiekaweMiejsca.CiekaweMiejscaContext _context;

        public LogowanieModel(CiekaweMiejsca.CiekaweMiejscaContext context)
        {
            _context = context;
        }
        public IActionResult OnGet()
        {
            return Page();
        }

        [BindProperty]
        public Uzytkownik Uzytkownik { get; set; }
        public async Task<IActionResult> OnPostAsync()
        {
            

            var obj = _context.Uzytkownik.Where(u => u.login.Equals(Uzytkownik.login) && u.haslo.Equals(Uzytkownik.haslo)).FirstOrDefault();
            if (obj == null)
                return Page();
            //dodac info ze konto nie istnieje lub dane s¹ niepoprawne
            Logowanie.uzytkownik = obj;
            Logowanie.zalogowany = true;
            await _context.SaveChangesAsync();
            return RedirectToPage("./Index");
        }
    }
}
