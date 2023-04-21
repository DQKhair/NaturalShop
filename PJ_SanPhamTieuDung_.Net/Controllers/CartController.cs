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

        //public PartialViewResult BagCart()
        //{
        //    int total_quantity_item = 0;
        //    Cart cart = Session["Cart"] as Cart;
        //    if (cart != null)
        //        total_quantity_item = cart.Total_quantity();
        //    ViewBag.QuantityCart = total_quantity_item;
        //    return PartialView("BagCart");
        //}

        //public ActionResult CheckOut_Success()
        //{
        //    return View();
        //}

        //public ActionResult CheckOut(FormCollection from)
        //{
        //    try
        //    {
        //        Cart cart = Session["Cart"] as Cart;
        //        OrderPro _order = new OrderPro();
        //        _order.DateOrder = DateTime.Now;
        //        _order.AddressDeliverry = from["AddressDeliverry"];
        //        _order.IDCus = int.Parse(from["CodeCustomer"]);
        //        database.OrderProes.Add(_order);
        //        foreach (var item in cart.Items)
        //        {
        //            OrderDetail _oder_detail = new OrderDetail();
        //            _oder_detail.IDOrder = _order.ID;
        //            _oder_detail.IDProduct = item._product.ProductID;
        //            _oder_detail.UnitPrice = (double)item._product.Price;
        //            _oder_detail.Quantity = item._quantity;
        //            database.OrderDetails.Add(_oder_detail);
        //            foreach (var p in database.Products.Where(s => s.ProductID == _oder_detail.IDProduct))
        //            {
        //                var update_quan_pro = p.Quantity - item._quantity;
        //                p.Quantity = update_quan_pro;
        //            }
        //        }
        //        database.SaveChanges();
        //        cart.ClearCart();
        //        return RedirectToAction("CheckOut_Success", "ShopingCart");
        //    }
        //    catch
        //    {
        //        return Content(" Error checkout, Plesase check infomation of customer...thanks  ");

        //    }
        //}
    }
}