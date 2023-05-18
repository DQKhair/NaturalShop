using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using PJ_SanPhamTieuDung_.Net.Models;
using System.Security.Cryptography;
using System.Text;

namespace PJ_SanPhamTieuDung_.Net.Controllers
{
    public class AuthenticationController : Controller
    {
        SanPhamTieuDungEntities db = new SanPhamTieuDungEntities();
        // GET: Authentication
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string username, string password)
        {
            if (ModelState.IsValid)
            {
                var f_pasword = GetMD5(password);
                var data = db.NguoiDungs.Where(s => s.UserNames.Equals(username) && s.PassWords.Equals(f_pasword)).ToList();
                if (data.Count() > 0)
                {
                    Session["TenNguoiDung"] = data.FirstOrDefault().TenNguoiDung;
                    Session["Username"] = data.FirstOrDefault().UserNames;
                    Session["MaNguoiDung"] = data.FirstOrDefault().MaNguoiDung;
                    Session["LoaiTaiKhoan"] = data.FirstOrDefault();
                    var checkloaitaikhoan = (NguoiDung)Session["LoaiTaiKhoan"];
                    if (checkloaitaikhoan.MaLoaiTaiKhoan == 1 || checkloaitaikhoan.MaLoaiTaiKhoan == 2)
                    {
                        return RedirectToAction("Index", "Home");
                    }
                    return RedirectToAction("Index","HomeSP");
                }
                else
                {
                    ViewBag.error = "Login failed";
                    return RedirectToAction("Login");
                }
            }
                return View();
        }
        public ActionResult Signup()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Signup([Bind(Include ="TenNguoiDung,EmailNguoiDung,SdtNguoiDung,DiaChiNguoiDung,UserNames,Passwords")]NguoiDung nguoidung )
        {
            if (ModelState.IsValid)
            {
                var check = db.NguoiDungs.FirstOrDefault(s => s.UserNames == nguoidung.UserNames);
                if (check == null)
                {
                    nguoidung.PassWords = GetMD5(nguoidung.PassWords);
                    db.Configuration.ValidateOnSaveEnabled = false;
                    nguoidung.MaLoaiTaiKhoan = 2;
                    db.NguoiDungs.Add(nguoidung);
                    db.SaveChanges();
                    return RedirectToAction("Login");
                }
            }
            return View();
        }
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("index","HomeSP");
        }
        //create a string MD5
        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");

            }
            return byte2String;
        }
    }
}