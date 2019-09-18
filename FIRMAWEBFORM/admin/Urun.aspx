<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Yonetim.Master" AutoEventWireup="true" CodeBehind="Urun.aspx.cs" Inherits="FIRMAWEBFORM.admin.WebForm1" %>
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
                <asp:Panel ID="pnlListe" runat="server">
                    <table cellspacing="0" class="auto-style1">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="Ürün Adı"></asp:Label>
                                <asp:TextBox ID="txtARA" runat="server"></asp:TextBox>
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Ara" />
                                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Yeni" />
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="URUN_REFNO" GridLines="Horizontal" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%" AllowPaging="True" ForeColor="Black" PageSize="5">
                                    <Columns>
                                        <asp:CommandField HeaderText="Seç" ShowSelectButton="True" />
                                        <asp:BoundField DataField="URUN_REFNO" HeaderText="Ürün Refno" />
                                        <asp:BoundField DataField="URUN_ADI" HeaderText="Ürün Adı" />
                                        <asp:BoundField DataField="FIYATI" HeaderText="Fiyatı" />
                                        <asp:BoundField DataField="DURUMU" HeaderText="Durumu" />
                                        <asp:BoundField DataField="KATEGORI_REFNO" HeaderText="Kategori Refno" />
                                        <asp:BoundField DataField="KDV_ORANI" HeaderText="Kdv Oranı" />
                                        <asp:BoundField DataField="MARKA_REFNO" HeaderText="Marka Refno" />
                                        <asp:BoundField DataField="ACIKLAMA" HeaderText="Açıklama" HtmlEncode="False" />
                                        <asp:ImageField DataImageUrlField="RESIM1" DataImageUrlFormatString="/images/{0}" HeaderText="Resim1" ControlStyle-Width="80">
                                            <ControlStyle Width="80px" />
                                        </asp:ImageField>

                                        

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
                <asp:Panel ID="pnlKayit" runat="server" Visible="False">
                    <table cellspacing="0" class="auto-style1">
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style2"></td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label2" runat="server" Text="Ürün Refno"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtURUN_REFNO" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label3" runat="server" Text="Ürün Adı"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtURUN_ADI" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtURUN_ADI" ErrorMessage="Ürün Adı Giriniz" ValidationGroup="KayitFormu"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label4" runat="server" Text="Fiyatı"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFIYATI" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFIYATI" ErrorMessage="Fiyatı Giriniz" ValidationGroup="KayitFormu"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label5" runat="server" Text="Durumu"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDURUMU" runat="server">
                                    <asp:ListItem Selected="True" Value="True">Aktif</asp:ListItem>
                                    <asp:ListItem Value="False">Pasif</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label6" runat="server" Text="Kategori Refno"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlKATEGORI_REFNO" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label7" runat="server" Text="Kdv Oranı"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtKDV_ORANI" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtKDV_ORANI" ErrorMessage="Kdv Oranı Giriniz" ValidationGroup="KayitFormu"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label8" runat="server" Text="Marka Refno"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlMARKA_REFNO" runat="server">
                                </asp:DropDownList>
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
                            <td class="auto-style4">
                                <asp:Label ID="Label10" runat="server" Text="Resim1"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="RESIM1" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="RESIM1" ErrorMessage="Resim Seçiniz" ValidationGroup="KayitFormu"></asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label11" runat="server" Text="Resim2"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="RESIM2" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="RESIM2" ErrorMessage="Resim Seçiniz" ValidationGroup="KayitFormu"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label12" runat="server" Text="Resim3"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="RESIM3" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="RESIM3" ErrorMessage="Resim Seçiniz" ValidationGroup="KayitFormu"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label13" runat="server" Text="Resim4"></asp:Label>
                            </td>
                            <td>
                                <asp:FileUpload ID="RESIM4" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="RESIM4" ErrorMessage="Resim Seçiniz" ValidationGroup="KayitFormu"></asp:RequiredFieldValidator>
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
