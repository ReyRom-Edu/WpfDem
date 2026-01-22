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
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        private Frame _frame;

        public LoginPage(Frame mainFrame)
        {
            InitializeComponent();
            _frame = mainFrame;
        }

        private void Login_Click(object sender, RoutedEventArgs e)
        {
            var user = Core.Context.Users.FirstOrDefault(u=>
                            u.Login == LoginBox.Text &&
                            u.Password == PasswordBox.Password);

            if(user == null)
            {
                MessageBox.Show("Неверный логин или пароль", 
                    "Ошибка", 
                    MessageBoxButton.OK, 
                    MessageBoxImage.Error);
                return;
            }

            _frame.Navigate(new ProductsPage(_frame, user));
        }

        private void Guest_Click(object sender, RoutedEventArgs e)
        {
            _frame.Navigate(new ProductsPage(_frame, null));
        }
    }
}
