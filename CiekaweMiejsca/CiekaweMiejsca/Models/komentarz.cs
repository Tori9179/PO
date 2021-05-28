using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace CiekaweMiejsca.Models
{
    public class komentarz
    {   [Key]
        public int id_komentarza { get; set; }
        public string tresc { get; set; }
        public string autor { get; set; }
        [ForeignKey("Post")]
        public int id_postu { get; set; }
        public Post Post { get; set; }
        [ForeignKey("Uzytkownik")]
        public int id_user { get; set; }
        public Uzytkownik Uzytkownik { get; set; }
    }
}
