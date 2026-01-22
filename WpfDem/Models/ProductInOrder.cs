using System;
using System.Collections.Generic;

namespace WpfDem.Models;

public partial class ProductInOrder
{
    public int OrderId { get; set; }

    public int ProductId { get; set; }

    public int Count { get; set; }

    public virtual Order Order { get; set; } = null!;

    public virtual Product Product { get; set; } = null!;
}
