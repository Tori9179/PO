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
using System.Xml.Serialization;
using Microsoft.Win32;
using System.IO;

namespace Biblioteka
{
    /// <summary>
    /// Logika interakcji dla klasy Edycja.xaml
    /// </summary>
    public partial class Edycja : Window
    {
        string adresObrazkaEdytuj;
        bool mam;
        Ksiazka n;
        public Edycja(Ksiazka ksiazka)
        {
            InitializeComponent();
            n = ksiazka;
            mam = ksiazka.Posiadanie;
            adresObrazkaEdytuj = ksiazka.Okladka;
            tytulEdycja_TextBox.Text = ksiazka.Tytul;
            autorEdycja_TextBox.Text = ksiazka.Autor;
            opisEdytuj_RichTextBox.Document.Blocks.Clear();
            opisEdytuj_RichTextBox.Document.Blocks.Add(new Paragraph(new Run(ksiazka.Opis)));
            string okladka = ksiazka.Okladka;
            ImageEdytuj.Source = new BitmapImage(new Uri(okladka));
            if (ksiazka.Posiadanie == true) spisEdytuj_CheckBox.IsChecked = true;
            else listaEdytuj_CheckBox.IsChecked = true;
            if (ksiazka.Przeczytano == true) takEdytuj_CheckBox.IsChecked = true;
            else nieEdytuj_CheckBox.IsChecked = true;
            suwakEdytuj.Value = ksiazka.Ocena;
            foreach (ComboBoxItem item in GatunkiEdycja_ComboBox.Items)
            {
                if (item.Content.ToString() == ksiazka.Gatunek)
                    GatunkiEdycja_ComboBox.SelectedItem = item;
            }
        }
        string StringFromRichTextBox(RichTextBox rtb) 
        {
            TextRange textRange = new TextRange(rtb.Document.ContentStart, rtb.Document.ContentEnd);
            return textRange.Text;
        }
        private void ZapiszEdycjaKlik(object sender, RoutedEventArgs e)
        {
            edytowanie(n);
        }
        public void edytowanie(Ksiazka nowy)
        {
            nowy.Okladka = new BitmapImage(new Uri(nowy.Okladka)).ToString();
            if ((nieEdytuj_CheckBox.IsChecked != true && takEdytuj_CheckBox.IsChecked != true) ||
               (spisEdytuj_CheckBox.IsChecked != true && listaEdytuj_CheckBox.IsChecked != true) ||
               (tytulEdycja_TextBox.Text == "Tytuł") || (autorEdycja_TextBox.Text == "Autor") || (StringFromRichTextBox(opisEdytuj_RichTextBox) == "Opis") ||
               (tytulEdycja_TextBox.Text == "") || (autorEdycja_TextBox.Text == "") || (StringFromRichTextBox(opisEdytuj_RichTextBox) == "") ||
               GatunkiEdycja_ComboBox.SelectedIndex == -1)
            {
                MessageBox.Show("Uzupełnij wszystkie dane");
            }
            else
            {
                nowy.Tytul = tytulEdycja_TextBox.Text;
                nowy.Autor = autorEdycja_TextBox.Text;
                nowy.Opis = StringFromRichTextBox(opisEdytuj_RichTextBox);
                nowy.Ocena = (int)suwakEdytuj.Value;
                if(adresObrazkaEdytuj != nowy.Okladka) nowy.Okladka = adresObrazkaEdytuj;
                nowy.Gatunek = GatunkiEdycja_ComboBox.Text;

                if (takEdytuj_CheckBox.IsChecked == true)
                {
                    nowy.Przeczytano = true;
                }
                else nowy.Przeczytano = false;

                if (spisEdytuj_CheckBox.IsChecked == true)
                {
                    nowy.Posiadanie = true;
                }
                else nowy.Posiadanie = false;

                if (spisEdytuj_CheckBox.IsChecked == true && mam == true)
                {
                    Dane.ksiazkiSpis.Serializacja(Dane.fileNameSpis);
                }
                else if (spisEdytuj_CheckBox.IsChecked == true && mam == false)
                {
                    Dane.ksiazkiLista.kolekcjaKsiazek.Remove(nowy);
                    Dane.ksiazkiLista.Serializacja(Dane.fileNameLista);
                    Dane.ksiazkiSpis.kolekcjaKsiazek.Add(nowy);
                    Dane.ksiazkiSpis.Serializacja(Dane.fileNameSpis);
                }
                else if (spisEdytuj_CheckBox.IsChecked == false && mam == true)
                {
                    Dane.ksiazkiSpis.kolekcjaKsiazek.Remove(nowy);
                    Dane.ksiazkiSpis.Serializacja(Dane.fileNameSpis);
                    Dane.ksiazkiLista.kolekcjaKsiazek.Add(nowy);
                    Dane.ksiazkiLista.Serializacja(Dane.fileNameLista);
                }
                else if (spisEdytuj_CheckBox.IsChecked == false && mam == false)
                {
                    Dane.ksiazkiLista.Serializacja(Dane.fileNameLista);
                }
               
                Lektura objLektura = new Lektura(n);
                objLektura.Top = this.Top;
                objLektura.Left = this.Left;
                this.Visibility = Visibility.Hidden;
                objLektura.Show();
            }
        }

        private void AnulujEdycjaKlik(object sender, RoutedEventArgs e)
        {
            Lektura objLektura = new Lektura(n);
            objLektura.Top = this.Top;
            objLektura.Left = this.Left;
            this.Visibility = Visibility.Hidden;
            objLektura.Show();
        }

        private void DodajGrafikeEdytuj(object sender, RoutedEventArgs e)
        {
            OpenFileDialog mydialog = new OpenFileDialog();
            mydialog.Filter = "Obrazy (*.jpg, *.jpeg, *.jpe, *.jfif, *.png) | *.jpg; *.jpeg; *.jpe; *.jfif; *.png";
            mydialog.InitialDirectory = @"C:\";
            mydialog.Title = "Wybierz obraz";

            if (mydialog.ShowDialog() == true)
            {
                Uri fileUri = new Uri(mydialog.FileName);
                ImageEdytuj.Source = new BitmapImage(fileUri);
            }
            adresObrazkaEdytuj = ImageEdytuj.Source.ToString();

        }

        private void usunEdycjaKlik(object sender, RoutedEventArgs e)
        {
            usuwanie(n);
        }
        public void usuwanie(Ksiazka nowy)
        {

            if (nowy.Posiadanie == true)
            {
                Dane.ksiazkiSpis.kolekcjaKsiazek.Remove(nowy);
                Dane.ksiazkiSpis.Serializacja(Dane.fileNameSpis);
                MainWindow objSpis = new MainWindow();
                objSpis.Top = this.Top;
                objSpis.Left = this.Left;
                this.Visibility = Visibility.Hidden;
                objSpis.Show();
            }
            else
            {
                Dane.ksiazkiLista.kolekcjaKsiazek.Remove(nowy);
                Dane.ksiazkiLista.Serializacja(Dane.fileNameLista);
                Lista objLista = new Lista();
                objLista.Top = this.Top;
                objLista.Left = this.Left;
                this.Visibility = Visibility.Hidden;
                objLista.Show();
            }
        }

        private void takE_Click(object sender, RoutedEventArgs e)
        {
            nieEdytuj_CheckBox.IsChecked = false;
        }

        private void nieE_Click(object sender, RoutedEventArgs e)
        {
            takEdytuj_CheckBox.IsChecked = false;
        }

        private void spisE_Click(object sender, RoutedEventArgs e)
        {
            listaEdytuj_CheckBox.IsChecked = false;
        }

        private void listaE_Click(object sender, RoutedEventArgs e)
        {
            spisEdytuj_CheckBox.IsChecked = false;
        }

        private void CloseE_Button(object sender, System.ComponentModel.CancelEventArgs e)
        {
            System.Windows.Application.Current.Shutdown();
        }

        private void TextBox_GotFocus(object sender, RoutedEventArgs e)
        {
            TextBox tb = (TextBox)sender;
            tb.Text = string.Empty;
            tb.GotFocus -= TextBox_GotFocus;
        }

        private void RichTextBox_GotFocus(object sender, RoutedEventArgs e)
        {
            RichTextBox rtb = (RichTextBox)sender;
            rtb.Document.Blocks.Clear();
        }
    }
}
