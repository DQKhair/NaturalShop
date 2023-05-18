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
            var hoaDons = db.HoaDons.Include(h => h.NguoiDung).Include(h => h.PhuongThucThanhToan).Include(h => h.TrangThai);
            return View(hoaDons.ToList());
        }

        // GET: Admin/HoaDons/Details/5
        public ActionResult Details(int? id)
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

        // GET: Admin/HoaDons/Create
        public ActionResult Create()
        {
            ViewBag.MaNguoiDung = new SelectList(db.NguoiDungs, "MaNguoiDung", "TenNguoiDung");
            ViewBag.MaPhuongThuc = new SelectList(db.PhuongThucThanhToans, "MaPhuongThuc", "TenPhuongThuc");
            ViewBag.MaTrangThai = new SelectList(db.TrangThais, "MaTrangThai", "TenTrangThai");
            return View();
        }

        // POST: Admin/HoaDons/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaHoaDon,TongSoLuong,TongTien,NgayMua,MaPhuongThuc,MaTrangThai,MaNguoiDung,TenKhachHang")] HoaDon hoaDon)
        {
            if (ModelState.IsValid)
            {
                db.HoaDons.Add(hoaDon);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaNguoiDung = new SelectList(db.NguoiDungs, "MaNguoiDung", "TenNguoiDung", hoaDon.MaNguoiDung);
            ViewBag.MaPhuongThuc = new SelectList(db.PhuongThucThanhToans, "MaPhuongThuc", "TenPhuongThuc", hoaDon.MaPhuongThuc);
            ViewBag.MaTrangThai = new SelectList(db.TrangThais, "MaTrangThai", "TenTrangThai", hoaDon.MaTrangThai);
            return View(hoaDon);
        }

        // GET: Admin/HoaDons/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.MaNguoiDung = new SelectList(db.NguoiDungs, "MaNguoiDung", "TenNguoiDung", hoaDon.MaNguoiDung);
            ViewBag.MaPhuongThuc = new SelectList(db.PhuongThucThanhToans, "MaPhuongThuc", "TenPhuongThuc", hoaDon.MaPhuongThuc);
            ViewBag.MaTrangThai = new SelectList(db.TrangThais, "MaTrangThai", "TenTrangThai", hoaDon.MaTrangThai);
            return View(hoaDon);
        }

        // POST: Admin/HoaDons/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaHoaDon,TongSoLuong,TongTien,NgayMua,MaPhuongThuc,MaTrangThai,MaNguoiDung,TenKhachHang")] HoaDon hoaDon)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hoaDon).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaNguoiDung = new SelectList(db.NguoiDungs, "MaNguoiDung", "TenNguoiDung", hoaDon.MaNguoiDung);
            ViewBag.MaPhuongThuc = new SelectList(db.PhuongThucThanhToans, "MaPhuongThuc", "TenPhuongThuc", hoaDon.MaPhuongThuc);
            ViewBag.MaTrangThai = new SelectList(db.TrangThais, "MaTrangThai", "TenTrangThai", hoaDon.MaTrangThai);
            return View(hoaDon);
        }

        // GET: Admin/HoaDons/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: Admin/HoaDons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HoaDon hoaDon = db.HoaDons.Find(id);
            db.HoaDons.Remove(hoaDon);
            db.SaveChanges();
            return RedirectToAction("Index");
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
