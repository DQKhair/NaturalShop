using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PJ_SanPhamTieuDung_.Net.Encrypt;
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
                TempData["SuccessMessage"] = "Lưu thành công";
                return RedirectToAction("MyProfile", "HomeAdmin");
            }
            return View();
        }
        //changePassword
        public ActionResult ChangeMyPassword()
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
        public ActionResult ChangeMyPassword(string TaiKhoan_ChangeMyPassOld, string TaiKhoan_ChangeMyPass_New, string TaiKhoan_ReChangeMyPass_New)
        {
            if (Session["LoaiTaiKhoan"] != null)
            {
                var checkTaiKhoan = (NguoiDung)Session["LoaiTaiKhoan"];
                int maNguoiDung = checkTaiKhoan.MaNguoiDung;
                var checkPassOld = EncryptPassword.GetMD5(TaiKhoan_ChangeMyPassOld); // check password old
                var nguoiDung = db.NguoiDungs.Where(m => m.MaNguoiDung == maNguoiDung && m.PassWords == checkPassOld).SingleOrDefault();
                if (nguoiDung != null)
                {
                    if (TaiKhoan_ChangeMyPass_New == TaiKhoan_ReChangeMyPass_New)
                    {
                        var password_new = EncryptPassword.GetMD5(TaiKhoan_ChangeMyPass_New);
                        nguoiDung.PassWords = password_new;
                        db.SaveChanges();
                        TempData["SuccessMessage"] = "Đổi mật khẩu thành công";
                    }
                    else
                    {
                        ModelState.AddModelError("", "Mật khẩu mới không trùng khớp");
                        return View("ChangeMyPassword");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Mật khẩu cũ không đúng");
                    return View("ChangeMyPassword");
                }
                return RedirectToAction("MyProfile", "HomeSP");
            }
            return View();
        }
    }
}