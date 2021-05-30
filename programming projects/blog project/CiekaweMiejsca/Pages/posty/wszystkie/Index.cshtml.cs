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
    public class IndexModel : PageModel
    {
        private readonly CiekaweMiejsca.CiekaweMiejscaContext _context;

        public IndexModel(CiekaweMiejsca.CiekaweMiejscaContext context)
        {
            _context = context;
        }

        public IList<Post> Post { get;set; }
        public string miejsce { get; set; }

        public async Task OnGetAsync(string lok)
        {
            miejsce = lok;
            Post = await _context.Post.ToListAsync();
        }

        public List<Post> getLista()
        {
            if (miejsce == "Wszystkie") return _context.Post.ToList();
            return _context.Post.Where(p => p.lokalizacja == miejsce).ToList();
        }
    }
}
