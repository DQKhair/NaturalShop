using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PJ_SanPhamTieuDung_.Net.Models;

namespace PJ_SanPhamTieuDung_.Net.Areas.Admin.Controllers
{
    public class HomeAdminController : Controller
    {
        SanPhamTieuDungEntities db = new SanPhamTieuDungEntities();
        public ActionResult MyProfile()
        {
            if (Session["LoaiTaiKhoan"] != null)
            {
                var checkTaiKhoan = (NguoiDung)Session["LoaiTaiKhoan"];
                var myProfile = db.NguoiDungs.Where(m => m.MaNguoiDung == checkTaiKhoan.MaNguoiDung).SingleOrDefault();
                return View(myProfile);
            }
            return View();
        }
        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult MyProfile(string myProfileTen, string myProfileEmail, string myProfileSDT, string myProfileDiaChi)
        {
            if (Session["LoaiTaiKhoan"] != null)
            {
                var checkTaiKhoan = (NguoiDung)Session["LoaiTaiKhoan"];
                int maNguoiDung = checkTaiKhoan.MaNguoiDung;
                var nguoiDung = db.NguoiDungs.Where(m => m.MaNguoiDung == maNguoiDung).SingleOrDefault();
                if (nguoiDung != null)
                {
                    nguoiDung.TenNguoiDung = myProfileTen;
                    nguoiDung.EmailNguoiDung = myProfileEmail;
                    nguoiDung.SdtNguoiDung = myProfileSDT;
                    nguoiDung.DiaChiNguoiDung = myProfileDiaChi;
                    db.SaveChanges();
                }
                return RedirectToAction("MyProfile", "HomeAdmin");
            }
            return View();
        }
    }
}