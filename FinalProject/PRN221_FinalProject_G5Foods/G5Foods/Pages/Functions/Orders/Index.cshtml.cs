﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using G5Foods.Models;

namespace G5Foods.Pages.Functions.Orders
{
    public class IndexModel : PageModel
    {
        private readonly G5Foods.Models.G5FoodsContext _context;

        public IndexModel(G5Foods.Models.G5FoodsContext context)
        {
            _context = context;
        }

        public IList<Order> Order { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.Orders != null)
            {
                Order = await _context.Orders
                .Include(o => o.AddressNavigation)
                .Include(o => o.Admin)
                .Include(o => o.Customer).ToListAsync();
            }
        }
    }
}
