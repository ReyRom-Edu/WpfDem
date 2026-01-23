using Microsoft.Win32;
using System.IO;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;
using WpfDem.Models;

namespace WpfDem.Pages
{
    /// <summary>
    /// Логика взаимодействия для EditProductPage.xaml
    /// </summary>
    public partial class EditProductPage : Page
    {
        private Frame _frame;
        private Product _product;
        private string _newImagePath;

        public EditProductPage(Frame frame, int productId)
        {
            InitializeComponent();
            _frame = frame;
            this.Title = "Редактирование товара";

            LoadLists();

            if (productId != 0)
            {
                LoadProduct(productId);
            }
            else
            {
                _product = new Product();
            }
        }

        private void LoadLists()
        {
            try
            {
                CategoryBox.ItemsSource = Core.Context.Categories.ToList();
                ManufacturerBox.ItemsSource = Core.Context.Manufacturers.ToList();
                SupplierBox.ItemsSource = Core.Context.Suppliers.ToList();
            }
            catch (Exception)
            {
                MessageBox.Show("Не удалось загрузить данные, проверьте подключение к БД",
                        "Ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
            }
        }

        private void LoadProduct(int productId)
        {
            try
            {
                _product = Core.Context.Products.First(p=>p.ProductId == productId);

                ArticleBox.Text = _product.Article;
                NameBox.Text = _product.Name;
                DescriptionBox.Text = _product.Description;
                PriceBox.Text = _product.Price.ToString();
                UnitBox.Text = _product.Unit;
                CountBox.Text = _product.Count.ToString();
                DiscountBox.Text = _product.Discount.ToString();

                ProductImage.Source = new BitmapImage(new Uri(_product.PhotoPath, UriKind.Absolute));

                CategoryBox.SelectedItem = _product.Category;
                ManufacturerBox.SelectedItem = _product.Manufacturer;
                SupplierBox.SelectedItem = _product.Supplier;
            }
            catch (Exception)
            {
                MessageBox.Show("Не удалось загрузить данные, проверьте подключение к БД",
                        "Ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
            }
        }

        private void SelectImage_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var dialog = new OpenFileDialog();
                dialog.Filter = "Image|*.png;*.jpg";
                if (dialog.ShowDialog() != true)
                {
                    return;
                }

                var image = new BitmapImage(new Uri(dialog.FileName));

                if (image.PixelWidth > 300 || image.PixelHeight > 200)
                {
                    MessageBox.Show("Максимальный размер изображения - 300x200",
                        "Ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
                    return;
                }

                var folder = Path.Combine(Environment.CurrentDirectory, "Images");
                Directory.CreateDirectory(folder);

                _newImagePath = Path.Combine(folder, Path.GetFileName(dialog.FileName));
                File.Copy(dialog.FileName, _newImagePath, true);
                ProductImage.Source = image;
            }
            catch (Exception)
            {
                MessageBox.Show("Ошибка при добавлении изображения",
                        "Ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
            }
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            _frame.GoBack();
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                _product.Article = ArticleBox.Text;
                _product.Name = NameBox.Text;
                _product.Description = DescriptionBox.Text;
                _product.Price = decimal.Parse(PriceBox.Text);
                if(_product.Price < 0)
                {
                    MessageBox.Show("Введены некорректная цена",
                        "Ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
                }

                _product.Unit = UnitBox.Text;
                _product.Count = int.Parse(CountBox.Text);
                if (_product.Count < 0)
                {
                    MessageBox.Show("Введено некорректное количество",
                        "Ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
                }
                _product.Discount = int.Parse(DiscountBox.Text);

                _product.Supplier = SupplierBox.SelectedItem as Supplier;
                _product.Category = CategoryBox.SelectedItem as Category;
                _product.Manufacturer = ManufacturerBox.SelectedItem as Manufacturer;


                if (!String.IsNullOrWhiteSpace(_newImagePath))
                {
                    _product.Photo = Path.GetFileName(_newImagePath);
                }

            }
            catch (Exception)
            {
                MessageBox.Show("Введены некорректные данные",
                        "Ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
            }

            try
            {
                Core.Context.Products.Update(_product);
                Core.Context.SaveChanges();
                _frame.GoBack();
            }
            catch (Exception)
            {
                MessageBox.Show("Не удалось сохранить изменения, проверьте подключение к БД",
                        "Ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
            }
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                bool inOrder = Core.Context.ProductInOrders
                    .Any(p=>p.ProductId == _product.ProductId);
                if (inOrder)
                {
                    MessageBox.Show("Товар, используемый в заказе нельзя удалить",
                        "Ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
                }

                Core.Context.Products.Remove(_product);
                Core.Context.SaveChanges();
                _frame.GoBack();
            }
            catch (Exception)
            {
                MessageBox.Show("Не удалось сохранить изменения, проверьте подключение к БД",
                        "Ошибка",
                        MessageBoxButton.OK,
                        MessageBoxImage.Error);
            }
        }
    }
}
