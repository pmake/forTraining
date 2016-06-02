<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="webapp.Forms.app.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxSplitter ID="ASPxSplitter1" runat="server" EnableTheming="True" Orientation="Vertical" Theme="BlackGlass" FullscreenMode="True" Height="100%" Width="100%">
                <Panes>
                    <dx:SplitterPane AllowResize="False" ShowCollapseBackwardButton="True" ShowCollapseForwardButton="False" ShowSeparatorImage="False" Size="60px">
                        <PaneStyle>
                            <Paddings Padding="0px" />
                            <BackgroundImage ImageUrl="~/Images/Apps/banner_home.png" Repeat="RepeatX" />
                        </PaneStyle>
                        <ContentCollection>
                            <dx:SplitterContentControl runat="server">
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 34px; vertical-align: middle; text-align: center;">
                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Apps/logo_home.png" />
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Label ID="lbl_app_name" runat="server" Font-Names="微軟正黑體" Font-Size="XX-Large" ForeColor="White"></asp:Label>
                                        </td>
                                        <td style="width: 150px; text-align: right; vertical-align: middle;">
                                            <asp:Label ID="lbl_user" runat="server" Font-Size="Medium" ForeColor="Yellow"></asp:Label>
                                        </td>
                                        <td style="width: 34px">
                                            <asp:ImageButton ID="imb_scheduler" runat="server" ImageUrl="~/Images/Icons/Calendar32.png" ToolTip="行事曆" OnClick="imb_scheduler_Click" />
                                        </td>
                                        <td style="width: 34px">
                                            <asp:ImageButton ID="imb_password" runat="server" ImageUrl="~/Images/Icons/Password32.png" PostBackUrl="~/home.aspx" ToolTip="重設密碼" OnClick="imb_password_Click" />
                                        </td>
                                        <td style="width: 34px">
                                            <asp:ImageButton ID="imb_home" runat="server" ImageUrl="~/Images/Icons/home32.png" PostBackUrl="~/home.aspx" ToolTip="返回首頁" />
                                        </td>
                                        <td style="width: 34px">
                                            <asp:ImageButton ID="imb_logout" runat="server" ImageUrl="~/Images/Icons/logout32.png" ToolTip="登出系統" OnClick="imb_logout_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                    <dx:SplitterPane Size="100%">
                        <Panes>
                            <dx:SplitterPane MaxSize="400px" ShowCollapseBackwardButton="True" ShowCollapseForwardButton="False" Size="250px">
                                <PaneStyle>
                                    <Paddings Padding="0px" />
                                    <BackgroundImage ImageUrl="~/Images/Apps/background.png" />
                                </PaneStyle>
                                <ContentCollection>
                                    <dx:SplitterContentControl runat="server">
                                        <dx:ASPxNavBar ID="nvb_prg" runat="server" Theme="BlackGlass" AutoCollapse="True" Width="100%" OnItemClick="nvb_prg_ItemClick">
                                            <GroupHeaderStyle Font-Size="Medium">
                                            </GroupHeaderStyle>
                                            <ItemStyle Font-Size="Small" />
                                        </dx:ASPxNavBar>
                                    </dx:SplitterContentControl>
                                </ContentCollection>
                            </dx:SplitterPane>
                            <dx:SplitterPane Size="100%" ScrollBars="Auto">
                                <PaneStyle>
                                    <Paddings Padding="0px" />
                                    <BackgroundImage ImageUrl="~/Images/Apps/background.png" />
                                </PaneStyle>
                                <ContentCollection>
                                    <dx:SplitterContentControl runat="server">
                                    </dx:SplitterContentControl>
                                </ContentCollection>
                            </dx:SplitterPane>
                        </Panes>
                        <ContentCollection>
                            <dx:SplitterContentControl runat="server"></dx:SplitterContentControl>
                        </ContentCollection>
                    </dx:SplitterPane>
                </Panes>
            </dx:ASPxSplitter>
        </div>
        <div>
            <dx:ASPxPopupControl ID="puc_password" runat="server" OnInit="puc_password_Init" Theme="BlackGlass" Width="400px" HeaderText="使用者密碼變更">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <div>
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 100px">
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="新的密碼：" Font-Size="Medium">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txt_password1" runat="server" Width="100%" Font-Size="Medium" Password="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px">
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="再輸一次：" Font-Size="Medium">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td>
                                        <dx:ASPxTextBox ID="txt_password2" runat="server" Width="100%" Font-Size="Medium" Password="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <hr />
                        <div>
                            <dx:ASPxLabel ID="lbl_password_message" runat="server" Font-Size="Medium" ForeColor="Red">
                            </dx:ASPxLabel>
                        </div>
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btn_password_confirm" runat="server" Font-Size="Medium" OnClick="btn_password_confirm_Click" Text="確定變更" Theme="BlackGlass">
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btn_password_cancel" runat="server" Font-Size="Medium" OnClick="btn_password_cancel_Click" Text="關閉視窗" Theme="BlackGlass">
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
        <div>
            <asp:SqlDataSource ID="sds_z_sys_module" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT no_module, name_module FROM z_sys_module WHERE (isenabled = @isenabled) ORDER BY sort_module, no_module">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="isenabled" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_z_sys_prg" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT [no_prg], [name_prg], [ispublic] FROM [z_sys_prg] WHERE (([module_no] = @module_no) AND ([isenabled] = @isenabled) AND ([isvisible] = @isvisible)) ORDER BY [sort_prg], [no_prg]">
                <SelectParameters>
                    <asp:Parameter Name="module_no" Type="String" />
                    <asp:Parameter DefaultValue="1" Name="isenabled" Type="Int32" />
                    <asp:Parameter DefaultValue="1" Name="isvisible" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_user_group_security" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" SelectCommand="SELECT z_org_user_group.role_no AS user_role, z_org_user_group.user_no, z_sys_security.code_no, z_sys_security.role_no, z_org_user_group.isenabled, z_sys_security.prg_no FROM z_sys_security INNER JOIN z_org_user_group ON z_sys_security.user_no = z_org_user_group.group_no WHERE (z_sys_security.code_no = @code_no) AND (z_sys_security.role_no = @role_no) AND (z_org_user_group.role_no = @user_role) AND (z_org_user_group.user_no = @user_no) AND (z_org_user_group.isenabled = @isenabled) AND (z_sys_security.prg_no = @prg_no)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="G" Name="code_no" />
                    <asp:Parameter DefaultValue="Group" Name="role_no" />
                    <asp:Parameter DefaultValue="User" Name="user_role" />
                    <asp:Parameter DefaultValue="001" Name="user_no" />
                    <asp:Parameter DefaultValue="1" Name="isenabled" />
                    <asp:Parameter DefaultValue="BASP001" Name="prg_no" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
