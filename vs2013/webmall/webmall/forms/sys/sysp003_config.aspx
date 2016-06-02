<%@ Page Title="" Language="C#" MasterPageFile="~/manager.Master" AutoEventWireup="true" CodeBehind="sysp003_config.aspx.cs" Inherits="webmall.Forms.sys.sysp003_config" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="rpl_master" runat="server" ShowCollapseButton="true" Theme="Office2003Olive" Width="100%" OnInit="rpl_master_Init">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <div>
                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Maroon" Text="應用程式設定參數 AppSetting">
                        </dx:ASPxLabel>
                    </div>
                    <hr />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lbl_app_name" runat="server" Font-Size="Medium" Text="應用程式名稱：">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txt_app_name" runat="server" Font-Size="Medium" Theme="Office2003Olive" Width="300px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="Medium" Text="除錯模式：">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxCheckBox ID="cbx_debug_mode" runat="server" CheckState="Unchecked" Font-Size="Medium" Theme="Office2003Olive">
                                    </dx:ASPxCheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Font-Size="Medium" Text="選單圖示：">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxCheckBox ID="cbx_prg_icon" runat="server" CheckState="Unchecked" Font-Size="Medium" Theme="Office2003Olive">
                                    </dx:ASPxCheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel15" runat="server" Font-Size="Medium" Text="多國語系：">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxCheckBox ID="cbx_multi_language" runat="server" CheckState="Unchecked" Font-Size="Medium" Theme="Office2003Olive">
                                    </dx:ASPxCheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel16" runat="server" Font-Size="Medium" Text="多公司別：">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxCheckBox ID="cbx_multi_company" runat="server" CheckState="Unchecked" Font-Size="Medium" Theme="Office2003Olive">
                                    </dx:ASPxCheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel17" runat="server" Font-Size="Medium" Text="使用者區分公司：">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxCheckBox ID="cbx_user_company" runat="server" CheckState="Unchecked" Font-Size="Medium" Theme="Office2003Olive">
                                    </dx:ASPxCheckBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="Medium" Text="登入頁檔名：">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txt_login_url" runat="server" Font-Size="Medium" Theme="Office2003Olive" Width="300px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" Font-Size="Medium" Text="後台管理頁檔名：">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txt_admin_url" runat="server" Font-Size="Medium" Theme="Office2003Olive" Width="300px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Size="Medium" Text="前台首頁檔名：">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txt_home_url" runat="server" Font-Size="Medium" Theme="Office2003Olive" Width="300px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Font-Size="Medium" Text="連線字串名稱：">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txt_conn_name" runat="server" Font-Size="Medium" Theme="Office2003Olive" Width="300px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel14" runat="server" Font-Size="Medium" Text="語系清單：">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txt_languages" runat="server" Font-Size="Medium" Theme="Office2003Olive" Width="300px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Font-Size="Medium" Text="系統預設語系：">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxComboBox ID="cbb_language" runat="server" EnableTheming="True" Font-Size="Medium" SelectedIndex="0" Theme="Office2003Olive" Width="300px">
                                        <Items>
                                            <dx:ListEditItem Selected="True" Text="繁體中文" Value="zh-TW" />
                                            <dx:ListEditItem Text="简体中文" Value="zh-CN" />
                                            <dx:ListEditItem Text="English" Value="en-US" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" Font-Size="Medium" Text="字型大小：">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxComboBox ID="cbb_font_size" runat="server" EnableTheming="True" Font-Size="Medium" SelectedIndex="0" Theme="Office2003Olive" Width="300px">
                                        <Items>
                                            <dx:ListEditItem Text="大" Value="L" />
                                            <dx:ListEditItem Selected="True" Text="中" Value="M" />
                                            <dx:ListEditItem Text="小" Value="S" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <dx:ASPxButton ID="btn_app_update" runat="server" Font-Size="Medium" Text="修改存檔" Theme="Office2003Olive" OnClick="btn_app_update_Click">
                        </dx:ASPxButton>
                    </div>
                    <hr />
                    <div style="height: 20px"></div>
                    <div>
                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Maroon" Text="應用程式圖片上傳">
                        </dx:ASPxLabel>
                    </div>
                    <hr />
                    <div>
                        <table>
                            <tr>
                                <td style="vertical-align: top; text-align: left">
                                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Font-Size="Medium" Text="背景圖片：">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="vertical-align: top; text-align: left">
                                    <dx:ASPxButton ID="btn_background" runat="server" Font-Size="Medium" Text="上傳" Theme="Office2003Olive" OnClick="btn_background_Click">
                                    </dx:ASPxButton>
                                </td>
                                <td style="vertical-align: top; text-align: left">
                                    <asp:Image ID="img_background" runat="server" ImageUrl="~/Images/Apps/background.png" />
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top; text-align: left">
                                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Font-Size="Medium" Text="登入圖片：">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="vertical-align: top; text-align: left">
                                    <dx:ASPxButton ID="btn_login" runat="server" Font-Size="Medium" Text="上傳" Theme="Office2003Olive" OnClick="btn_login_Click">
                                    </dx:ASPxButton>
                                </td>
                                <td style="vertical-align: top; text-align: left">
                                    <asp:Image ID="img_login" runat="server" ImageUrl="~/Images/Apps/logo_login.png" />
                                </td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top; text-align: left">
                                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Font-Size="Medium" Text="首頁圖片：">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="vertical-align: top; text-align: left">
                                    <dx:ASPxButton ID="btn_logo" runat="server" Font-Size="Medium" Text="上傳" Theme="Office2003Olive" OnClick="btn_logo_Click">
                                    </dx:ASPxButton>
                                </td>
                                <td style="vertical-align: top; text-align: left">
                                    <asp:Image ID="img_logo" runat="server" ImageUrl="~/Images/Apps/logo_home.png" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <hr />
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
        <div>
            <dx:ASPxPopupControl ID="puc_upload" runat="server" Theme="Office2003Olive" Width="600px" HeaderText="上傳圖片" OnInit="puc_upload_Init">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <div>
                            <dx:ASPxButton ID="btn_upload_close" runat="server" Font-Size="Medium" OnClick="btn_upload_close_Click" Text="關閉視窗" Theme="Office2003Olive">
                            </dx:ASPxButton>
                        </div>
                        <hr />
                        <div>
                            <dx:ASPxUploadControl ID="ulc_upload" runat="server" UploadMode="Auto"
                                ShowProgressPanel="True" ShowUploadButton="True" EnableTheming="True" Theme="Office2003Olive" Width="100%" Font-Size="Medium" OnFileUploadComplete="ulc_upload_FileUploadComplete">
                                <AdvancedModeSettings EnableMultiSelect="True" EnableFileList="True" EnableDragAndDrop="True" />
                                <ValidationSettings MaxFileSize="4194304" AllowedFileExtensions=".png" />
                            </dx:ASPxUploadControl>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
    </div>
</asp:Content>
