using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FIRMAWEBFORM.admin
{
    public partial class Kullanici : System.Web.UI.Page
    {
        FIRMAEntities db = new FIRMAEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = db.KULLANICIs.ToList();
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int refno = Convert.ToInt32(GridView1.SelectedDataKey.Value.ToString());
            KULLANICI k = db.KULLANICIs.Find(refno);

            if (k != null)
            {
                txtKULLANICI_ADI.Text = k.KULLANICI_ADI;
                txtKULLANICI_REFNO.Text = k.KULLANICI_REFNO.ToString();
                txtPAROLA.Text = k.PAROLA;
            }

            pnlKayit.Visible = true;
            pnlListe.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {       // YENİ

            txtKULLANICI_ADI.Text = "";
            txtKULLANICI_REFNO.Text = "";
            txtPAROLA.Text = "";

            pnlKayit.Visible = true;
            pnlListe.Visible = false;

        }

        protected void Button3_Click(object sender, EventArgs e)
        {       // KAYDET

            if (txtKULLANICI_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtKULLANICI_REFNO.Text);
                KULLANICI k = db.KULLANICIs.Find(refno);
                k.KULLANICI_ADI = txtKULLANICI_ADI.Text;
                k.PAROLA = txtPAROLA.Text;
                db.SaveChanges();
            }
            else
            {
                KULLANICI k = new KULLANICI();
                k.KULLANICI_ADI = txtKULLANICI_ADI.Text;
                k.PAROLA = txtPAROLA.Text;
                db.KULLANICIs.Add(k);
                db.SaveChanges();
            }

            GridView1.DataSource = db.KULLANICIs.ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;

        }

        protected void Button4_Click(object sender, EventArgs e)
        {       // VAZGEÇ

            GridView1.DataSource = db.KULLANICIs.ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;

        }

        protected void Button5_Click(object sender, EventArgs e)
        {       // SİL

            if (txtKULLANICI_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtKULLANICI_REFNO.Text);
                KULLANICI k = db.KULLANICIs.Find(refno);

                db.KULLANICIs.Remove(k);

                db.SaveChanges();

                GridView1.DataSource = db.KULLANICIs.ToList();
                GridView1.DataBind();
                pnlKayit.Visible = false;
                pnlListe.Visible = true;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {       // ARA

            GridView1.DataSource = db.KULLANICIs.Where(k => k.KULLANICI_ADI.Contains(txtARA.Text)).ToList();
            GridView1.DataBind();

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = db.KULLANICIs.Where(k => k.KULLANICI_ADI.Contains(txtARA.Text)).ToList();
            GridView1.DataBind();
        }
    }
}