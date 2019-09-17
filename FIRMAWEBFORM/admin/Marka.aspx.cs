using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FIRMAWEBFORM.admin
{
    public partial class Marka : System.Web.UI.Page
    {
        FIRMAEntities db = new FIRMAEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = db.MARKAs.ToList();
            GridView1.DataBind();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int refno = Convert.ToInt32(GridView1.SelectedDataKey.Value.ToString());
            MARKA m = db.MARKAs.Find(refno);

            if (m != null)
            {
                txtMARKA_ADI.Text = m.MARKA_ADI;
                txtMARKA_REFNO.Text = m.MARKA_REFNO.ToString();
            }

            pnlKayit.Visible = true;
            pnlListe.Visible = false;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {       // YENİ

            txtMARKA_ADI.Text = "";
            txtMARKA_REFNO.Text = "";


            pnlKayit.Visible = true;
            pnlListe.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {       // KAYDET

            if (txtMARKA_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtMARKA_REFNO.Text);
                MARKA m = db.MARKAs.Find(refno);
                m.MARKA_ADI = txtMARKA_ADI.Text;
            }
            else
            {
                MARKA m = new MARKA();
                m.MARKA_ADI = txtMARKA_ADI.Text;
                db.MARKAs.Add(m);
                db.SaveChanges();
            }

            GridView1.DataSource = db.MARKAs.ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {       // VAZGEÇ

            GridView1.DataSource = db.MARKAs.ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {       // SİL

            if (txtMARKA_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtMARKA_REFNO.Text);
                MARKA m = db.MARKAs.Find(refno);

                db.MARKAs.Remove(m);

                db.SaveChanges();

                GridView1.DataSource = db.MARKAs.ToList();
                GridView1.DataBind();

                pnlKayit.Visible = false;
                pnlListe.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {       // ARA

            GridView1.DataSource = db.MARKAs.Where(m => m.MARKA_ADI.Contains(txtARA.Text)).ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = db.MARKAs.Where(m => m.MARKA_ADI.Contains(txtARA.Text)).ToList();
            GridView1.DataBind();

        }
    }
}