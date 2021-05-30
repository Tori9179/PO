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
    public class DeleteModel : PageModel
    {
        private readonly CiekaweMiejsca.CiekaweMiejscaContext _context;

        public DeleteModel(CiekaweMiejsca.CiekaweMiejscaContext context)
        {
            _context = context;
        }

        [BindProperty]
        public Post Post { get; set; }
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
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Post = await _context.Post.FindAsync(id);

            if (Post != null)
            {
                komentarze = _context.komentarz.Where(k => k.id_postu == id).ToList();
                foreach (komentarz kom in komentarze)
                {
                    _context.komentarz.Remove(kom);
                }
                _context.Post.Remove(Post);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index", new { lok = Post.lokalizacja });
        }
    }
}
