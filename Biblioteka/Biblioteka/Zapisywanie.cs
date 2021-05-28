using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;
using System.IO;

namespace Biblioteka
{
    public class Zapisywanie
    {
        public List<Ksiazka> kolekcjaKsiazek = new List<Ksiazka>();
        public void Serializacja(string nazwa)
        {
            using (var stream = new FileStream(nazwa, FileMode.Create))
            {
                XmlSerializer XML = new XmlSerializer(typeof(Zapisywanie), new Type[] { typeof(Ksiazka) });
                XML.Serialize(stream, this);
                stream.Close();
            }
        }
    }
}
