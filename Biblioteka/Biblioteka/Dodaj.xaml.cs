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
using Biblioteka;
using Microsoft.Win32;
using System.Xml.Serialization;
using System.IO;


namespace Biblioteka
{
    /// <summary>
    /// Logika interakcji dla klasy Dodaj.xaml
    /// </summary>
    public partial class Dodaj : Window
    {
        Ksiazka nowy = new Ksiazka();
        public string adresObrazka;
       
        public Dodaj()
        {
            InitializeComponent();
            adresObrazka = System.IO.Path.GetFullPath(@"defaultcover.jpg");
        }

        private void SpisKlik(object sender, RoutedEventArgs e)
        {
            MainWindow objSpis = new MainWindow();
            objSpis.Top = this.Top;
            objSpis.Left = this.Left;
            this.Visibility = Visibility.Hidden;
            objSpis.Show();
        }

        private void ListaKlik(object sender, RoutedEventArgs e)
        {
            Lista objLista = new Lista();
            objLista.Top = this.Top;
            objLista.Left = this.Left;
            this.Visibility = Visibility.Hidden;
            objLista.Show();
        }
        string StringFromRichTextBox(RichTextBox rtb)   //zapisanie ricz text boxa
        {
            TextRange textRange = new TextRange(
                // TextPointer to the start of content in the RichTextBox.
                rtb.Document.ContentStart,
                // TextPointer to the end of content in the RichTextBox.
                rtb.Document.ContentEnd);
            return textRange.Text;
        }
        private void GotoweDodawanieKlik(object sender, RoutedEventArgs e)
        {
            if ((CheckBoxNie.IsChecked != true && CheckBoxTak.IsChecked != true) ||
               (CheckBoxSpis.IsChecked != true && CheckBoxLista.IsChecked != true) ||
               (TextBoxTytul.Text == "Tytuł") || (TextBoxAutor.Text == "Autor") || (StringFromRichTextBox(rtbOpis) == "Opis") ||
               (TextBoxTytul.Text == "") || (TextBoxAutor.Text == "") || (StringFromRichTextBox(rtbOpis) == "") ||
               ComboBoxGatunki.SelectedIndex == -1)
            {
                MessageBox.Show("Uzupełnij wszystkie dane");
            }
            else
            {
                nowy.Tytul = TextBoxTytul.Text;
                nowy.Autor = TextBoxAutor.Text;
                nowy.Opis = StringFromRichTextBox(rtbOpis);
                nowy.Ocena = (int)SliderOcena.Value;
                nowy.Okladka = adresObrazka;
                nowy.Gatunek = ComboBoxGatunki.Text;
                
                if (CheckBoxTak.IsChecked == true)
                {
                    nowy.Przeczytano = true;
                }
                else nowy.Przeczytano = false;

                if (CheckBoxSpis.IsChecked == true)
                {
                    nowy.Posiadanie = true;
                }
                else nowy.Posiadanie = false;

                if (CheckBoxSpis.IsChecked == true)
                {
                    Dane.ksiazkiSpis.kolekcjaKsiazek.Add(nowy);
                    Dane.ksiazkiSpis.Serializacja(Dane.fileNameSpis);
                }
                else
                {
                    Dane.ksiazkiLista.kolekcjaKsiazek.Add(nowy);
                    Dane.ksiazkiLista.Serializacja(Dane.fileNameLista);
                }

                if (CheckBoxSpis.IsChecked == true)
                {
                    MainWindow objSpis = new MainWindow();
                    objSpis.Top = this.Top;
                    objSpis.Left = this.Left;
                    this.Visibility = Visibility.Hidden;
                    objSpis.Show();
                }
                else
                {
                    Lista objLista = new Lista();
                    objLista.Top = this.Top;
                    objLista.Left = this.Left;
                    this.Visibility = Visibility.Hidden;
                    objLista.Show();
                }
            }
        }

        private void DodajGrafikeKlik(object sender, RoutedEventArgs e)
        {
            
            OpenFileDialog mydialog = new OpenFileDialog();
            mydialog.Filter = "Obrazy (*.jpg, *.jpeg, *.jpe, *.jfif, *.png) | *.jpg; *.jpeg; *.jpe; *.jfif; *.png";
            mydialog.InitialDirectory = @"C:\";
            mydialog.Title = "Wybierz obraz";

            if (mydialog.ShowDialog() == true)
            {
                Uri fileUri = new Uri(mydialog.FileName);
                CoverImage.Source = new BitmapImage(fileUri);
                adresObrazka = CoverImage.Source.ToString();
            }
        }
        private void cbTakKlik(object sender, RoutedEventArgs e)
        {
            CheckBoxNie.IsChecked = false;
        }
        private void CheckBoxNie_Click(object sender, RoutedEventArgs e)
        {
            CheckBoxTak.IsChecked = false;
        }
        private void cbSpisKlik(object sender, RoutedEventArgs e)
        {
            CheckBoxLista.IsChecked = false;
        }
        private void cbListaKlik(object sender, RoutedEventArgs e)
        {
            CheckBoxSpis.IsChecked = false;
        }

        private void CloseD_Button(object sender, System.ComponentModel.CancelEventArgs e)
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
