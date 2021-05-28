using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using CiekaweMiejsca.Models;

namespace CiekaweMiejsca
{
    public class SeedData
    {
        public static void Initialize(IServiceProvider serviceProvider)
        {
            using (var context = new CiekaweMiejscaContext
                (serviceProvider.GetRequiredService<DbContextOptions<CiekaweMiejscaContext>>()))
            {
                if (context.komentarz.Any())
                {
                    return;
                }

                //context.komentarz.AddRange(new komentarz
                //{
                //    //id_komentarz = 1,
                //    tresc = "abc",
                   
                //});
                context.SaveChanges();
                if (context.Post.Any())
                {
                    return;
                }

                //context.Post.AddRange(new Post
                //{
                //    //id_komentarz = 1,
                //    tresc = "abc",
                    
                //});
                context.SaveChanges();
            }
        }
    }
}

