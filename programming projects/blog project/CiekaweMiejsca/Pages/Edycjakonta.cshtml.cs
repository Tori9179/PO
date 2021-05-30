using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using CiekaweMiejsca.Models;
using Microsoft.EntityFrameworkCore;
using CiekaweMiejsca;

namespace CiekaweMiejsca.Pages
{
    public class EdycjakontaModel : PageModel
    {
        private readonly CiekaweMiejsca.CiekaweMiejscaContext _context;

        public EdycjakontaModel(CiekaweMiejsca.CiekaweMiejscaContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Uzytkownik uzytkownik { get; set; }
        public void OnGet()
        {
            uzytkownik = Logowanie.uzytkownik;
        }
        public async Task<IActionResult> OnPostAsync()
        {
            uzytkownik.id = Logowanie.uzytkownik.id;
            uzytkownik.rola = Logowanie.uzytkownik.rola;
            if (!ModelState.IsValid)
            {
                return Page();
            }
            _context.Attach(uzytkownik).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
                Logowanie.uzytkownik = uzytkownik;
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!uzytkownikExists(uzytkownik.id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("/Mojekonto");
        }
        private bool uzytkownikExists(int id)
        {
            return _context.Uzytkownik.Any(e => e.id == id);
        }
    }
}
