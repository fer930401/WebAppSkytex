using Skytex.LogicaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Skytex
{
    public partial class Comentarios : System.Web.UI.Page
    {
        Skytex.LogicaNegocio.logicaNegocio negocio = new logicaNegocio();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Convert.ToString(Contador.GetNumberVisitor(), 10);
            comentario.Visible = false;
            btnGComentario.Visible = false;
            if (!IsPostBack)
            {
                comentario.Visible = false;
                btnGComentario.Visible = false;
            }
        }

        protected void btnComentario_Click(object sender, EventArgs e)
        {
            string nNom = num_nom.Text;
            string rfc = rfc_user.Text;
            
            string userResul = negocio.numNomina(nNom, rfc);
            if (userResul == null || userResul == "")
            {
                Label2.Text = "<div class='alert alert-danger' role='alert'><span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span> Los datos no son correctos intente de nuevo </div>";
            }
            else
            {
                user.Text = userResul.ToUpper();
                num_nom2.Text = nNom;
                rfc2.Text = rfc;
                //ViewData["Clave"] = Request.Form["num_nom"].ToString();
                //ViewData["Rfc"] = Request.Form["rfc_user"].ToString();
                Label2.Text = "<br />"+userResul.ToUpper()+"<br />";
                Label5.Text = "Ingresa tu comentario en el siguiente espacio<br />";
                comentario.Visible = true;
                btnGComentario.Visible = true;
                Label4.Visible = false;
            }
        }

        protected void btnGComentario_Click(object sender, EventArgs e)
        {
            string usuario = user.Text;
            string num_nomUser = num_nom2.Text;
            string rfc_user2 = rfc2.Text;
            string comentarioUser = comentario.Text;
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
                            "<p><strong>El usuario " + usuario + ", con numero de nomina: " + num_nomUser + ", con RFC: " + rfc_user2.ToUpper() + "</strong>" +
                            " Comento lo siguiente:</p><br />" +
                           "</td>" +
                           "</tr>" +
                           "<tr>" +
                           "<td width='80%'>" +
                            "<p>" + comentarioUser.ToUpper() + "</p>" +
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
                Label2.Visible = false;
                Label5.Visible = false;
                comentario.Visible = false;
                btnGComentario.Visible = false;
                num_nom.Text = "";
                rfc_user.Text = "";
                Label4.Text = "<br /><div class='alert alert-success' role='alert'><h4>Su comentario ha sido enviado correctamente - " + DateTime.Now + "</h4> <a href='http://www.skytex.com.mx/'><span class='glyphicon glyphicon-home' aria-hidden='true'></span> Regresa al inicio</a></div>";
                Label4.Visible = true;
            }
            catch (Exception ex)
            {
                throw ex;
                Label4.Text = "<br /><div class='alert alert-danger' role='alert'><h4>Ocurrio un error, intente de nuevo</h4> <a href='http://www.skytex.com.mx/'><span class='glyphicon glyphicon-home' aria-hidden='true'></span> Regresa al inicio</a></div>";
                Label4.Visible = true;
            }
        }
    }
}