using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PJ_SanPhamTieuDung_.Net.Models
{
    public class CartItem
    {
        public SanPham _product { get; set; }
        public int _quantity { get; set; }
    }
    public class Cart
    {
        List<CartItem> items = new List<CartItem>();
        public IEnumerable<CartItem> Items
        {
            get { return items; }
        }

        public void Add_Product_Cart(SanPham _pro, int _quan = 1)
        {
            var item = Items.FirstOrDefault(s => s._product.MaSanPham == _pro.MaSanPham);
            if (item == null)
                items.Add(new CartItem
                {
                    _product = _pro,
                    _quantity = _quan

                });
            else
                item._quantity += _quan;
        }

        public int Total_quantity()
        {
            return items.Sum(s => s._quantity);
        }

        public decimal Total_money()
        {
            var total = items.Sum(s => s._quantity * s._product.DonGia);
            if (Total_quantity() >= 2)
            {
                total = total - (total * 10 / 100);
            }
            return (decimal)total;
        }

        public void Update_quantity(int id, int _new_quan)
        {
            var item = items.Find(s => s._product.MaSanPham == id);
            if (items != null)
            {
                item._quantity = _new_quan;
            }
        }

        public void Remove_CartItem(int id)
        {
            items.RemoveAll(s => s._product.MaSanPham == id);
        }

        public void ClearCart()
        {
            items.Clear(); // xóa giỏ hàng
        }
    }
}