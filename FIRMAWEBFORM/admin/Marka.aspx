<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Yonetim.Master" AutoEventWireup="true" CodeBehind="Marka.aspx.cs" Inherits="FIRMAWEBFORM.admin.Marka" %>
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
                <asp:Panel ID="pnlListe" runat="server">
                    <table cellspacing="0" class="auto-style1">
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="Label1" runat="server" Text="Marka Adı"></asp:Label>
                                <asp:TextBox ID="txtARA" runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" runat="server" Text="Ara" OnClick="Button1_Click" />
                                <asp:Button ID="Button2" runat="server" Text="Yeni" OnClick="Button2_Click" />
                            </td>
                            <td class="auto-style2"></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" Width="100%" AllowPaging="True" DataKeyNames="MARKA_REFNO" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="5">
                                    <Columns>
                                        <asp:CommandField ShowSelectButton="True" HeaderText="Seç" />
                                        <asp:BoundField DataField="MARKA_REFNO" HeaderText="Marka Refno" />
                                        <asp:BoundField DataField="MARKA_ADI" HeaderText="Marka Adı" />
                                    </Columns>
                                    <FooterStyle BackColor="White" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="White" ForeColor="#333333" />
                                    <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                    <SortedAscendingHeaderStyle BackColor="#487575" />
                                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                    <SortedDescendingHeaderStyle BackColor="#275353" />
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
                <asp:Panel ID="pnlKayit" runat="server" Visible="False">
                    <table cellspacing="0" class="auto-style1">
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label2" runat="server" Text="Marka Refno"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtMARKA_REFNO" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <asp:Label ID="Label3" runat="server" Text="Marka Adı"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMARKA_ADI" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMARKA_ADI" ErrorMessage="Marka Adı Giriniz" ValidationGroup="KayitFormu"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>
                                <asp:Button ID="Button3" runat="server" Text="Kaydet" ValidationGroup="KayitFormu" OnClick="Button3_Click" />
                                <asp:Button ID="Button4" runat="server" Text="Vazgeç" OnClick="Button4_Click" style="width: 64px" />
                                <asp:Button ID="Button5" runat="server" Text="Sil" OnClick="Button5_Click" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
