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
            var user = db.tbl_User.Where(x => x.UserName == objUser.UserName && x.Password == objUser.Password).Count();
            if (user > 0)
            {
                return RedirectToAction("ListUsers");
            }
            else
            {
                return View();
            }
            
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
        public ActionResult UserProfile( int id)
        {
            WebAppEntities db = new WebAppEntities();
           var user = db.tbl_User.Find(id);

            user.InterestedInC_ = (user.InterestedInC_== null)? false : user.InterestedInC_;
            user.InterestedInJavaScript = (user.InterestedInJavaScript == null)? false : user.InterestedInJavaScript;
            user.InterestedInPython = (user.InterestedInPython == null)? false : user.InterestedInPython;

            //var cityList = db.tbl

            return View(user);
        }
        [HttpPost]
        public ActionResult UserProfile(tbl_User objUser, string CSharp, string JavaScript, String Python)
        {

            objUser.InterestedInC_ = (CSharp == "true") ? true : false;
            objUser.InterestedInJavaScript = (JavaScript == "true") ? true : false;
            objUser.InterestedInPython = (Python == "true") ? true : false;

            WebAppEntities db = new WebAppEntities();
            db.Entry(objUser).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("ListUsers");
        }
    }
}