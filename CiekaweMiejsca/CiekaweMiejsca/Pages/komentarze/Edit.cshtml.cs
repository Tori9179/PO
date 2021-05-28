using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using CiekaweMiejsca;
using CiekaweMiejsca.Models;

namespace CiekaweMiejsca.Pages.komentarze
{
    public class EditModel : PageModel
    {
        private readonly CiekaweMiejsca.CiekaweMiejscaContext _context;

        public EditModel(CiekaweMiejsca.CiekaweMiejscaContext context)
        {
            _context = context;
        }

        [BindProperty]
        public komentarz komentarz { get; set; }

        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            komentarz = await _context.komentarz
                .Include(k => k.Post).FirstOrDefaultAsync(m => m.id_komentarza == id);

            if (komentarz == null)
            {
                return NotFound();
            }
           ViewData["id_postu"] = new SelectList(_context.Post, "id_postu", "id_postu");
            return Page();
        }

        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see https://aka.ms/RazorPagesCRUD.
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(komentarz).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!komentarzExists(komentarz.id_komentarza))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool komentarzExists(int id)
        {
            return _context.komentarz.Any(e => e.id_komentarza == id);
        }
    }
}
