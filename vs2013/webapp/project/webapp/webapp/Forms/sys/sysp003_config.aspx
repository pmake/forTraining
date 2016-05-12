<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sysp003_config.aspx.cs" Inherits="webapp.Forms.sys.sysp003_config" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxRoundPanel ID="rpl_master" runat="server" ShowCollapseButton="true" Theme="BlackGlass" Width="100%" OnInit="rpl_master_Init">
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
                                        <dx:ASPxTextBox ID="txt_app_name" runat="server" Font-Size="Medium" Theme="BlackGlass" Width="300px">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="Medium" Text="除錯模式：">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxCheckBox ID="cbx_debug_mode" runat="server" CheckState="Unchecked" Font-Size="Medium" Theme="BlackGlass">
                                        </dx:ASPxCheckBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="Medium" Text="登入頁檔名：">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txt_login_url" runat="server" Font-Size="Medium" Theme="BlackGlass" Width="300px">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Size="Medium" Text="首頁檔名：">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txt_home_url" runat="server" Font-Size="Medium" Theme="BlackGlass" Width="300px">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Font-Size="Medium" Text="連線字串名稱：">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txt_conn_name" runat="server" Font-Size="Medium" Theme="BlackGlass" Width="300px">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Font-Size="Medium" Text="系統語系：">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="cbb_language" runat="server" EnableTheming="True" Font-Size="Medium" SelectedIndex="0" Theme="BlackGlass" Width="300px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="繁體中文" Value="zh-TW" />
                                                <dx:ListEditItem Text="简体中文" Value="zh-CN" />
                                                <dx:ListEditItem Text="English" Value="en-US" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <dx:ASPxButton ID="btn_app_update" runat="server" Font-Size="Medium" Text="修改存檔" Theme="BlackGlass" OnClick="btn_app_update_Click">
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
                                        <dx:ASPxButton ID="btn_background" runat="server" Font-Size="Medium" Text="上傳" Theme="BlackGlass" OnClick="btn_background_Click">
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
                                        <dx:ASPxButton ID="btn_login" runat="server" Font-Size="Medium" Text="上傳" Theme="BlackGlass" OnClick="btn_login_Click">
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
                                        <dx:ASPxButton ID="btn_logo" runat="server" Font-Size="Medium" Text="上傳" Theme="BlackGlass" OnClick="btn_logo_Click">
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
                <dx:ASPxPopupControl ID="puc_upload" runat="server" Theme="BlackGlass" Width="600px" HeaderText="上傳圖片" OnInit="puc_upload_Init">
                    <ContentCollection>
                        <dx:PopupControlContentControl runat="server">
                            <div>
                                <dx:ASPxButton ID="btn_upload_close" runat="server" Font-Size="Medium" OnClick="btn_upload_close_Click" Text="關閉視窗" Theme="BlackGlass">
                                </dx:ASPxButton>
                            </div>
                            <hr />
                            <div>
                                <dx:ASPxUploadControl ID="ulc_upload" runat="server" UploadMode="Auto"
                                    ShowProgressPanel="True" ShowUploadButton="True" EnableTheming="True" Theme="BlackGlass" Width="100%" Font-Size="Medium" OnFileUploadComplete="ulc_upload_FileUploadComplete">
                                    <AdvancedModeSettings EnableMultiSelect="True" EnableFileList="True" EnableDragAndDrop="True" />
                                    <ValidationSettings MaxFileSize="4194304" AllowedFileExtensions=".png" />
                                </dx:ASPxUploadControl>
                            </div>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
            </div>
        </div>
    </form>
</body>
</html>
