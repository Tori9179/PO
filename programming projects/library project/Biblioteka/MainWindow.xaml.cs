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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Xml.Serialization;
using System.IO;
using System.ComponentModel;


namespace Biblioteka
{
    /// <summary>
    /// Logika interakcji dla klasy MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            if (File.Exists(Dane.fileNameSpis)) { 
                using (var stream = new FileStream(Dane.fileNameSpis, FileMode.Open))
                {
                    XmlSerializer XML = new XmlSerializer(typeof(Zapisywanie), new Type[] { typeof(Ksiazka) });
                    Dane.ksiazkiSpis = (Zapisywanie)XML.Deserialize(stream);
                    stream.Close();
                }
            }
            ListViewSpis.ItemsSource = Dane.ksiazkiSpis.kolekcjaKsiazek;
            CollectionView view = (CollectionView)CollectionViewSource.GetDefaultView(ListViewSpis.ItemsSource);
            view.SortDescriptions.Add(new SortDescription("Autor", ListSortDirection.Ascending));
            view.SortDescriptions.Add(new SortDescription("Tytul", ListSortDirection.Ascending));
            view.Filter = Filter;
        }

        private void MojaLista(object sender, RoutedEventArgs e)
        {
            Lista objLista = new Lista();
            objLista.Top = this.Top;
            objLista.Left = this.Left;
            this.Visibility = Visibility.Hidden;
            objLista.Show();
        }
        
        private void DodajPozycjeKlik(object sender, RoutedEventArgs e)
        {
            Dodaj objDodaj = new Dodaj();
            objDodaj.Top = this.Top;
            objDodaj.Left = this.Left;
            this.Visibility = Visibility.Hidden;
            objDodaj.Show();
        }

        private GridViewColumnHeader listViewSortCol = null;
        private SortAdorner listViewSortAdorner = null;
        private void Sort_Click(object sender, RoutedEventArgs e)
        {
            GridViewColumnHeader column = (sender as GridViewColumnHeader);
            string sortBy = column.Tag.ToString();
            if (listViewSortCol != null)
            {
                AdornerLayer.GetAdornerLayer(listViewSortCol).Remove(listViewSortAdorner);
                ListViewSpis.Items.SortDescriptions.Clear();
            }

            ListSortDirection newDir = ListSortDirection.Ascending;
            if (listViewSortCol == column && listViewSortAdorner.Direction == newDir)
                newDir = ListSortDirection.Descending;

            listViewSortCol = column;
            listViewSortAdorner = new SortAdorner(listViewSortCol, newDir);
            AdornerLayer.GetAdornerLayer(listViewSortCol).Add(listViewSortAdorner);
            ListViewSpis.Items.SortDescriptions.Add(new SortDescription(sortBy, newDir));
        }
        private bool Filter(object item)
        {
            if (String.IsNullOrEmpty(TextBoxTytul_Wyszukaj.Text) &&
                String.IsNullOrEmpty(TextBoxAutor_Wyszukaj.Text) &&
                String.IsNullOrEmpty(TextBoxGatunek_Wyszukaj.Text) &&
                SliderOcena.Value == 0)
                return true;
            else
                return ((item as Ksiazka).Tytul.IndexOf(TextBoxTytul_Wyszukaj.Text, StringComparison.OrdinalIgnoreCase) >= 0) &&
                    ((item as Ksiazka).Autor.IndexOf(TextBoxAutor_Wyszukaj.Text, StringComparison.OrdinalIgnoreCase) >= 0) &&
                    ((item as Ksiazka).Gatunek.IndexOf(TextBoxGatunek_Wyszukaj.Text, StringComparison.OrdinalIgnoreCase) >= 0) &&
                    ((item as Ksiazka).Ocena == SliderOcena.Value || SliderOcena.Value == 0);
        }
        private void Filter_TextChanged(object sender, TextChangedEventArgs e)
        {
            CollectionViewSource.GetDefaultView(ListViewSpis.ItemsSource).Refresh();
        }
        private void SliderValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            CollectionViewSource.GetDefaultView(ListViewSpis.ItemsSource).Refresh();
        }

        private void ListViewSpis_DoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (ListViewSpis.SelectedIndex != -1)
            {
                Lektura objLektura = new Lektura((Ksiazka)ListViewSpis.SelectedItem);
                objLektura.Top = this.Top;
                objLektura.Left = this.Left;
                this.Visibility = Visibility.Hidden;
                objLektura.Show();
            }
        }

        private void Close_Button(object sender, CancelEventArgs e)
        {
           System.Windows.Application.Current.Shutdown();
        }
    }
}
