using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using AjaxControlToolkit;

namespace *****
{
    public partial class selectrow : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataSet ds = new DataSet();
            int i = 0;
            string sql = null;
            string connectionString = "Data Source=*****;Initial Catalog=*****;UID=*****;PWD=Nt@@*****";
            sql = "SELECT STKKOD,STKCINSI, " +
                "isnull((SELECT SUM(CASE WHEN STKHARGCFLAG = 1 THEN MIKTAR ELSE MIKTAR * -1 END) FROM HAR WITH (NOLOCK) WHERE STKHARANADEPO IN (SELECT DEPKOD FROM DEPO WITH (NOLOCK) WHERE ACIKLAMA1 IN ('RAF','PALET','PAKET İS')) AND SHARKOD = SORGU.KOD),0) BAKIYE   " +
                "FROM KART SORGU WITH (NOLOCK) WHERE KARTTIP14 = 0 ORDER BY BAKIYE DESC";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = new SqlCommand(sql, connection);
            adapter.SelectCommand = command;
            adapter.Fill(ds);
            adapter.Dispose();
            command.Dispose();
            connection.Close();
            GridView1.DataSource = ds.Tables[0];
            GridView1.DataBind();

            if (!IsPostBack)
            {
                loadStores();
            }
        }

        protected void loadStores()
        {
            SqlConnection cnn = new SqlConnection("Data Source=*****;Initial Catalog=*****;UID=Nethouse;PWD=Nt@@*****");
            cnn.Open();
            SqlCommand cmd = new SqlCommand("SELECT ***** FROM STKKART  SORGU WITH (NOLOCK) WHERE ***** = '" + Request.QueryString["*****"] + "'", Giris.baglanti);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            int count = ds.Tables[0].Rows.Count;
            cnn.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                msg.Text = " No data found !!!";
            }
        }


        //--------EDIT BUTONU--------//
        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            LinkButton btnsubmit = sender as LinkButton;
            GridViewRow gRow = (GridViewRow)btnsubmit.NamingContainer;
            STOKID.Text = GridView1.DataKeys[gRow.RowIndex].Value.ToString();
            STOKAD.Text = gRow.Cells[1].Text;
            //int adet = 0;
            //STOKADET.Text = adet.ToString();
            //STOKFIYAT.Text = adet.ToString();
            //TUTAR.Text = adet.ToString();
            //int stkadet = Convert.ToInt32(STOKADET.Text);
            //int stkfyt = Convert.ToInt32(STOKFIYAT.Text);
            //int tutar = Convert.ToInt32(TUTAR.Text);
            //tutar = stkadet * stkfyt;

            this.ModalPopupExtender1.Show();

        }

        //-------EKLE HESAPLA----------//
        protected void butonEkle_Click(object sender, EventArgs e)
        {
            //urunadet.Text = STOKADET.Text.ToString();
            urunkodu.Text = STOKID.Text;
            urunadi.Text = STOKAD.Text;
            //urunadet.Text = STOKADET.Text;
            msg.Text = "Data Updated...";
            loadStores();
        }

        //-----MUSTERİ BUTONU-------//

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='aquamarine';";
                e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
                e.Row.ToolTip = "click last column for selecting this row";
            }
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            string pName = GridView1.SelectedRow.Cells[1].Text;
            msg.Text = "<b>Publisher Name:" + pName + "</b>";
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = GetProducts();
            GridView1.DataBind();

        }
        DataTable dt;

        private DataTable GetProducts()
        {
            string strBaglanti = @"SERVER=*****;DATABASE=*****;UID=*****;PWD=Nt*****2014";
            SqlConnection connection = new SqlConnection(strBaglanti);
            if (Giris.baglanti.State != ConnectionState.Open)
            {
                Giris.baglanti.Open();
            }
            string strKomut = @"SELECT KOD,CINSI FROM [dbo].[KART]";

            DataTable dt = new DataTable();

            SqlDataAdapter da = new SqlDataAdapter(strKomut, Giris.baglanti);
            da.Fill(dt);
            if (Giris.baglanti.State != ConnectionState.Closed)
            {
                Giris.baglanti.Close();

            }
            return dt;
        }

        protected void butonHesapla_Click(object sender, EventArgs e)
        {


        }


        double sayi1, sayi2, toplama;
        protected void Button3_Click(object sender, EventArgs e)
        {
            //Çarpma Bölümü
            sayi1 = Convert.ToDouble(TextBox1.Text);
            sayi2 = Convert.ToDouble(TextBox2.Text);
            toplama = sayi1 * sayi2;
            TextBox3.Text = toplama.ToString();
        }

        protected void ekletest_Click(object sender, EventArgs e)
        {

        }


    }
}