<%@ Page Title="" Language="C#" MasterPageFile="~/AnaDizayn.Master" AutoEventWireup="true" CodeBehind="selectrow.aspx.cs" Inherits="*****.selectrow" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid jumbotron" style="height: 900px">
        <asp:GridView ID="GridView1" DataKeyNames="STKKOD" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound"
            OnSelectedIndexChanged="OnSelectedIndexChanged" HeaderStyle-BackColor="#507CD1" Font-Bold="True" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="STKKOD" HeaderText="STKKOD" />
                <asp:BoundField DataField="STKCINSI" HeaderText="STKCINSI" />
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkEdit" Text="Edit" OnClick="lnkEdit_Click" runat="server"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div>
            <asp:Label ID="Label1" runat="server" Text="urunkodu"></asp:Label>
            <dx:BootstrapTextBox ID="urunkodu" ReadOnly="true" runat="server"></dx:BootstrapTextBox>

            <asp:Label ID="Label2" runat="server" Text="urunadi"></asp:Label>
            <dx:BootstrapTextBox ID="urunadi" ReadOnly="true" runat="server"></dx:BootstrapTextBox>

            <asp:Label ID="Label3" runat="server" Text="Adet"></asp:Label>
            <dx:BootstrapTextBox ID="urunadet" ReadOnly="true" runat="server"></dx:BootstrapTextBox>

            <asp:Label ID="Label4" runat="server" Text="Fiyat"></asp:Label>
            <dx:BootstrapTextBox ID="urunfiyat" ReadOnly="true" runat="server"></dx:BootstrapTextBox>

            <asp:Label ID="Label5" runat="server" Text="Tutar"></asp:Label>
            <dx:BootstrapTextBox ID="uruntutar" ReadOnly="true" runat="server"></dx:BootstrapTextBox>


            <asp:Label ID="Label6" runat="server" Text="Tarih"></asp:Label>
            <dx:BootstrapTextBox ID="siparistarihi" runat="server"></dx:BootstrapTextBox>

            <asp:Label ID="Label7" runat="server" Text="Siparis No"></asp:Label>
            <dx:BootstrapTextBox ID="siparisno" runat="server"></dx:BootstrapTextBox>



            <%--CARİ--%>
            <asp:Label ID="Label8" runat="server" Text="CARİ KODU"></asp:Label>
            <dx:BootstrapTextBox ID="carikodu" ReadOnly="true" runat="server"></dx:BootstrapTextBox>

            <asp:Label ID="Label9" runat="server" Text="CARİ UNVAN"></asp:Label>
            <dx:BootstrapTextBox ID="carunvan" ReadOnly="true" runat="server"></dx:BootstrapTextBox>

            <asp:Label ID="Label10" runat="server" Text="CARİ ADRES"></asp:Label>
            <dx:BootstrapTextBox ID="cariadres" ReadOnly="true" runat="server"></dx:BootstrapTextBox>


        </div>


        <br />
        <asp:Label ID="msg" runat="server" Text="Label"></asp:Label>





        <%-----------STOK POPUP PANEL BAŞLANGIÇ-----------%>
        <asp:Button ID="modelPopup" runat="server" Style="display: none" />

        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="modelPopup" PopupControlID="updatePanel"
            CancelControlID="btnCancel" BackgroundCssClass="tableBackground" runat="server">
        </ajaxToolkit:ModalPopupExtender>


        <asp:Panel ID="updatePanel" runat="server" BackColor="White" Height="300px" Width="300px" Style="display: none">

            <table width="100%" cellspacing="4">
                <tr style="background-color: #33CC66">
                    <td colspan="2" align="center">Store Details</td>
                </tr>
                <tr>
                    <td align="right" style="width: 45%">STOK ID:
                    </td>
                    <td>
                        <asp:Label ID="STOKID" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="right">STOK AD:
                    </td>
                    <td>
                        <asp:Label ID="STOKAD" runat="server" />
                    </td>
                </tr>


                <tr>
                    <td align="right">
                        <%--                        <asp:Button ID="btnEkle" CommandName="Update" OnClick="btnEkle_Click" runat="server" Text="Ekle" />--%>
                        <asp:LinkButton ID="butonEkle" OnClick="butonEkle_Click" Text="Ekle" runat="server"></asp:LinkButton>

                    </td>
                    <td align="center">
                        <asp:Button ID="btnCancel" runat="server" Text="İptal" />
                    </td>
                </tr>
            </table>


            <table>


                <tr>
                    <td align="center">
                        <asp:LinkButton ID="ekletest" runat="server" Text="TestEkle" OnClick="ekletest_Click" />
                    </td>
                </tr>
            </table>


        </asp:Panel>


                        <tr>
                    <td align="right">Adet:
                    </td>
                    <td>
                        <asp:TextBox ID="stokadet" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right">Fiyat:
                    </td>
                    <td>
                        <asp:TextBox ID="stokfiyat" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right">Tutar:
                    </td>
                    <td>
                        <asp:Label ID="labelsonuc" Text="Sonuç" runat="server"></asp:Label>
                    </td>
                </tr>


                Birinci Sayı:<asp:TextBox ID="TextBox1" runat="server" BackColor="#00CC66" 
            ForeColor="#000099"></asp:TextBox>
        <br />
        <br />
        İkinci Sayı:<asp:TextBox ID="TextBox2" runat="server" BackColor="#00CC66" 
            ForeColor="#000099"></asp:TextBox>
                <tr>
                    <td align="center">
                        <dx:ASPxButton OnClick="Button3_Click" ID="Button3" runat="server" Text="yeni"></dx:ASPxButton>
                    </td>
                </tr>
                Sonuç:<asp:TextBox ID="TextBox3" runat="server" BackColor="#00CC66" 
            ForeColor="#000099" ReadOnly="True"></asp:TextBox>

        <%-----------STOK POPUP PANEL BİTİŞ-----------%>
    </div>
    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 300px;
            height: 140px;
        }
    </style>
</asp:Content>
