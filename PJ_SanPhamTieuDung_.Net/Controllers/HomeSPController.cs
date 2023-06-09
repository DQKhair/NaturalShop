﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PJ_SanPhamTieuDung_.Net.Models;
using PJ_SanPhamTieuDung_.Net.Encrypt;

namespace PJ_SanPhamTieuDung_.Net.Controllers
{
    public class HomeSPController : Controller
    {
        private SanPhamTieuDungEntities db = new SanPhamTieuDungEntities();

        // GET: HomeSP
        public ActionResult Index()
        {
            var dmsp = db.GetAllProducts(1).ToList();
            ViewBag.dmsp1 = dmsp;
            var dmsp2 = db.GetAllProducts(2).ToList();
            ViewBag.dmsp2 = dmsp2;
            var dmsp3 = db.GetAllProducts(3).ToList();
            ViewBag.dmsp3 = dmsp3;
            var dmsp4 = db.GetAllProducts(4).ToList();
            ViewBag.dmsp4 = dmsp4;
            var SanPhamNoiBat = db.getProductKhuyenMai().ToList();
            ViewBag.SanPhamNoiBat = SanPhamNoiBat;
            return View();
        }

        // GET: HomeSP/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }
        public ActionResult GioiThieu()
        {
            return View();
        }
        //caterogy
        public ActionResult DmspHome(int ? id)
        {
            if (id==null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var dmsp = db.GetAllProducts(id);
            ViewBag.TenDanhMuc = db.DanhMucSanPhams.Where(s => s.MaDanhMucSanPham == id).Single();
            if(dmsp == null)
            {
                return HttpNotFound();
            }
            return View(dmsp.ToList());
        }
        public ActionResult KhuyenMai()
        {
            ViewBag.sanphamkhuyenmai = db.getProductKhuyenMai().ToList();
            return View();
        }
        public ActionResult TinTuc()
        {
            return View();
        }
        public ActionResult LienHe()
        {
            return View();
        }
        public ActionResult HistoryPay()
        {
            if(Session["LoaiTaiKhoan"] != null)
            {
                var checktaikhoan = (NguoiDung)Session["LoaiTaiKhoan"];
                var historyReceipt = db.ChiTietHoaDons.Where(s => s.HoaDon.MaNguoiDung == checktaikhoan.MaNguoiDung);
                return View(historyReceipt.ToList());
            }
            return View();
        }
        //myprofle
        public ActionResult MyProfile()
        {
            if(Session["LoaiTaiKhoan"] != null)
            {
                var checkTaiKhoan = (NguoiDung)Session["LoaiTaiKhoan"];
                var myProfile = db.NguoiDungs.Where(m => m.MaNguoiDung == checkTaiKhoan.MaNguoiDung).SingleOrDefault();
                return View(myProfile);
            }
            return View();
        }
        [ValidateAntiForgeryToken]
        [HttpPost]
        public ActionResult MyProfile(string myProfileTen, string myProfileEmail, string myProfileSDT,string myProfileDiaChi)
        {
            if (Session["LoaiTaiKhoan"] != null)
            {
                var checkTaiKhoan = (NguoiDung)Session["LoaiTaiKhoan"];
                int maNguoiDung = checkTaiKhoan.MaNguoiDung;
                var nguoiDung = db.NguoiDungs.Where(m => m.MaNguoiDung == maNguoiDung).SingleOrDefault();
                if(nguoiDung != null)
                {
                    nguoiDung.TenNguoiDung = myProfileTen;
                    nguoiDung.EmailNguoiDung = myProfileEmail;
                    nguoiDung.SdtNguoiDung = myProfileSDT;
                    nguoiDung.DiaChiNguoiDung = myProfileDiaChi;
                    db.SaveChanges();
                }
                return RedirectToAction("MyProfile","HomeSP");
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
        public ActionResult ChangeMyPassword(string TaiKhoan_ChangeMyPassOld, string TaiKhoan_ChangeMyPass_New,string TaiKhoan_ReChangeMyPass_New)
        {
            if (Session["LoaiTaiKhoan"] != null)
            {
                var checkTaiKhoan = (NguoiDung)Session["LoaiTaiKhoan"];
                int maNguoiDung = checkTaiKhoan.MaNguoiDung;
                var checkPassOld = EncryptPassword.GetMD5(TaiKhoan_ChangeMyPassOld); // check password old
                var nguoiDung = db.NguoiDungs.Where(m => m.MaNguoiDung == maNguoiDung && m.PassWords == checkPassOld).SingleOrDefault();
                if (nguoiDung != null)
                {
                    if(TaiKhoan_ChangeMyPass_New == TaiKhoan_ReChangeMyPass_New)
                    {
                        var password_new = EncryptPassword.GetMD5(TaiKhoan_ChangeMyPass_New);
                        nguoiDung.PassWords = password_new;
                        db.SaveChanges();
                    }else
                    {
                        ModelState.AddModelError("", "Mật khẩu mới không trùng khớp");
                        return View("ChangeMyPassword");
                    }    
                }else
                {
                    ModelState.AddModelError("", "Mật khẩu cũ không đúng");
                    return View("ChangeMyPassword");
                }    
                return RedirectToAction("MyProfile", "HomeAdmin");
            }
            return View();
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
