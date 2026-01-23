using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Diagnostics;
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
using WpfDem.Models;

namespace WpfDem.Pages
{
    /// <summary>
    /// Логика взаимодействия для ProductsPage.xaml
    /// </summary>
    public partial class ProductsPage : Page
    {
        private Frame _frame;
        private User _currentUser;
        private List<Product> _products;

        public ProductsPage(Frame frame, User user)
        {
            InitializeComponent();

            _frame = frame;
            _frame.Navigated += _frame_Navigated;
            _currentUser = user;
            this.Title = "Продукты";

            LoadUser();
            LoadProducts();
            LoadSuppliers();
        }

        private void _frame_Navigated(object sender, NavigationEventArgs e)
        {
            LoadProducts();
            FilterChanged(null,null);
        }

        private void LoadUser()
        {
            UserNameText.Text = _currentUser == null 
                ? "Гость" 
                : _currentUser.FullName;

            if(_currentUser != null && (_currentUser.Role == "Администратор" || _currentUser.Role == "Менеджер"))
            {
                FilterSortPanel.Visibility = Visibility.Visible;
            }
            else
            {
                FilterSortPanel.Visibility = Visibility.Collapsed;
            }

            if(_currentUser != null && _currentUser.Role == "Администратор")
            {
                AddButton.Visibility = Visibility.Visible;
            }
            else
            {
                AddButton.Visibility = Visibility.Hidden;
            }
        }

        private void LoadProducts()
        {
            try
            {
                _products = Core.Context.Products
                    .Include(x => x.Manufacturer)
                    .Include(x => x.Category)
                    .Include(x => x.Supplier)
                    .ToList();

                ProductsListView.ItemsSource = _products;
            }
            catch {
                MessageBox.Show("Не удалось загрузить данные, проверьте подключение к БД",
                        "Ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
            }
        }

        private void LoadSuppliers()
        {
            try
            {
                SupplierFilter.Items.Clear();
                SupplierFilter.Items.Add("Все поставщики");

                var suppliers = Core.Context.Suppliers.Select(x => x.Name);

                foreach (var item in suppliers)
                {
                    SupplierFilter.Items.Add(item);
                }

                SupplierFilter.SelectedIndex = 0;
                SortBox.SelectedIndex = 0;
            }
            catch {
                MessageBox.Show("Не удалось загрузить данные, проверьте подключение к БД",
                            "Ошибка",
                            MessageBoxButton.OK,
                            MessageBoxImage.Error);
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            _frame.GoBack();
        }

        private void FilterChanged(object sender, EventArgs e)
        {
            IEnumerable<Product> result = _products;

            string search = SearchBox.Text;

            if(!string.IsNullOrWhiteSpace(search))
            {
                result = result.Where(p=>
                    p.Name.Contains(search, StringComparison.OrdinalIgnoreCase) ||
                    p.Description.Contains(search,StringComparison.OrdinalIgnoreCase) ||
                    p.Manufacturer.Name.Contains(search, StringComparison.OrdinalIgnoreCase) ||
                    p.Supplier.Name.Contains(search, StringComparison.OrdinalIgnoreCase) ||
                    p.Category.Name.Contains(search, StringComparison.OrdinalIgnoreCase) ||
                    p.Article.Contains(search, StringComparison.OrdinalIgnoreCase));
            }

            if(SupplierFilter.SelectedIndex > 0)
            {
                string supplier = SupplierFilter.SelectedItem.ToString();
                result = result.Where(p=>p.Supplier.Name == supplier);
            }

            switch (SortBox.SelectedIndex)
            {
                case 1:
                    result = result.OrderBy(p=>p.Count); 
                    break;
                case 2:
                    result = result.OrderByDescending(p => p.Count);
                    break;
            }

            ProductsListView.ItemsSource = result.ToList();
        }

        private void ProductsListView_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (_currentUser != null && 
                _currentUser.Role == "Администратор" && 
                ProductsListView.SelectedItem is Product product)
            {
                _frame.Navigate(new EditProductPage(_frame, product.ProductId));
            }
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            _frame.Navigate(new EditProductPage(_frame, 0));
        }
    }
}
