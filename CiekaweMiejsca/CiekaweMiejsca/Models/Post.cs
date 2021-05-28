using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace CiekaweMiejsca.Models
{
    public class Post
    {
        [Key]
        public int id_postu { get; set; }
        public string tresc { get; set; }
        public string lokalizacja { get; set; }
        public string tytul { get; set; }
        public string obrazek { get; set; }
        public List<komentarz> komentarze { get; set; } 
    }
}
