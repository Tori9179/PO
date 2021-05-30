using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using System.IO;

namespace Biblioteka
{
    public class Ksiazka
    {
        string tytul;
        string autor;
        string gatunek;
        string opis;
        bool posiadanie;
        bool przeczytano;
        int ocena;
        string okladka;

        public Ksiazka(string title, string author, string genre, int rating, string description)
        {
            tytul = title;
            autor = author;
            gatunek = genre;
            opis = description;
            posiadanie = false;
            przeczytano = false;
            ocena = rating;
            okladka = " ";
        }
        public Ksiazka() { }

        public string Tytul { get; set; }
        public string Autor { get; set; }
        public string Gatunek { get; set; }
        public string Opis { get; set; }
        public bool Posiadanie { get; set; }
        public bool Przeczytano { get; set; }
        public int Ocena { get; set; }
        public string Okladka { get; set; }
    }
}
