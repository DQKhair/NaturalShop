using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PJ_SanPhamTieuDung_.Net.Models;
using PJ_SanPhamTieuDung_.Net.Encrypt;
namespace PJ_SanPhamTieuDung_.Net.Areas.Admin.Controllers
{
    public class NguoiDungsController : Controller
    {
        private SanPhamTieuDungEntities db = new SanPhamTieuDungEntities();

        // GET: Admin/NguoiDungs
        public ActionResult Index()
        {
            var nguoiDungs = db.NguoiDungs.Where(s => s.MaLoaiTaiKhoan != 1).Include(n => n.LoaiTaiKhoan);
            return View(nguoiDungs.ToList());
        }

        // GET: Admin/NguoiDungs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            if (nguoiDung == null)
            {
                return HttpNotFound();
            }
            return View(nguoiDung);
        }

        // GET: Admin/NguoiDungs/Create
        public ActionResult Create()
        {
            ViewBag.MaLoaiTaiKhoan = new SelectList(db.LoaiTaiKhoans.Where(s=>s.MaLoaiTaiKhoan == 2), "MaLoaiTaiKhoan", "TenLoaiTaiKhoan");
            return View();
        }

        // POST: Admin/NguoiDungs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaNguoiDung,TenNguoiDung,EmailNguoiDung,SdtNguoiDung,DiaChiNguoiDung,UserNames,PassWords,MaLoaiTaiKhoan")] NguoiDung nguoiDung)
        {
            if (ModelState.IsValid)
            {
                nguoiDung.PassWords = EncryptPassword.GetMD5(nguoiDung.PassWords);
                db.Configuration.ValidateOnSaveEnabled = false;
                db.NguoiDungs.Add(nguoiDung);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaLoaiTaiKhoan = new SelectList(db.LoaiTaiKhoans, "MaLoaiTaiKhoan", "TenLoaiTaiKhoan", nguoiDung.MaLoaiTaiKhoan);
            return View(nguoiDung);
        }

        // GET: Admin/NguoiDungs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            if (nguoiDung == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaLoaiTaiKhoan = new SelectList(db.LoaiTaiKhoans, "MaLoaiTaiKhoan", "TenLoaiTaiKhoan", nguoiDung.MaLoaiTaiKhoan);
            return View(nguoiDung);
        }

        // POST: Admin/NguoiDungs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int MaNguoiDung, string TenNguoiDung, string EmailNguoiDung, string SdtNguoiDung, string DiaChiNguoiDung)
        {
            var nguoiDung = db.NguoiDungs.Find(MaNguoiDung);
            //if (ModelState.IsValid)
            //{
            if (nguoiDung != null)
            {
                nguoiDung.TenNguoiDung = TenNguoiDung;
                nguoiDung.EmailNguoiDung = EmailNguoiDung;
                nguoiDung.SdtNguoiDung = SdtNguoiDung;
                nguoiDung.DiaChiNguoiDung = DiaChiNguoiDung;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
                //db.Entry(nguoiDung).State = EntityState.Modified;
                //db.SaveChanges();
            //}
            ViewBag.MaLoaiTaiKhoan = new SelectList(db.LoaiTaiKhoans, "MaLoaiTaiKhoan", "TenLoaiTaiKhoan", nguoiDung.MaLoaiTaiKhoan);
            return View(nguoiDung);
        }

        // GET: Admin/NguoiDungs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            if (nguoiDung == null)
            {
                return HttpNotFound();
            }
            return View(nguoiDung);
        }

        // POST: Admin/NguoiDungs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NguoiDung nguoiDung = db.NguoiDungs.Find(id);
            db.NguoiDungs.Remove(nguoiDung);
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
