using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using CiekaweMiejsca;
using CiekaweMiejsca.Models;

namespace CiekaweMiejsca.Pages.komentarze
{
    public class DetailsModel : PageModel
    {
        private readonly CiekaweMiejsca.CiekaweMiejscaContext _context;

        public DetailsModel(CiekaweMiejsca.CiekaweMiejscaContext context)
        {
            _context = context;
        }

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
            return Page();
        }
    }
}
