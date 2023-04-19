using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using PJ_SanPhamTieuDung_.Net.Models;

namespace PJ_SanPhamTieuDung_.Net.Controllers
{
    public class CartController : Controller
    {
        SanPhamTieuDungEntities db = new SanPhamTieuDungEntities();
        // GET: Cart
        public ActionResult Index()
        {
            List<SanPham> ShoppingCart = Session["ShoppingCart"] as List<SanPham>;
            return View(ShoppingCart);
        }

        public RedirectToRouteResult AddToCart(int ProductId)
        {
           
            if (Session["ShoppingCart"] == null) // Nếu giỏ hàng chưa được khởi tạo
            {
                Session["ShoppingCart"] = new List<SanPham>();  // Khởi tạo Session["giohang"] là 1 List<CartItem>
            }

            List<SanPham> ShoppingCart = Session["ShoppingCart"] as List<SanPham>;  // Gán qua biến giohang dễ code

            // Kiểm tra xem sản phẩm khách đang chọn đã có trong giỏ hàng chưa

            if (ShoppingCart.FirstOrDefault(m => m.MaSanPham == ProductId) == null) // ko co sp nay trong gio hang
            {
                SanPham prodouct = db.SanPhams.Find(ProductId);  // tim sp theo sanPhamID

                SanPham newItem = new SanPham()
                {
                    MaSanPham = ProductId,
                    TenSanPham = prodouct.TenSanPham,
                    SoLuong = 1,
                    HinhAnh = prodouct.HinhAnh,
                    DonGia = prodouct.DonGia

                };  // Tạo ra 1 CartItem mới

                ShoppingCart.Add(newItem);  // Thêm CartItem vào giỏ 
            }
            else
            {
                // Nếu sản phẩm khách chọn đã có trong giỏ hàng thì không thêm vào giỏ nữa mà tăng số lượng lên.
                SanPham cardItem = ShoppingCart.FirstOrDefault(m => m.MaSanPham == ProductId);
                cardItem.SoLuong++;
            }

            // Action này sẽ chuyển hướng về trang chi tiết sp khi khách hàng đặt vào giỏ thành công. Bạn có thể chuyển về chính trang khách hàng vừa đứng bằng lệnh return Redirect(Request.UrlReferrer.ToString()); nếu muốn.
            return RedirectToAction("index", "Cart");
        }

        public RedirectToRouteResult UpdateAmount(int ProductId, int newAmount)
        {
            // tìm carditem muon sua
            List<SanPham> ShoppingCart = Session["ShoppingCart"] as List<SanPham>;
            SanPham EditAmount = ShoppingCart.FirstOrDefault(m => m.MaSanPham == ProductId);
            if (EditAmount != null)
            {
                EditAmount.SoLuong = newAmount;
            }
            return RedirectToAction("Index");

        }
        public RedirectToRouteResult RemoveItem(int ProductId)
        {
            List<SanPham> shoppingCart = Session["ShoppingCart"] as List<SanPham>;
            SanPham DelItem = shoppingCart.FirstOrDefault(m => m.MaSanPham == ProductId);
            if (DelItem != null)
            {
                shoppingCart.Remove(DelItem);
            }
            return RedirectToAction("Index");
        }
    }
}