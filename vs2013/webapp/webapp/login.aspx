<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="webapp.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body style="background-image: url('Images/Apps/background.png')">
    <form id="form1" runat="server">
        <div style="height: 80px"></div>
        <div>
            <div style="margin: auto; width: 400px">
                <dx:ASPxRoundPanel ID="rpl_master" runat="server" Width="100%" OnInit="rpl_master_Init" Theme="BlackGlass">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <table style="width: 100%">
                                <tr>
                                    <td>
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Apps/logo_login.png" Width="100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 100px">
                                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="Medium" Text="登入帳號">
                                                    </dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txt_user_no" runat="server" Font-Size="Medium" Width="100%" ToolTip="登入帳號不可空白!!">
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td style="width: 10px">
                                                    <asp:RequiredFieldValidator ID="rfv_user_no" runat="server" ControlToValidate="txt_user_no" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 100px">
                                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="Medium" Text="登入密碼">
                                                    </dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxTextBox ID="txt_password" runat="server" Font-Size="Medium" Password="True" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td style="width: 10px">
                                                    <asp:RequiredFieldValidator ID="rfv_password" runat="server" ControlToValidate="txt_password" ErrorMessage="*" ForeColor="Red" ToolTip="登入密碼不可空白!!"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxCaptcha ID="cpc_code" runat="server" CharacterSet="1234567890" CodeLength="4" Font-Size="Medium" Theme="Aqua">
                                            <TextBoxStyle Font-Size="Medium" Width="200px" />
                                            <RefreshButton Visible="False">
                                            </RefreshButton>
                                            <ChallengeImage Width="140">
                                            </ChallengeImage>
                                        </dx:ASPxCaptcha>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btn_login" runat="server" Font-Size="Medium" Text="登入" Theme="BlackGlass" OnClick="btn_login_Click">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxRoundPanel>
            </div>
        </div>
        <div>
            <dx:ASPxPopupControl ID="puc_logerror" runat="server" AllowDragging="True" Modal="True" Theme="Aqua" Width="300px" HeaderText="輸入錯誤訊息" OnInit="puc_logerror_Init">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <div style="border: medium double #808080; width: 100%; background-color: #FFFFFF;">
                            <table style="width: 100%">
                                <tr>
                                    <td style="height: 20px"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="width: 100%">
                                            <tr>
                                                <td style="width: 20px"></td>
                                                <td style="width: 34px">
                                                    <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Apps/logo_home.png" />
                                                </td>
                                                <td style="text-align: center">
                                                    <asp:Label ID="lbl_app_name" runat="server" Font-Names="微軟正黑體" Font-Size="Medium" ForeColor="#996600"></asp:Label>
                                                </td>
                                                <td style="width: 20px"></td>
                                            </tr>
                                            <tr>
                                                <td style="height: 20px"></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="2">
                                                    <asp:Label ID="lbl_login_error_msg" runat="server" ForeColor="#FF3300"></asp:Label>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td style="height: 20px"></td>
                                </tr>
                            </table>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
    </form>
</body>
</html>
