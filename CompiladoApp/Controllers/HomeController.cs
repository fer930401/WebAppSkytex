using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Mail;
using System.IO;
using Skytex.Models;
using System.Threading;
using System.Globalization;
using AccesoDatos;
using Skytex.LogicaNegocio;


namespace Skytex.Controllers
{
    public class HomeController : Controller
    {
        Skytex.LogicaNegocio.logicaNegocio negocio = new logicaNegocio();
        public ActionResult SetLanguage(string idioma)
        {
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(idioma);
            return RedirectToAction("Index", "Home", new { culture = idioma });
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Acerca()
        {
            return View();
        }

        public ActionResult Contacto()
        {
            return View();
        }
        public ActionResult Privacidad()
        {
            ViewBag.Message = "Aviso de Privacidad Skytex.";

            return View();
        }
        public ActionResult SkyTrade()
        {
            return View();
        }
        public ActionResult SkyRug()
        {
           return View();
        }
        public ActionResult SkyMatt()
        {
            return View();
        }
        public ActionResult SkyFelt()
        {
            return View();
        }
        public ActionResult FiberHome()
        {
            return View();
        }
        public ActionResult BodyFx()
        {
            return View();
        }
        public ActionResult SkyDeco()
        {
            return View();
        }
        public ActionResult BolsaTrabajo()
        {
            return View();
        }
        public ActionResult EnConstruccion()
        {
            return View();
        }
        public ActionResult Comentarios()
        {
            return View();
        }

        [HttpPost]
        public ViewResult Comentarios(HomeController objHome)
        {
            string user = negocio.numNomina(Request.Form["num_nom"].ToString(), Request.Form["rfc_user"].ToString());
            if (user == null || user == "")
            {
                ViewData["Clave"] = "N/U";
            }
            else
            {
                ViewData["Clave"] = Request.Form["num_nom"].ToString();
                ViewData["Rfc"] = Request.Form["rfc_user"].ToString();
                ViewData["User"] = user.ToUpper();
            }
            return View();
        }
        [HttpPost]
        public ViewResult GComentarios(HomeController objHome)
        {
            string usuario = Request.Form["user"].ToString();
            string num_nom = Request.Form["num_nom2"].ToString();
            string rfc_user = Request.Form["rfc2"].ToString();
            string comentario = Request.Form["comentario"].ToString();
            //var to = "maria.casillas@skytex.com.mx";
            //var to = "queremosescucharte@skytex.com.mx";
            var to = "fernando.garcia@skytex.com.mx";
            //var cc = "omar.contreras@skytex.com.mx";
            //var cc = "fernando.garcia@skytex.com.mx";
            //var bcc = "fernando.garcia@skytex.com.mx";
            var de = "soludin@skytex.com.mx";

            var eMailSubject = "Comentarios - Skytex";
            var eMailMessage =
                "<html lang='en'>" +
                "<head>" +
                    "<style>" +
                        "html { font-family: sans-serif; font-size: 11px -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;}" +
                        "body { font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 1.428571429; color: #333333; background-color: #ffffff; } " +
                    "</style>" +
                "</head>" +
                    "<body>" +
                    "<h4> Comentarios - Skytex México</h4>" +
                    "<table cellpadding='0' cellspacing='0' width='700'>" +
                     "<tr>" +
                      "<td>" +
                        "<img src='http://i64.tinypic.com/2cwph5l.jpg' width='210' height='90' />" +
                      "</td>" +
                     "</tr>" +
                     "<tr>" +
                      "<td style='padding: 40px 30px 40px 30px;'>" +
                       "<table cellpadding='0' cellspacing='0' width='100%'>" +
                          "<tr>" +
                           "<td width='80%'>" +
                            "<p><strong>El usuario " + usuario + ", con numero de nomina: " + num_nom + ", con RFC: " + rfc_user.ToUpper() + "</strong>" +
                            " Comento lo siguiente:</p><br />" +
                           "</td>" +
                           "</tr>" +
                           "<tr>" +
                           "<td width='80%'>" +
                            "<p>" + comentario.ToUpper() + "</p>" +
                           "</td>" +
                          "</tr>" +
                         "</table>" +
                      "</td>" +
                     "</tr>" +
                    "</table>" +
                    "</body>" +
                "</html>";

            MailMessage mail = new MailMessage();
            mail.To.Add(new System.Net.Mail.MailAddress(to));
            //mail.To.Add(new System.Net.Mail.MailAddress("fergarciavera91@gmail.com", "Fernando 2"));
            mail.From = new System.Net.Mail.MailAddress(de, "Comentarios Skytex", System.Text.Encoding.UTF8);
            //mail.CC.Add(new System.Net.Mail.MailAddress(cc));
            //mail.Bcc.Add(new System.Net.Mail.MailAddress(bcc));
            mail.Subject = eMailSubject;
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = eMailMessage;
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            //attachment = new System.Net.Mail.Attachment(fileAttachment);

            // Agregar el Adjunto si deseamos hacerlo
            //System.Net.Mail.Attachment attachment;
            //attachment = new System.Net.Mail.Attachment(@"c:\Users\fernando.garcia\Documents\Proyectos Skytex\AplicacionWeb\Prueba.Presentacion\Activo\Reporte Ordenes.xls");
            //attachment = new System.Net.Mail.Attachment(@"C:\Desarrollo\Desarrollo_web\Agenda\Activo\Reporte Ordenes.xls");
            //mail.Attachments.Add(attachment);

            // Configuración SMTP
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient("outlook.skytex.com.mx", 25);

            // Crear Credencial de Autenticacion
            smtp.Credentials = new System.Net.NetworkCredential("soludin", "pluma");
            smtp.EnableSsl = false;

            try
            {
                smtp.Send(mail);
                ViewData["Comentario"] = DateTime.Now;
                return View("Comentarios");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}