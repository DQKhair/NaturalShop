using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PJ_SanPhamTieuDung_.Net.Models;

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
