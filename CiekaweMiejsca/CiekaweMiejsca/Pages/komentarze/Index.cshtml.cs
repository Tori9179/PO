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
    public class IndexModel : PageModel
    {
        private readonly CiekaweMiejsca.CiekaweMiejscaContext _context;

        public IndexModel(CiekaweMiejsca.CiekaweMiejscaContext context)
        {
            _context = context;
        }

        public IList<komentarz> komentarz { get;set; }

        public async Task OnGetAsync()
        {
            komentarz = await _context.komentarz
                .Include(k => k.Post).ToListAsync();
        }
    }
}
