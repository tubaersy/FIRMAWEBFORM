<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Yonetim.Master" AutoEventWireup="true" CodeBehind="Proje.aspx.cs" Inherits="FIRMAWEBFORM.admin.Proje" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 21px;
        }
        .auto-style3 {
            height: 21px;
            width: 150px;
        }
        .auto-style4 {
            width: 150px;
        }
    </style>
    <script src="../ckfinder/ckfinder.js"></script>
    <script src="../ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table cellspacing="0" class="auto-style1">
        <tr>
            <td>
                <asp:Panel ID="pnlListe" runat="server" CssClass="button">
                    <table cellspacing="0" class="auto-style1">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Proje Adı"></asp:Label>
                                <asp:TextBox ID="txtARA" runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ara" />
                                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Yeni" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="PROJE_REFNO" GridLines="Horizontal" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%" AllowPaging="True" ForeColor="Black" PageSize="5">
                                    <Columns>
                                        <asp:CommandField HeaderText="Seç" ShowSelectButton="True" />
                                        <asp:BoundField DataField="PROJE_REFNO" HeaderText="Proje Refno" />
                                        <asp:BoundField DataField="PROJE_ADI" HeaderText="Proje Adı" />
                                        <asp:ImageField DataImageUrlField="RESIM" DataImageUrlFormatString="/images/{0}" HeaderText="Resim" ControlStyle-Width="80"/>
                                        <asp:BoundField DataField="ACIKLAMA" HeaderText="Açıklama" HtmlEncode="False" />
                                        

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
                            <td class="auto-style2"></td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label2" runat="server" Text="Proje Refno"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPROJE_REFNO" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label3" runat="server" Text="Proje Adı"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPROJE_ADI" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPROJE_ADI" ErrorMessage="Proje Adı Giriniz" ValidationGroup="KayitFormu"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        

                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label10" runat="server" Text="Resim"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="RESIM1" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="RESIM1" ErrorMessage="Resim Seçiniz" ValidationGroup="KayitFormu"></asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label9" runat="server" Text="Açıklama"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtACIKLAMA" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtACIKLAMA" ErrorMessage="Açıklama Giriniz" ValidationGroup="KayitFormu"></asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td>
                                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Kaydet" ValidationGroup="KayitFormu" />
                                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Vazgeç" />
                                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Sil" OnClientClick="return confirm ('Kayıt Silinsin mi')" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>

     <script>
        var editor = CKEDITOR.replace('ContentPlaceHolder1_txtACIKLAMA');

        CKFinder.setupCKEditor(editor, '/ckfinder/');
    </script>

</asp:Content>

