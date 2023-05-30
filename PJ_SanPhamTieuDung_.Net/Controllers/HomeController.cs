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
            if(Session["LoaiTaiKhoan"] != null)
            {
                var checkloaitaikhoan = (NguoiDung)Session["LoaiTaiKhoan"];
                if (checkloaitaikhoan.MaLoaiTaiKhoan == 1 || checkloaitaikhoan.MaLoaiTaiKhoan == 2)
                {
                    return View();
                }
            }
            return RedirectToAction("Index", "HomeSP");
        }
    }
}