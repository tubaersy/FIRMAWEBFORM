using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FIRMAWEBFORM.admin
{
    public partial class Proje : System.Web.UI.Page
    {
        FIRMAEntities db = new FIRMAEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = db.PROJEs.ToList();
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int refno = Convert.ToInt32(GridView1.SelectedDataKey.Value.ToString());
            PROJE p = db.PROJEs.Find(refno);

            if (p != null)
            {
                txtPROJE_REFNO.Text = p.PROJE_REFNO.ToString();
                txtPROJE_ADI.Text = p.PROJE_ADI;
                txtACIKLAMA.Text = p.ACIKLAMA;

            }

            pnlKayit.Visible = true;
            pnlListe.Visible = false;

        }

        protected void Button2_Click(object sender, EventArgs e)
        {       // YENİ

            txtPROJE_REFNO.Text = "";
            txtPROJE_ADI.Text = "";
            txtACIKLAMA.Text = "";


            pnlKayit.Visible = true;
            pnlListe.Visible = false;

        }

        protected void Button3_Click(object sender, EventArgs e)
        {       // KAYDET

            if (txtPROJE_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtPROJE_REFNO.Text);
                PROJE p = db.PROJEs.Find(refno);
                p.PROJE_ADI = txtPROJE_ADI.Text;
                p.ACIKLAMA = HttpUtility.HtmlDecode(txtACIKLAMA.Text);
                p.RESIM = RESIM1.FileName;
                

                RESIM1.SaveAs(Request.PhysicalApplicationPath + "/images/" + RESIM1.FileName);
               
                db.SaveChanges();
            }

            else
            {

                PROJE p = new PROJE();
                p.PROJE_ADI = txtPROJE_ADI.Text;
                p.ACIKLAMA = HttpUtility.HtmlDecode(txtACIKLAMA.Text);
                p.RESIM = RESIM1.FileName;
                

                RESIM1.SaveAs(Request.PhysicalApplicationPath + "/images/" + RESIM1.FileName);
                
                db.PROJEs.Add(p);
                db.SaveChanges();
            }


            GridView1.DataSource = db.PROJEs.ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;

        }

        protected void Button4_Click(object sender, EventArgs e)
        {        // VAZGEÇ

            GridView1.DataSource = db.PROJEs.ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;

        }

        protected void Button5_Click(object sender, EventArgs e)
        {       // SİL

            if (txtPROJE_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtPROJE_REFNO.Text);
                PROJE p = db.PROJEs.Find(refno);

                db.PROJEs.Remove(p);

                db.SaveChanges();

                GridView1.DataSource = db.PROJEs.ToList();
                GridView1.DataBind();

                pnlKayit.Visible = false;
                pnlListe.Visible = true;

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {       // ARA

            GridView1.DataSource = db.PROJEs.Where(p => p.PROJE_ADI.Contains(txtARA.Text)).ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = db.PROJEs.Where(p => p.PROJE_ADI.Contains(txtPROJE_ADI.Text)).ToList();
            GridView1.DataBind();
        }
    }
}