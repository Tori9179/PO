using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using CiekaweMiejsca;
using CiekaweMiejsca.Models;

namespace CiekaweMiejsca.Pages.posty.wszystkie
{
    public class DetailsModel : PageModel
    {
        private readonly CiekaweMiejsca.CiekaweMiejscaContext _context;

        public DetailsModel(CiekaweMiejsca.CiekaweMiejscaContext context)
        {
            _context = context;
        }

        public Post Post { get; set; }
        [BindProperty]
        public komentarz komentarz { get; set; }
        public IList<komentarz> komentarze { get; set; }
   
        public async Task<IActionResult> OnGetAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Post = await _context.Post.FirstOrDefaultAsync(m => m.id_postu == id);

            if (Post == null)
            {
                return NotFound();
            }
            komentarze = _context.komentarz.Where(k => k.id_postu == id).ToList();
            return Page();
        }
        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            Post = await _context.Post.FirstOrDefaultAsync(m => m.id_postu == id);
            komentarz.id_postu = (int)id;
            komentarz.autor = Logowanie.uzytkownik.login;
            komentarz.id_user = Logowanie.uzytkownik.id;
            _context.komentarz.Add(komentarz);
            await _context.SaveChangesAsync();

            return RedirectToPage("", new { id = Post.id_postu });
            //return Page();
        }
      
    }
}
