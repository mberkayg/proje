<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="*****.Giris" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>*****Yazılım</title>
    <link href="Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="Scripts/jquery-1.12.2.min.js"></script>
</head>


<body>
    <form id="form1" runat="server">
    <div>
        <br />
        <br />
        <div class="p-3">
            <img src="Resimler/*****.jpg" class="img-fluid" alt="Responsive image" width="50%" />
        </div>
        <br />
        <br />
        <dx:BootstrapFormLayout ID="BootstrapFormLayout1" runat="server">
            <Items>
                <dx:BootstrapLayoutItem Caption="">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:BootstrapTextBox ID="txtKullaniciAdi" runat="server" NullText="Kullanıcı Adı">
                            </dx:BootstrapTextBox>
                            <br />
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:BootstrapLayoutItem>
                <dx:BootstrapLayoutItem Caption="">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:BootstrapTextBox ID="txtSifre" runat="server" NullText="Şifre" Password="True">
                            </dx:BootstrapTextBox>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:BootstrapLayoutItem>
                <dx:BootstrapLayoutItem Caption="">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:BootstrapCheckBox ID="chkBeniHatirla" runat="server" Checked="True" CheckState="Checked" Text="Beni Hatırla">
                            </dx:BootstrapCheckBox>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:BootstrapLayoutItem>
                <dx:BootstrapLayoutItem Caption="">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:BootstrapButton ID="btnGiris" runat="server" Text="Giriş Yap" OnClick="btnGiris_Click">
                            </dx:BootstrapButton>
                            <br />
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:BootstrapLayoutItem>
            </Items>
        </dx:BootstrapFormLayout>
    </div>
        
    </form>
    <br />
    <div class="text-center">
                    <p>&copy; <%: DateTime.Now.Year %> - ***** Bilgisayar Sistemleri</p>
    </div>
</body>
</html>
