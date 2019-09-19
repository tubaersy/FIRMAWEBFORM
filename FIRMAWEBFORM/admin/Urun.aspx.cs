using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FIRMAWEBFORM.admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        FIRMAEntities db = new FIRMAEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = db.URUNs.ToList();
            GridView1.DataBind();

            if (IsPostBack == false)
            {
                ddlKATEGORI_REFNO.DataSource = db.VW_URUN_.ToList();
                ddlKATEGORI_REFNO.DataTextField = "KATEGORI_ADI";
                ddlKATEGORI_REFNO.DataValueField = "KATEGORI_REFNO";
                ddlKATEGORI_REFNO.DataBind();
            }

            if (IsPostBack == false)
            {
                ddlMARKA_REFNO.DataSource = db.VW_URUN_.ToList();
                ddlMARKA_REFNO.DataTextField = "MARKA_ADI";
                ddlMARKA_REFNO.DataValueField = "MARKA_REFNO";
                ddlMARKA_REFNO.DataBind();
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int refno = Convert.ToInt32(GridView1.SelectedDataKey.Value.ToString());
            URUN u = db.URUNs.Find(refno);

            if (u != null)
            {
                txtURUN_REFNO.Text = u.URUN_REFNO.ToString();
                txtURUN_ADI.Text = u.URUN_ADI;
                txtFIYATI.Text = u.FIYATI.ToString();
                ddlDURUMU.SelectedValue = u.DURUMU.ToString();
                ddlKATEGORI_REFNO.SelectedValue = u.KATEGORI_REFNO.ToString();
                txtKDV_ORANI.Text = u.KDV_ORANI.ToString();
                ddlMARKA_REFNO.SelectedValue = u.MARKA_REFNO.ToString();
                txtACIKLAMA.Text = u.ACIKLAMA;

               
            }

            pnlKayit.Visible = true;
            pnlListe.Visible = false;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {       // YENİ

            txtURUN_REFNO.Text = "";
            txtURUN_ADI.Text = "";
            txtFIYATI.Text = "";
            ddlDURUMU.SelectedValue = "True";
            ddlKATEGORI_REFNO.SelectedValue = "1";
            txtKDV_ORANI.Text = "";
            ddlMARKA_REFNO.SelectedValue = "1";
            txtACIKLAMA.Text = "";


            pnlKayit.Visible = true;
            pnlListe.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {       // KAYDET

            if (txtURUN_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtURUN_REFNO.Text);
                URUN u = db.URUNs.Find(refno);
                u.URUN_ADI = txtURUN_ADI.Text;
                u.FIYATI = Convert.ToDecimal(txtFIYATI.Text);
                u.DURUMU = Convert.ToBoolean(ddlDURUMU.SelectedValue);
                u.KATEGORI_REFNO = Convert.ToInt32(ddlKATEGORI_REFNO.SelectedValue);
                u.KDV_ORANI = Convert.ToInt32(txtKDV_ORANI.Text);
                u.MARKA_REFNO = Convert.ToInt32(ddlMARKA_REFNO.SelectedValue);
                u.ACIKLAMA = HttpUtility.HtmlDecode(txtACIKLAMA.Text);
                u.RESIM1 = RESIM1.FileName;
                u.RESIM2 = RESIM2.FileName;
                u.RESIM3 = RESIM3.FileName;
                u.RESIM4 = RESIM4.FileName;

                RESIM1.SaveAs(Request.PhysicalApplicationPath + "/images/" + RESIM1.FileName);
                RESIM2.SaveAs(Request.PhysicalApplicationPath + "/images/" + RESIM2.FileName);
                RESIM3.SaveAs(Request.PhysicalApplicationPath + "/images/" + RESIM3.FileName);
                RESIM4.SaveAs(Request.PhysicalApplicationPath + "/images/" + RESIM4.FileName);

                db.SaveChanges();
            }

            else
            {

                URUN u = new URUN();
                u.URUN_ADI = txtURUN_ADI.Text;
                u.FIYATI = Convert.ToInt32(txtFIYATI.Text);
                u.DURUMU = Convert.ToBoolean(ddlDURUMU.SelectedValue);
                u.KATEGORI_REFNO = Convert.ToInt32(ddlKATEGORI_REFNO.SelectedValue);
                u.KDV_ORANI = Convert.ToInt32(txtKDV_ORANI.Text);
                u.MARKA_REFNO = Convert.ToInt32(ddlMARKA_REFNO.SelectedValue);
                u.ACIKLAMA = HttpUtility.HtmlDecode(txtACIKLAMA.Text);
                u.RESIM1 = RESIM1.FileName;
                u.RESIM2 = RESIM2.FileName;
                u.RESIM3 = RESIM3.FileName;
                u.RESIM4 = RESIM4.FileName;


                RESIM1.SaveAs(Request.PhysicalApplicationPath + "/images/" + RESIM1.FileName);
                RESIM2.SaveAs(Request.PhysicalApplicationPath + "/images/" + RESIM2.FileName);
                RESIM3.SaveAs(Request.PhysicalApplicationPath + "/images/" + RESIM3.FileName);
                RESIM4.SaveAs(Request.PhysicalApplicationPath + "/images/" + RESIM4.FileName);

                db.URUNs.Add(u);
                db.SaveChanges();
            }


            GridView1.DataSource = db.VW_URUN_.ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {       // VAZGEÇ

            GridView1.DataSource = db.VW_URUN_.ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {       // SİL

            if (txtURUN_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtURUN_REFNO.Text);
                URUN u = db.URUNs.Find(refno);

                db.URUNs.Remove(u);

                db.SaveChanges();

                GridView1.DataSource = db.VW_URUN_.ToList();
                GridView1.DataBind();

                pnlKayit.Visible = false;
                pnlListe.Visible = true;

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {       // ARA

            GridView1.DataSource = db.VW_URUN_.Where(u => u.URUN_ADI.Contains(txtARA.Text)).ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = db.URUNs.Where(k => k.URUN_ADI.Contains(txtARA.Text)).ToList();
            GridView1.DataBind();
        }
    }
}