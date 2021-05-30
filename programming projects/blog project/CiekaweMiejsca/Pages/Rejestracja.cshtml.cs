using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using CiekaweMiejsca;
using CiekaweMiejsca.Models;

namespace CiekaweMiejsca.Pages
{
    public class RejestracjaModel : PageModel
    {
        private readonly CiekaweMiejsca.CiekaweMiejscaContext _context;

        public RejestracjaModel(CiekaweMiejsca.CiekaweMiejscaContext context)
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
            if (!ModelState.IsValid)
            {
                return Page();
            }

            var obj = _context.Uzytkownik.Where(u => u.login.Equals(Uzytkownik.login) || u.email.Equals(Uzytkownik.email)).FirstOrDefault();
            if (obj != null)
                return Page();

            Uzytkownik.rola = "user";
            _context.Uzytkownik.Add(Uzytkownik);
            await _context.SaveChangesAsync();
            return RedirectToPage("./Index");
        }
    }
}
