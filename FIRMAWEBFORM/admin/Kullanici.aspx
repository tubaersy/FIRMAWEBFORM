<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Yonetim.Master" AutoEventWireup="true" CodeBehind="Kullanici.aspx.cs" Inherits="FIRMAWEBFORM.admin.Kullanici" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        height: 21px;
    }
    .auto-style3 {
        width: 150px;
    }
    .auto-style4 {
        width: 150px;
        height: 24px;
    }
    .auto-style5 {
        height: 24px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlListe" runat="server" CssClass="button">
    <table cellspacing="0" class="auto-style1">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label1" runat="server" Text="Kullanıcı Adı"></asp:Label>
                <asp:TextBox ID="txtARA" runat="server"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Ara" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Yeni" OnClick="Button2_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Width="100%" AllowPaging="True" DataKeyNames="KULLANICI_REFNO" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="5" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:CommandField HeaderText="Seç" ShowSelectButton="True" />
                        <asp:BoundField DataField="KULLANICI_REFNO" HeaderText="Kullanıcı Refno" />
                        <asp:BoundField DataField="KULLANICI_ADI" HeaderText="Kullanıcı Adı" />
                        
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
            </td>
        </tr>
    </table>

    </asp:Panel>

    <asp:Panel ID="pnlKayit" runat="server" Visible="False" CssClass="button">
        <table cellspacing="0" class="auto-style1">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="Kullanıcı Refno"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtKULLANICI_REFNO" runat="server" MaxLength="20" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label3" runat="server" Text="Kullanıcı Adı"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtKULLANICI_ADI" runat="server" MaxLength="20"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtKULLANICI_ADI" ErrorMessage="Kullanıcı Adı giriniz" ValidationGroup="KayitFormu"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="Label4" runat="server" Text="Parola"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtPAROLA" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPAROLA" ErrorMessage="Parola Giriniz" ValidationGroup="KayitFormu"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td>
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Kaydet" ValidationGroup="KayitFormu" />
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Vazgeç" />
                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" OnClientClick="return confirm('Kayıt Silinsin mi')" Text="Sil" />
                </td>
            </tr>
        </table>

    </asp:Panel>
</asp:Content>
