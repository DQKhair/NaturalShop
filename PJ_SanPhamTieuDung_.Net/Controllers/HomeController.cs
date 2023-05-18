using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using PJ_SanPhamTieuDung_.Net.Models;

namespace PJ_SanPhamTieuDung_.Net.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var checkloaitaikhoan = (NguoiDung)Session["LoaiTaiKhoan"];
            if(checkloaitaikhoan.MaLoaiTaiKhoan == 1 || checkloaitaikhoan.MaLoaiTaiKhoan == 2)
            {
                return View();
            }

                return RedirectToAction("Index", "HomeSP");
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}