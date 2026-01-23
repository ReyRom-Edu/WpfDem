using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfDem.Pages;

namespace WpfDem
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            MainFrame.Navigated += MainFrame_Navigated;

            MainFrame.Navigate(new LoginPage(MainFrame));

        }

        private void MainFrame_Navigated(object sender, NavigationEventArgs e)
        {
            this.Title = ((Page)MainFrame.Content).Title;
        }
    }
}