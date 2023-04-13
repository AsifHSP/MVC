using OpenXmlPowerTools;
using SolrNet.Utils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalProjectMVC.Controllers
{
    public class HomeController : Controller
    {
        public object ojbUser { get; private set; }

        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(tbl_User objUser)
        {
            WebAppEntities db = new WebAppEntities();
            var user = db.tbl_User.Where(x => x.UserName == objUser.UserName && x.Password == objUser.Password).FirstOrDefault();
            if (user !=null)
            {
                return RedirectToAction("ListUsers");
            }
            return View();
        }
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(tbl_User user)
        {
            // for database connection in the program.
            //When we code for Add, Delete or Update then at the end of code must write SaveChanges() must.
            WebAppEntities db = new WebAppEntities();
            db.tbl_User.Add(user);
            db.SaveChanges();
            return RedirectToAction("ListUsers");
        }
        public ActionResult ListUsers()
        {
            WebAppEntities db = new WebAppEntities();
            var users = db.tbl_User.ToList();
            return View(users);
        }
    }
}