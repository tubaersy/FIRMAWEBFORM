<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Yonetim.Master" AutoEventWireup="true" CodeBehind="Kategori.aspx.cs" Inherits="FIRMAWEBFORM.admin.Kategori" %>

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
        height: 21px;
        width: 150px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellspacing="0" class="auto-style1">
        <tr>
            <td>
                <asp:Panel ID="pnlListe" runat="server" CssClass="button">
                    <table cellspacing="0" class="auto-style1">
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label1" runat="server" Text="Kategori Adı"></asp:Label>
                                <asp:TextBox ID="txtARA" runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" runat="server" Text="Ara" OnClick="Button1_Click" />
                                <asp:Button ID="Button2" runat="server" Text="Yeni" OnClick="Button2_Click" />
                            </td>
                            <td class="auto-style2"></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Horizontal" Width="100%" AllowPaging="True" DataKeyNames="KATEGORI_REFNO" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="5" ForeColor="Black">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" HeaderText="Seç" />
                                        <asp:BoundField DataField="KATEGORI_REFNO" HeaderText="Kategori Refno" />
                                        <asp:BoundField DataField="KATEGORI_ADI" HeaderText="Kategori Adı" />
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
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="pnlKayit" runat="server" Visible="False" CssClass="button">
                    <table cellspacing="0" class="auto-style1">
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label2" runat="server" Text="Kategori Refno"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtKATEGORI_REFNO" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label3" runat="server" Text="Kategori Adı"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtKATEGORI_ADI" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtKATEGORI_ADI" ErrorMessage="Kategori Adı Giriniz" ValidationGroup="KayitFormu"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>
                                <asp:Button ID="Button3" runat="server" Text="Kaydet" ValidationGroup="KayitFormu" OnClick="Button3_Click" />
                                <asp:Button ID="Button4" runat="server" Text="Vazgeç" OnClick="Button4_Click" />
                                <asp:Button ID="Button5" runat="server" Text="Sil" OnClick="Button5_Click" OnClientClick="return confirm ('Kayıt Silinsin mi')" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
