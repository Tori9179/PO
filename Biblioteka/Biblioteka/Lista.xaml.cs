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
using System.ComponentModel;
using System.IO;

namespace Biblioteka
{
    /// <summary>
    /// Logika interakcji dla klasy Lista.xaml
    /// </summary>
    public partial class Lista : Window
    {
        public Lista()
        {
            InitializeComponent();
            if (File.Exists(Dane.fileNameLista))
            {
                using (var stream = new FileStream(Dane.fileNameLista, FileMode.Open))
                {
                    XmlSerializer XML = new XmlSerializer(typeof(Zapisywanie), new Type[] { typeof(Ksiazka) });
                    Dane.ksiazkiLista = (Zapisywanie)XML.Deserialize(stream);
                    stream.Close();
                }
            }
            ListViewLista.ItemsSource = Dane.ksiazkiLista.kolekcjaKsiazek;
            CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(ListViewLista.ItemsSource);
            view.SortDescriptions.Add(new SortDescription("Autor", ListSortDirection.Ascending));
            view.SortDescriptions.Add(new SortDescription("Tytul", ListSortDirection.Ascending));
            view.Filter = Filter;
        }
        Zapisywanie obiektspis = new Zapisywanie();
        private void DodajPozycjeKlik(object sender, RoutedEventArgs e)
        {
            Dodaj objDodaj = new Dodaj();
            objDodaj.Top = this.Top;
            objDodaj.Left = this.Left;
            this.Visibility = Visibility.Hidden;
            objDodaj.Show();
        }
        private void SpisKsiazekKlik_Click(object sender, RoutedEventArgs e)
        {
            MainWindow objSpis = new MainWindow();
            objSpis.Top = this.Top;
            objSpis.Left = this.Left;
            this.Visibility = Visibility.Hidden;
            objSpis.Show();
        }
        private GridViewColumnHeader listViewSortCol = null;
        private SortAdorner listViewSortAdorner = null;
        private void Filter_TextChanged(object sender, TextChangedEventArgs e)
        {
            CollectionViewSource.GetDefaultView(ListViewLista.ItemsSource).Refresh();
        }

        private void SliderValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            CollectionViewSource.GetDefaultView(ListViewLista.ItemsSource).Refresh();
        }

        private void Sort_ClickLista(object sender, RoutedEventArgs e)
        {
            GridViewColumnHeader column = (sender as GridViewColumnHeader);
            string sortBy = column.Tag.ToString();
            if (listViewSortCol != null)
            {
                AdornerLayer.GetAdornerLayer(listViewSortCol).Remove(listViewSortAdorner);
                ListViewLista.Items.SortDescriptions.Clear();
            }

            ListSortDirection newDir = ListSortDirection.Ascending;
            if (listViewSortCol == column && listViewSortAdorner.Direction == newDir)
                newDir = ListSortDirection.Descending;

            listViewSortCol = column;
            listViewSortAdorner = new SortAdorner(listViewSortCol, newDir);
            AdornerLayer.GetAdornerLayer(listViewSortCol).Add(listViewSortAdorner);
            ListViewLista.Items.SortDescriptions.Add(new SortDescription(sortBy, newDir));
        }
        private bool Filter(object item)
        {
            if (String.IsNullOrEmpty(TextBoxTytul_WyszukajLista.Text) &&
                String.IsNullOrEmpty(TextBoxAutor_WyszukajLista.Text) &&
                String.IsNullOrEmpty(TextBoxGatunek_WyszukajLista.Text) &&
                SliderOcenaLista.Value == 0)
                return true;
            else
                return ((item as Ksiazka).Tytul.IndexOf(TextBoxTytul_WyszukajLista.Text, StringComparison.OrdinalIgnoreCase) >= 0) &&
                    ((item as Ksiazka).Autor.IndexOf(TextBoxAutor_WyszukajLista.Text, StringComparison.OrdinalIgnoreCase) >= 0) &&
                    ((item as Ksiazka).Gatunek.IndexOf(TextBoxGatunek_WyszukajLista.Text, StringComparison.OrdinalIgnoreCase) >= 0) &&
                    ((item as Ksiazka).Ocena == SliderOcenaLista.Value || SliderOcenaLista.Value == 0);
        }

        private void ListViewLista_Click(object sender, MouseButtonEventArgs e)
        {
            if (ListViewLista.SelectedIndex != -1)
            {
                Lektura objLektura = new Lektura((Ksiazka)ListViewLista.SelectedItem);
                objLektura.Top = this.Top;
                objLektura.Left = this.Left;
                this.Visibility = Visibility.Hidden;
                objLektura.Show();
            }
        }

        private void CloseL_Button(object sender, CancelEventArgs e)
        {
            System.Windows.Application.Current.Shutdown();
        }
    }
}
