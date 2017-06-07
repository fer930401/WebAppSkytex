﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Skytex.Models.ViewModel
{
    public class ofertasModel
    {
        public class ofertasSkytex
        {
            public string ef_cve { get; set; }
            public string div_cve { get; set; }
            public string cc_tipo { get; set; }
            public string cc_cve { get; set; }
            public string alm_cve { get; set; }
            public string ven_cve { get; set; }
            public int num_fol { get; set; }
            public short tot_reng { get; set; }
            public string tipo_doc { get; set; }
            public string ef_cvep { get; set; }
            public Nullable<int> num_folp { get; set; }
            public string tipo_docp { get; set; }
            public string refer { get; set; }
            public System.DateTime fec_mov { get; set; }
            public System.DateTime fec_ultact { get; set; }
            public string id_ultact { get; set; }
            public string foremb_cve { get; set; }
            public decimal pct_desc { get; set; }
            public string tm { get; set; }
            public decimal tc { get; set; }
            public decimal total { get; set; }
            public decimal iva { get; set; }
            public decimal ieps { get; set; }
            public string obs { get; set; }
            public decimal pct_canacp { get; set; }
            public System.DateTime fec_prom { get; set; }
            public bool sw_facpar { get; set; }
            public bool sw_entpar { get; set; }
            public string forpag_cve { get; set; }
            public string fob_cve { get; set; }
            public string cf_cve { get; set; }
            public string cif_cve { get; set; }
            public string dest_cve { get; set; }
            public string sw_transp { get; set; }
            public decimal cf_flete { get; set; }
            public decimal cif_flete { get; set; }
            public decimal seguro { get; set; }
            public string num_guia { get; set; }
            public string contenedor { get; set; }
            public decimal no_bultos { get; set; }
            public decimal tie_trans { get; set; }
            public short plazo_pp { get; set; }
            public decimal pct_descpp { get; set; }
            public bool sw_impdia { get; set; }
            public bool sw_consolida { get; set; }
            public decimal dato1 { get; set; }
            public decimal dato2 { get; set; }
            public decimal dato3 { get; set; }
            public decimal dato4 { get; set; }
            public decimal dato5 { get; set; }
            public decimal dato6 { get; set; }
            public decimal dato7 { get; set; }
            public decimal dato8 { get; set; }
            public decimal dato9 { get; set; }
            public decimal dato10 { get; set; }
            public string ven_tipo { get; set; }
            public string foremb_tipo { get; set; }
            public Nullable<short> plazo { get; set; }
            public bool sw_impexp { get; set; }
            public string suc_cve { get; set; }
            public string suc_aten { get; set; }
            public string imp_letra { get; set; }
            public string fec_letra { get; set; }
        }
        public class OfertasDataView
        {
            public IEnumerable<ofertasSkytex> UserProfile { get; set; }
        }
    }
}