using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using CiekaweMiejsca.Models;

namespace CiekaweMiejsca
{
    public class CiekaweMiejscaContext : DbContext
    {
        public CiekaweMiejscaContext(DbContextOptions<CiekaweMiejscaContext> options) : base(options)
        {

        }
        public DbSet<global::CiekaweMiejsca.Models.komentarz> komentarz { get; set; }

        public DbSet<global::CiekaweMiejsca.Models.Post> Post { get; set; }
        public DbSet<global::CiekaweMiejsca.Models.Uzytkownik> Uzytkownik { get; set; }
    }
}
