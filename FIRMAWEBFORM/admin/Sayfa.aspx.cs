using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FIRMAWEBFORM.admin
{
    public partial class Sayfa : System.Web.UI.Page
    {
        FIRMAEntities db = new FIRMAEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = db.SAYFAs.ToList();
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int refno = Convert.ToInt32(GridView1.SelectedDataKey.Value.ToString());
            SAYFA s = db.SAYFAs.Find(refno);

            if (s != null)
            {
                txtBASLIK.Text = s.BASLIK;
                txtSAYFA_REFNO.Text = s.SAYFA_REFNO.ToString();
                txtICERIK.Text = s.ICERIK;
            }

            pnlKayit.Visible = true;
            pnlListe.Visible = false;
        }
    }
}