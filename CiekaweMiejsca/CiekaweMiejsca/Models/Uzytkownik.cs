using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace CiekaweMiejsca.Models
{
    public class Uzytkownik
    {
        public int id { get; set; }
        public string rola { get; set; }

        [Required(ErrorMessage = "Podaj login", AllowEmptyStrings = false)]
        public string login { get; set; }

        [Required(ErrorMessage = "Podaj hasło", AllowEmptyStrings = false)]
        [DataType(System.ComponentModel.DataAnnotations.DataType.Password)]
        [StringLength(50, MinimumLength = 3, ErrorMessage = "Hasło musi zawierać co najmniej 3 znaki.")]
        public string haslo { get; set; }
        [Required(ErrorMessage = "Podaj email", AllowEmptyStrings = false)]

        [RegularExpression(@"^([0-9a-zA-Z]([\+\-_\.][0-9a-zA-Z]+)*)+@(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]*\.)+[a-zA-Z0-9]{2,3})$",
        ErrorMessage = "Nieprawidłowy mail")]
        public string email { get; set; }
    }
}
