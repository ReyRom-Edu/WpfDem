using Microsoft.EntityFrameworkCore;
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
            _currentUser = user;

            LoadUser();
            LoadProducts();
        }

        private void LoadUser()
        {
            UserNameText.Text = _currentUser == null 
                ? "Гость" 
                : _currentUser.FullName;
        }

        private void LoadProducts()
        {
            _products = Core.Context.Products
                .Include(x=>x.Manufacturer)
                .Include(x=>x.Category)
                .Include(x=>x.Supplier)
                .ToList();

            ProductsListView.ItemsSource = _products;
        }
    }
}
