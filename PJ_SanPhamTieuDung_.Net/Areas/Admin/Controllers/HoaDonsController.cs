using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PJ_SanPhamTieuDung_.Net.Models;

namespace PJ_SanPhamTieuDung_.Net.Areas.Admin.Controllers
{
    public class HoaDonsController : Controller
    {
        private SanPhamTieuDungEntities db = new SanPhamTieuDungEntities();

        // GET: Admin/HoaDons
        public ActionResult Index()
        {
            var hoaDons = db.HoaDons.Include(h => h.NguoiDung).Include(h => h.PhuongThucThanhToan).Include(h => h.TrangThai).OrderByDescending(h=>h.MaHoaDon);
            return View(hoaDons.ToList());
        }

        // GET: Admin/HoaDons/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            int idMaHoaDon = Convert.ToInt32(id);
            var chiTietHoaDon = db.ChiTietHoaDons.Where(s => s.MaHoaDon == idMaHoaDon).ToList();
            ViewBag.ChiTietHoaDon = chiTietHoaDon;
            if (chiTietHoaDon == null)
            {
                return HttpNotFound();
            }
            return View();
        }
        public ActionResult PendingList()
        {
            var hoaDons = db.HoaDons.Where(s => s.MaTrangThai == 1).Include(h => h.NguoiDung).Include(h => h.PhuongThucThanhToan).Include(h => h.TrangThai).OrderByDescending(h => h.MaHoaDon);
            return View(hoaDons.ToList());
        }
        public ActionResult ProcessedList()
        {
            var hoaDons = db.HoaDons.Where(s=>s.MaTrangThai == 2).Include(h => h.NguoiDung).Include(h => h.PhuongThucThanhToan).Include(h => h.TrangThai).OrderByDescending(h => h.MaHoaDon);
            return View(hoaDons.ToList());
        }

        //// GET: Admin/HoaDons/Edit/5
        public ActionResult HandleReceipt(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = db.HoaDons.Find(id);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            return View(hoaDon);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult HandleReceipt(int id)
        {
            if(Session["LoaiTaiKhoan"] != null)
            {
                var maNhanVienThuchien = (NguoiDung)Session["LoaiTaiKhoan"];
                db.DonHang_XacNhanDon(id,maNhanVienThuchien.MaNguoiDung);
            return RedirectToAction("Index","HoaDons");
            }
            return View("HandleReceipt");
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
