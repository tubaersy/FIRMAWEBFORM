using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FIRMAWEBFORM.admin
{
    public partial class Slider : System.Web.UI.Page
    {
        FIRMAEntities db = new FIRMAEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataSource = db.SLIDERs.ToList();
            GridView1.DataBind();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int refno = Convert.ToInt32(GridView1.SelectedDataKey.Value.ToString());
            SLIDER s = db.SLIDERs.Find(refno);

            if (s != null)
            {
                txtSLIDER_REFNO.Text = s.SLIDER_REFNO.ToString();
                txtBASLIK.Text = s.BASLIK;
                txtLINK.Text = s.LINK;
                ddlDURUMU.SelectedValue = s.DURUMU.ToString();

            }

            pnlKayit.Visible = true;
            pnlListe.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {       // YENİ

            txtSLIDER_REFNO.Text = "";
            txtBASLIK.Text = "";
            txtLINK.Text = "";
            ddlDURUMU.SelectedValue = "True";


            pnlKayit.Visible = true;
            pnlListe.Visible = false;

        }

        protected void Button3_Click(object sender, EventArgs e)
        {       // KAYDET

            if (txtSLIDER_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtSLIDER_REFNO.Text);
                SLIDER s = db.SLIDERs.Find(refno);
                s.BASLIK = txtBASLIK.Text;
                s.LINK = txtLINK.Text;
                s.DURUMU = Convert.ToBoolean(ddlDURUMU.SelectedValue);

                s.RESIM = RESIM1.FileName;

                RESIM1.SaveAs(Request.PhysicalApplicationPath + "/images/" + RESIM1.FileName);


                db.SaveChanges();
            }

            else
            {

                SLIDER s = new SLIDER();
                s.BASLIK = txtBASLIK.Text;
                s.LINK = txtLINK.Text;
                s.DURUMU = Convert.ToBoolean(ddlDURUMU.SelectedValue);

                s.RESIM = RESIM1.FileName;


                RESIM1.SaveAs(Request.PhysicalApplicationPath + "/images/" + RESIM1.FileName);

                db.SLIDERs.Add(s);
                db.SaveChanges();
            }


            GridView1.DataSource = db.SLIDERs.ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;

        }

        protected void Button4_Click(object sender, EventArgs e)
        {       // VAZGEÇ

            GridView1.DataSource = db.SLIDERs.ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;

        }

        protected void Button5_Click(object sender, EventArgs e)
        {       // SİL

            if (txtSLIDER_REFNO.Text != "")
            {
                int refno = Convert.ToInt32(txtSLIDER_REFNO.Text);
                SLIDER s = db.SLIDERs.Find(refno);

                db.SLIDERs.Remove(s);

                db.SaveChanges();

                GridView1.DataSource = db.SLIDERs.ToList();
                GridView1.DataBind();

                pnlKayit.Visible = false;
                pnlListe.Visible = true;

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {       // ARA

            GridView1.DataSource = db.SLIDERs.Where(s => s.BASLIK.Contains(txtARA.Text)).ToList();
            GridView1.DataBind();

            pnlKayit.Visible = false;
            pnlListe.Visible = true;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = db.SLIDERs.Where(s => s.BASLIK.Contains(txtARA.Text)).ToList();
            GridView1.DataBind();
        }
    }
}