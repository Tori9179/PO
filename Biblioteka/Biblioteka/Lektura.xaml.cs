using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Biblioteka
{
    /// <summary>
    /// Logika interakcji dla klasy Lektura.xaml
    /// </summary>
    public partial class Lektura : Window
    {
        Ksiazka k;
        public Lektura(Ksiazka ksiazka)
        {
            InitializeComponent();
            k = ksiazka;
            tytulLektura_TextBox.Text = ksiazka.Tytul;
            autorLektura_TextBox.Text = ksiazka.Autor;
            gatunekLektura_TextBox.Text = ksiazka.Gatunek; 
            ocenaLektura_TextBox.Text = ksiazka.Ocena.ToString();
            if (ksiazka.Posiadanie == true) posiadanieLektura_TextBox.Text = "Tak";
            else posiadanieLektura_TextBox.Text = "Nie";
            if (ksiazka.Przeczytano == true) przeczytanieLektura_TextBox.Text = "Tak";
            else przeczytanieLektura_TextBox.Text = "Nie";
            opisLektura_RichTextBox.Document.Blocks.Clear();
            opisLektura_RichTextBox.Document.Blocks.Add(new Paragraph(new Run(ksiazka.Opis)));
            string okladka = ksiazka.Okladka;
            Lektura_Image.Source = new BitmapImage(new Uri(okladka));
        }

        private void EdytujKlik(object sender, RoutedEventArgs e)
        {
            Edycja objEdycja = new Edycja(k);
            objEdycja.Top = this.Top;
            objEdycja.Left = this.Left;
            this.Visibility = Visibility.Hidden;
            objEdycja.Show();
        }

        private void Wroc_Click(object sender, RoutedEventArgs e)
        {
            if (posiadanieLektura_TextBox.Text == "Tak")
            {
                MainWindow objSpis = new MainWindow();
                objSpis.Top = this.Top;
                objSpis.Left = this.Left;
                this.Visibility = Visibility.Hidden;
                objSpis.Show();
            }
            else if (posiadanieLektura_TextBox.Text == "Nie")
            {
                Lista objLista = new Lista();
                objLista.Top = this.Top;
                objLista.Left = this.Left;
                this.Visibility = Visibility.Hidden;
                objLista.Show();
            }
        }

        private void CloseL_Button(object sender, System.ComponentModel.CancelEventArgs e)
        {
            System.Windows.Application.Current.Shutdown();
        }
    }
}
