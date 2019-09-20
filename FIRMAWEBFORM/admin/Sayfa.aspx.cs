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

        protected void Button2_Click(object sender, EventArgs e)
        {       // YENİ

            txtSAYFA_REFNO.Text = "";
            txtBASLIK.Text = "";
            txtICERIK.Text = "";


            pnlKayit.Visible = true;
            pnlListe.Visible = false;

        }

        protected void Button3_Click(object sender, EventArgs e)
        {       // KAYDET

            if (txtSAYFA_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtSAYFA_REFNO.Text);
                SAYFA s = db.SAYFAs.Find(refno);
                s.BASLIK = txtBASLIK.Text;
                s.ICERIK = HttpUtility.HtmlDecode(txtICERIK.Text);
            }
            else
            {
                SAYFA s = new SAYFA();
                s.BASLIK = txtBASLIK.Text;
                s.ICERIK = HttpUtility.HtmlDecode(txtICERIK.Text);
                db.SAYFAs.Add(s);
                db.SaveChanges();
            }

            GridView1.DataSource = db.SAYFAs.ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;

        }

        protected void Button4_Click(object sender, EventArgs e)
        {        // VAZGEÇ

            GridView1.DataSource = db.SAYFAs.ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;

        }

        protected void Button5_Click(object sender, EventArgs e)
        {       // SİL

            if (txtSAYFA_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtSAYFA_REFNO.Text);
                SAYFA s = db.SAYFAs.Find(refno);

                db.SAYFAs.Remove(s);

                db.SaveChanges();

                GridView1.DataSource = db.SAYFAs.ToList();
                GridView1.DataBind();

                pnlKayit.Visible = false;
                pnlListe.Visible = true;

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {       // ARA

            GridView1.DataSource = db.SAYFAs.Where(k => k.BASLIK.Contains(txtARA.Text)).ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = db.SAYFAs.Where(k => k.BASLIK.Contains(txtARA.Text)).ToList();
            GridView1.DataBind();
        }
    }
}