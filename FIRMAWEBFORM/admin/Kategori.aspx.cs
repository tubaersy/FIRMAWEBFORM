using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FIRMAWEBFORM.admin
{
    public partial class Kategori : System.Web.UI.Page
    {
        FIRMAEntities db = new FIRMAEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = db.KATEGORIs.ToList();
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int refno = Convert.ToInt32(GridView1.SelectedDataKey.Value.ToString());
            KATEGORI k = db.KATEGORIs.Find(refno);

            if (k != null)
            {
                txtKATEGORI_ADI.Text = k.KATEGORI_ADI;
                txtKATEGORI_REFNO.Text = k.KATEGORI_REFNO.ToString();
            }

            pnlKayit.Visible = true;
            pnlListe.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {       // YENİ

            txtKATEGORI_ADI.Text = "";
            txtKATEGORI_REFNO.Text = "";


            pnlKayit.Visible = true;
            pnlListe.Visible = false;

        }

        protected void Button3_Click(object sender, EventArgs e)
        {       // KAYDET

            if (txtKATEGORI_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtKATEGORI_REFNO.Text);
                KATEGORI k = db.KATEGORIs.Find(refno);
                k.KATEGORI_ADI = txtKATEGORI_ADI.Text;
            }
            else
            {
                KATEGORI k = new KATEGORI();
                k.KATEGORI_ADI = txtKATEGORI_ADI.Text;
                db.KATEGORIs.Add(k);
                db.SaveChanges();
            }

            GridView1.DataSource = db.KATEGORIs.ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {       // VAZGEÇ

            GridView1.DataSource = db.KATEGORIs.ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;

        }

        protected void Button5_Click(object sender, EventArgs e)
        {       // SİL

            if (txtKATEGORI_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtKATEGORI_REFNO.Text);
                KATEGORI k = db.KATEGORIs.Find(refno);

                db.KATEGORIs.Remove(k);

                db.SaveChanges();

                GridView1.DataSource = db.KATEGORIs.ToList();
                GridView1.DataBind();

                pnlKayit.Visible = false;
                pnlListe.Visible = true;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {       // ARA

            GridView1.DataSource = db.KATEGORIs.Where(k => k.KATEGORI_ADI.Contains(txtARA.Text)).ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.DataSource = db.KATEGORIs.Where(k => k.KATEGORI_ADI.Contains(txtARA.Text)).ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;
        }
    }
}