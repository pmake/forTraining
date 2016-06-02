<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zzzp002_scheduler.aspx.cs" Inherits="webapp.Forms.zzz.zzzp002_scheduler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="true" Width="100%" OnInit="ASPxRoundPanel1_Init" Theme="BlackGlass">
                <PanelCollection>
<dx:PanelContent runat="server">
    <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" ActiveViewType="Month" AppointmentDataSourceID="sds_calendar" ClientIDMode="AutoID" OnAppointmentFormShowing="ASPxScheduler1_AppointmentFormShowing" OnGotoDateFormShowing="ASPxScheduler1_GotoDateFormShowing" OnInit="ASPxScheduler1_Init" OnPopupMenuShowing="ASPxScheduler1_PopupMenuShowing" ResourceDataSourceID="sds_resources" Start="2016-05-16" Theme="Moderno" Width="100%">
        <Storage>
            <Appointments AutoRetrieveId="True">
                <Mappings AllDay="AllDay" AppointmentId="ID" Description="Description" End="EndTime" Label="Label" Location="Location" RecurrenceInfo="RecurrenceInfo" ReminderInfo="ReminderInfo" ResourceId="ResourceID" Start="StartTime" Status="Status" Subject="Subject" Type="EventType" />
            </Appointments>
            <Resources>
                <Mappings Caption="Caption" Color="Color" Image="Image" ResourceId="ResourceID" />
            </Resources>
        </Storage>
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
                    </dx:PanelContent>
</PanelCollection>
            </dx:ASPxRoundPanel>
        </div>
        <div>
            <asp:SqlDataSource ID="sds_calendar" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [calendar] WHERE [ID] = @ID" InsertCommand="INSERT INTO [calendar] ([ResourceID], [Status], [Subject], [Description], [Label], [StartTime], [EndTime], [Location], [AllDay], [EventType], [RecurrenceInfo], [ReminderInfo]) VALUES (@ResourceID, @Status, @Subject, @Description, @Label, @StartTime, @EndTime, @Location, @AllDay, @EventType, @RecurrenceInfo, @ReminderInfo)" SelectCommand="SELECT ID, ResourceID, Status, Subject, Description, Label, StartTime, EndTime, Location, AllDay, EventType, RecurrenceInfo, ReminderInfo FROM calendar" UpdateCommand="UPDATE [calendar] SET [ResourceID] = @ResourceID, [Status] = @Status, [Subject] = @Subject, [Description] = @Description, [Label] = @Label, [StartTime] = @StartTime, [EndTime] = @EndTime, [Location] = @Location, [AllDay] = @AllDay, [EventType] = @EventType, [RecurrenceInfo] = @RecurrenceInfo, [ReminderInfo] = @ReminderInfo WHERE [ID] = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ResourceID" Type="Int32" />
                    <asp:Parameter Name="Status" Type="Int32" />
                    <asp:Parameter Name="Subject" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Label" Type="Int32" />
                    <asp:Parameter Name="StartTime" Type="DateTime" />
                    <asp:Parameter Name="EndTime" Type="DateTime" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="AllDay" Type="Boolean" />
                    <asp:Parameter Name="EventType" Type="Int32" />
                    <asp:Parameter Name="RecurrenceInfo" Type="String" />
                    <asp:Parameter Name="ReminderInfo" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ResourceID" Type="Int32" />
                    <asp:Parameter Name="Status" Type="Int32" />
                    <asp:Parameter Name="Subject" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="Label" Type="Int32" />
                    <asp:Parameter Name="StartTime" Type="DateTime" />
                    <asp:Parameter Name="EndTime" Type="DateTime" />
                    <asp:Parameter Name="Location" Type="String" />
                    <asp:Parameter Name="AllDay" Type="Boolean" />
                    <asp:Parameter Name="EventType" Type="Int32" />
                    <asp:Parameter Name="RecurrenceInfo" Type="String" />
                    <asp:Parameter Name="ReminderInfo" Type="String" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_resources" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [resources] WHERE [ResourceID] = @ResourceID" InsertCommand="INSERT INTO [resources] ([Caption], [Color], [Image]) VALUES (@Caption, @Color, @Image)" SelectCommand="SELECT ResourceID, Caption, Color, Image FROM resources ORDER BY Caption" UpdateCommand="UPDATE [resources] SET [Caption] = @Caption, [Color] = @Color, [Image] = @Image WHERE [ResourceID] = @ResourceID">
                <DeleteParameters>
                    <asp:Parameter Name="ResourceID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Caption" Type="String" />
                    <asp:Parameter Name="Color" Type="String" />
                    <asp:Parameter Name="Image" Type="Object" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Caption" Type="String" />
                    <asp:Parameter Name="Color" Type="String" />
                    <asp:Parameter Name="Image" Type="Object" />
                    <asp:Parameter Name="ResourceID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
