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
        //public ActionResult Index()
        //{
        //    return View();
        //}

        public ActionResult Showcart()
        {
            if (Session["Cart"] == null)
                return View("EmptyCart");
            Cart _cart = Session["Cart"] as Cart;
            return View(_cart);
        }
        public ActionResult EmptyCart()
        {
            return View();
        }
        public Cart GetCart()
        {
            Cart cart = Session["Cart"] as Cart;
            if (cart == null || Session["Cart"] == null)
            {
                cart = new Cart();
                Session["Cart"] = cart;
            }
            return cart;
        }
        public ActionResult AddToCart(int id)
        {
            var _pro = db.SanPhams.SingleOrDefault(s => s.MaSanPham == id);
            if (_pro != null)
            {
                GetCart().Add_Product_Cart(_pro);
            }
            return RedirectToAction("ShowCart", "Cart");
        }

        public ActionResult Update_Cart_Quantity(FormCollection form)
        {
            Cart cart = Session["Cart"] as Cart;
            int id_pro = int.Parse(form["idPro"]);
            int _quantity = int.Parse(form["cartQuantity"]);
            cart.Update_quantity(id_pro, _quantity);
            return RedirectToAction("Showcart", "Cart");
        }

        public ActionResult RemoveCart(int id)
        {
            Cart cart = Session["Cart"] as Cart;
            cart.Remove_CartItem(id);
            return RedirectToAction("Showcart", "Cart");
        }

        public ActionResult CheckOut_Success()
        {
            return View();
        }

        public ActionResult CheckOut(FormCollection from)
        {
            try
            {
                var sessionMaNguoiDung = (NguoiDung)Session["LoaiTaiKhoan"];
                Cart cart = Session["Cart"] as Cart;
                HoaDon hoaDon = new HoaDon();
                if (Session["LoaiTaiKhoan"] != null)
                {
                    hoaDon.MaNguoiDung = sessionMaNguoiDung.MaNguoiDung;
                    hoaDon.TenKhachHang = sessionMaNguoiDung.TenNguoiDung;
                }
                else
                {
                    hoaDon.MaNguoiDung = null;
                    hoaDon.TenKhachHang = from["TenKhachHang"];
                }
                hoaDon.TongSoLuong = Convert.ToInt32(cart.Total_quantity());
                hoaDon.TongTien = Convert.ToInt32(cart.Total_money());
                hoaDon.NgayMua = DateTime.Now;
                hoaDon.MaPhuongThuc = int.Parse(from["MaPhuongThuc"]);
                hoaDon.MaTrangThai = 1;
                hoaDon.DiaChiGiaoHang = from["DiaChiGiaoHang"];
                hoaDon.SdtLienLac = from["SdtKhachHang"];
                db.HoaDons.Add(hoaDon);
                foreach (var item in cart.Items)
                {
                    ChiTietHoaDon chiTietHoaDon = new ChiTietHoaDon();
                    chiTietHoaDon.SoLuongSanPham = item._quantity;
                    chiTietHoaDon.MaHoaDon = hoaDon.MaHoaDon;
                    chiTietHoaDon.MaSanPham = item._product.MaSanPham;
                    chiTietHoaDon.Gia = (item._product.DonGia * item._quantity);
                    db.ChiTietHoaDons.Add(chiTietHoaDon);
                }
                db.SaveChanges();
                cart.ClearCart();
                return RedirectToAction("CheckOut_Success", "Cart");
            }
            catch
            {
                return Content("Lỗi thanh toán, làm phiền kiểm tra lại thông tin đơn hàng");

            }
        }
    }
}