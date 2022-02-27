using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace *****
{
    public partial class Giris : System.Web.UI.Page
    {
        public static SqlConnection baglanti = new SqlConnection("SERVER=*****;DATABASE=*****;UID=*****;PWD=Nt@@*****");
        public static string MiktarFiyatTutarFormati = string.Format("N2", CultureInfo.CreateSpecificCulture("tr-TR"));
        SqlCommand komut;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.Cookies["KullaniciAdi"] != null && Request.Cookies["Sifre"] != null)
                {
                    txtKullaniciAdi.Text = Request.Cookies["KullaniciAdi"].Value;
                    txtSifre.Attributes["value"] = Request.Cookies["Sifre"].Value;
                    chkBeniHatirla.Checked = true;
                }
            }
        }

        protected void btnGiris_Click(object sender, EventArgs e)
        {

            if (chkBeniHatirla.Checked)
            {
                Response.Cookies["KullaniciAdi"].Expires = DateTime.Now.AddDays(30);
                Response.Cookies["Sifre"].Expires = DateTime.Now.AddDays(30);

                Response.Cookies["KullaniciAdi"].Value = txtKullaniciAdi.Text.Trim();
                Response.Cookies["Sifre"].Value = txtSifre.Text.Trim();
            }

            else
            {
                Response.Cookies["KullaniciAdi"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["Sifre"].Expires = DateTime.Now.AddDays(-1);

                Response.Cookies["KullaniciAdi"].Value = "";
                Response.Cookies["Sifre"].Value = "";
            }


            if (baglanti.State == ConnectionState.Closed)
            {
                baglanti.Open();
            }

            komut = new SqlCommand("SELECT COUNT(*) FROM *****..tbKullanicilar WHERE sKullaniciAdi IN (SELECT KullaniciAdi FROM *****..tbKullanici_YetkiAyarlari WHERE Mobile_KullanicisMi = 1) AND KullaniciAdi = '" + txtKullaniciAdi.Text + "' AND Sifre = '" + txtSifre.Text + "'", baglanti);
            int k = Convert.ToInt32(komut.ExecuteScalar());

            if (k == 1)
            {
                komut = new SqlCommand("SET DATEFORMAT DMY INSERT INTO *****..LogKayit (dteIslemTarihi,sAciklama,sKullaniciAdi) VALUES ('"+DateTime.Now.ToString()+"','Login','"+txtKullaniciAdi.Text+"') ", baglanti);
                komut.ExecuteNonQuery();
                Session["KullaniciAdi"] = txtKullaniciAdi.Text;
                Response.Redirect("Default.aspx");
            }

            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "validation", "<script language='javascript'>alert('Kullanıcı adı veya şifre hatalı')</script>");
            }
        }

        
    }
}