using System;
using System.Collections.Generic;

namespace WpfDem.Models;

public partial class User
{
    public int UserId { get; set; }

    public string Role { get; set; } = null!;

    public string FullName { get; set; } = null!;

    public string Login { get; set; } = null!;

    public string Password { get; set; } = null!;

    public virtual ICollection<Order> Orders { get; set; } = new List<Order>();
}
