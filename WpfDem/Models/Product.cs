using System;
using System.Collections.Generic;
using System.IO;

namespace WpfDem.Models;

public partial class Product
{
    public int ProductId { get; set; }

    public string Article { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string Unit { get; set; } = null!;

    public decimal Price { get; set; }

    public int SupplierId { get; set; }

    public int ManufacturerId { get; set; }

    public int CategoryId { get; set; }

    public int Discount { get; set; }

    public int Count { get; set; }

    public string Description { get; set; } = null!;

    public string? Photo { get; set; }

    public virtual Category Category { get; set; } = null!;

    public virtual Manufacturer Manufacturer { get; set; } = null!;

    public virtual ICollection<ProductInOrder> ProductInOrders { get; set; } = new List<ProductInOrder>();

    public virtual Supplier Supplier { get; set; } = null!;

    public string PhotoPath
    {
        get
        {
            string root = Environment.CurrentDirectory;
            string path = string.IsNullOrEmpty(Photo)
                ? Path.Combine(root, "Images", "picture.png")
                : Path.Combine(root, "Images", Photo);
            return path;
        }
    }

    public bool IsBigDiscount => Discount > 15;

    public bool HasDiscount => Discount > 0;

    public decimal DiscountedPrice => Price * (1 - Discount / 100M);
}
