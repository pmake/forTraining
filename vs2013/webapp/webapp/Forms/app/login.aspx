<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="webapp.Forms.app.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body style="background-image: url('../../Images/Apps/background.png')">
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
                                                    <dx:ASPxLabel ID="lbl_comp_no" runat="server" Font-Size="Medium" Text="登入公司">
                                                    </dx:ASPxLabel>
                                                </td>
                                                <td>
                                                    <dx:ASPxComboBox ID="cbb_comp_no" runat="server" Font-Size="Medium" Theme="Office2003Olive" Width="100%" DataSourceID="sds_z_org_company" TextField="name_comp" TextFormatString="{0}" ValueField="no_comp">
                                                        <Columns>
                                                            <dx:ListBoxColumn Caption="公司名稱" FieldName="name_comp" Name="name_comp" Width="100%" />
                                                            <dx:ListBoxColumn FieldName="no_comp" Visible="False" />
                                                        </Columns>
                                                    </dx:ASPxComboBox>
                                                    <dx:ASPxTextBox ID="txt_comp_no" runat="server" Font-Size="Medium" Width="100%" ToolTip="登入帳號不可空白!!" Theme="Office2003Olive">
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td style="width: 10px">
                                                    <asp:RequiredFieldValidator ID="rfv_comp_no_cbb" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="cbb_comp_no"></asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator ID="rfv_comp_no_txt" runat="server" ControlToValidate="txt_user_no" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
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
            <asp:SqlDataSource ID="sds_z_org_company" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT [name_comp], [no_comp] FROM [z_org_company] WHERE (([code_comp] = @code_comp) AND ([isenabled] = @isenabled)) ORDER BY [no_comp]">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="M" Name="code_comp" SessionField="CompCode" Type="String" />
                    <asp:Parameter DefaultValue="1" Name="isenabled" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
