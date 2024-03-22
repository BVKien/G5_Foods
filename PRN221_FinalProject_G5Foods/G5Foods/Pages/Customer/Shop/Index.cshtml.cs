using G5Foods.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace G5Foods.Pages.Customer.Shop
{
    public class IndexModel : PageModel
    {
		private readonly G5Foods.Models.G5FoodsContext _context;

		public IndexModel(G5Foods.Models.G5FoodsContext context)
		{
			_context = context;
		}

		public IList<Product> Product { get; set; } = default!;

		public async Task OnGetAsync()
		{
			if (_context.Products != null)
			{
				Product = await _context.Products
				.Include(p => p.Category).ToListAsync();
			}
		}
	}
}
