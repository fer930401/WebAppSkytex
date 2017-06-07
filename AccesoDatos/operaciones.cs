using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos
{
    public class operaciones
    {
        skytexEntities modelo = new skytexEntities();
        public ArrayList ofertasSkytex()
        {
            ArrayList lista = new ArrayList();
            var consulta = from a in modelo.itmov where a.ef_cve == "001" && a.tipo_doc == "mtbotr" select a;
            foreach (var su in consulta)
            {
                lista.Add(new { su.num_fol, su.imp_letra });
            }
            return lista;
        }
        public string numNomina(string num_nom, string rfc)
        {
            string nombre;
            //string CadenaConecta = @"Data Source=192.168.18.96;Initial Catalog=skytex;User ID=soludin_develop;Password=dinamico20";
            string CadenaConecta = @"Data Source=sql;Initial Catalog=skytex;User ID=soludin_develop;Password=dinamico20";
            //select xcuser.nombre + ' - '+ xcdivef.nombre from xcdivef,cccatcc,xcuser where cccatcc.atencion1 ='06008644' and cccatcc.cc_tipo ='F' and cccatcc.rfc = 'GAVF9304015T7' and cccatcc.atencion2 = xcuser.user_cve and cccatcc.fax3 = xcuser.ef_cve and xcuser.div_cve = xcdivef.div_cve and xcuser.ef_cve = xcdivef.ef_cve

            /*var consulta = (from cat in modelo.cccatcc
                            join user in modelo.xcuser on new { catAtencion = cat.atencion2, catFax3 = cat.fax3 } equals new { catAtencion = user.user_cve, catFax3 = user.ef_cve }
                            join div in modelo.xcdivef on new { divDiv = user.div_cve, divEF = user.ef_cve } equals new { divDiv = div.div_cve, divEF = div.ef_cve }
                                where cat.atencion1.Equals(num_nom) && cat.cc_tipo.Equals("f") && cat.rfc.Equals(rfc) 
                            select new {nombre = user.nombre + " - "+ div.nombre}).Select(t => t.nombre).Count();*/
            SqlConnection _conn = new SqlConnection(CadenaConecta);
            SqlCommand _cmd = new SqlCommand();
            _cmd.Connection = _conn;
            _cmd.CommandType = CommandType.Text;
            _cmd.CommandText = String.Format("select xcuser.nombre + ' - '+ xcdivef.nombre from cccatcc join xcuser on cccatcc.atencion2 = xcuser.user_cve and cccatcc.fax3 = xcuser.ef_cve join xcdivef on xcuser.div_cve = xcdivef.div_cve and xcuser.ef_cve = xcdivef.ef_cve where cccatcc.atencion1 ='{0}' and cccatcc.cc_tipo ='F' and cccatcc.rfc = '{1}'", num_nom, rfc);
            _conn.Open();
            var consulta = Convert.ToString(_cmd.ExecuteScalar());
            _cmd.ExecuteNonQuery();
            //_da.Fill(dt);
            _conn.Close();
            if (consulta == null)
            {
                nombre = null;
            }
            else
            {
                nombre = consulta.ToString();
            }

            return nombre;
        }
    }
}
