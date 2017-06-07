using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AccesoDatos;

namespace Skytex.LogicaNegocio
{
    public class logicaNegocio
    {
        AccesoDatos.operaciones datos;

        public logicaNegocio()
        {
            datos = new operaciones();
        }
        public string numNomina(string num_nom, string rfc){
            return datos.numNomina(num_nom, rfc);
        }
    }
}
