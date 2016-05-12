<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="appp001_scheduler.aspx.cs" Inherits="webapp.Forms.app.appp001_scheduler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxRoundPanel ID="rpl_master" runat="server" OnInit="rpl_master_Init" ShowCollapseButton="true" Theme="BlackGlass" Width="100%">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <dx:ASPxPageControl ID="pgc_master" runat="server" ActiveTabIndex="0" OnInit="pgc_master_Init" Theme="BlackGlass" Width="100%">
                            <TabPages>
                                <dx:TabPage Text="個人行事曆">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                            <dxwschs:ASPxScheduler ID="scd_user" runat="server" ActiveViewType="Month" ClientIDMode="AutoID" OnInit="scd_user_Init" Start="2016-05-08" Theme="Aqua" Font-Size="Small">
                                                <Views>
                                                    <DayView>
                                                        <TimeRulers>
                                                            <cc1:TimeRuler />
                                                        </TimeRulers>
                                                    </DayView>
                                                    <WorkWeekView>
                                                        <TimeRulers>
                                                            <cc1:TimeRuler />
                                                        </TimeRulers>
                                                    </WorkWeekView>
                                                    <WeekView Enabled="False">
                                                    </WeekView>
                                                    <FullWeekView Enabled="True">
                                                        <TimeRulers>
                                                            <cc1:TimeRuler />
                                                        </TimeRulers>
                                                    </FullWeekView>
                                                </Views>
                                            </dxwschs:ASPxScheduler>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="公司行事曆">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server">
                                            <dxwschs:ASPxScheduler ID="scd_company" runat="server" ActiveViewType="Month" ClientIDMode="AutoID" OnInit="scd_company_Init" Start="2016-05-08">
                                                <Views>
                                                    <DayView>
                                                        <TimeRulers>
                                                            <cc1:TimeRuler />
                                                        </TimeRulers>
                                                    </DayView>
                                                    <WorkWeekView>
                                                        <TimeRulers>
                                                            <cc1:TimeRuler />
                                                        </TimeRulers>
                                                    </WorkWeekView>
                                                    <WeekView Enabled="False">
                                                    </WeekView>
                                                    <FullWeekView Enabled="True">
                                                        <TimeRulers>
                                                            <cc1:TimeRuler />
                                                        </TimeRulers>
                                                    </FullWeekView>
                                                </Views>
                                            </dxwschs:ASPxScheduler>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                        </dx:ASPxPageControl>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </div>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
