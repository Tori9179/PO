using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Biblioteka
{
    public static class Dane
    {
        public static Zapisywanie ksiazkiSpis = new Zapisywanie();
        public static Zapisywanie ksiazkiLista = new Zapisywanie();
        public static string fileNameSpis = "SpisXML";
        public static string fileNameLista = "ListaXML";
    }
}