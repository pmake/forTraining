<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="scheduler_company.aspx.cs" Inherits="webmall.forms.app.scheduler_company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <dx:ASPxRoundPanel ID="rpl_master" runat="server" OnInit="rpl_master_Init" ShowCollapseButton="true" Theme="BlackGlass" Width="100%">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <dx:ASPxPageControl ID="pgc_master" runat="server" ActiveTabIndex="0" OnInit="pgc_master_Init" Theme="BlackGlass" Width="100%">
                        <TabPages>
                            <dx:TabPage Text="個人行事曆">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dxwschs:ASPxScheduler ID="scd_user" runat="server" ActiveViewType="Month" ClientIDMode="AutoID" OnInit="scd_user_Init" Start="2016-05-08" Theme="Aqua" Font-Size="Small" AppointmentDataSourceID="sds_z_sys_appointments_user" ResourceDataSourceID="sds_z_sys_resources_user" OnPopupMenuShowing="scd_user_PopupMenuShowing" OnAppointmentFormShowing="scd_user_AppointmentFormShowing" OnGotoDateFormShowing="scd_user_GotoDateFormShowing">
                                            <Storage>
                                                <Appointments AutoRetrieveId="True">
                                                    <Mappings AllDay="AllDay" AppointmentId="UniqueID" Description="Description" End="EndDate" Label="Label" Location="Location" RecurrenceInfo="RecurrenceInfo" ReminderInfo="ReminderInfo" ResourceId="ResourceID" Start="StartDate" Status="Status" Subject="Subject" Type="Type" />
                                                </Appointments>
                                                <Resources>
                                                    <Mappings Caption="ResourceName" Color="Color" Image="Image" ResourceId="UniqueID" />
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
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="公司行事曆">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <dxwschs:ASPxScheduler ID="scd_company" runat="server" ActiveViewType="Month" ClientIDMode="AutoID" OnInit="scd_company_Init" Start="2016-05-08" Theme="Aqua" AppointmentDataSourceID="sds_z_sys_appointments_company" ResourceDataSourceID="sds_z_sys_resources_comp" OnPopupMenuShowing="scd_company_PopupMenuShowing" OnAppointmentFormShowing="scd_company_AppointmentFormShowing" OnGotoDateFormShowing="scd_company_GotoDateFormShowing">
                                            <Storage>
                                                <Appointments AutoRetrieveId="True">
                                                    <Mappings AllDay="AllDay" AppointmentId="UniqueID" Description="Description" End="EndDate" Label="Label" Location="Location" RecurrenceInfo="RecurrenceInfo" ReminderInfo="ReminderInfo" ResourceId="ResourceID" Start="StartDate" Status="Status" Subject="Subject" Type="Type" />
                                                </Appointments>
                                                <Resources>
                                                    <Mappings Caption="ResourceName" Color="Color" Image="Image" ResourceId="UniqueID" />
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
        <asp:SqlDataSource ID="sds_z_sys_appointments_user" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_sys_appointments] WHERE [UniqueID] = @UniqueID" InsertCommand="INSERT INTO [z_sys_appointments] ([Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField1], [TypeNo], [TargetNo]) VALUES (@Type, @StartDate, @EndDate, @AllDay, @Subject, @Location, @Description, @Status, @Label, @ResourceID, @ResourceIDs, @ReminderInfo, @RecurrenceInfo, @CustomField1, @TypeNo, @TargetNo)" SelectCommand="SELECT UniqueID, Type, StartDate, EndDate, AllDay, Subject, Location, Description, Status, Label, ResourceID, ResourceIDs, ReminderInfo, RecurrenceInfo, CustomField1, TypeNo, TargetNo FROM z_sys_appointments WHERE (TypeNo = @TypeNo) AND (TargetNo = @TargetNo)" UpdateCommand="UPDATE z_sys_appointments SET Type = @Type, StartDate = @StartDate, EndDate = @EndDate, AllDay = @AllDay, Subject = @Subject, Location = @Location, Description = @Description, Status = @Status, Label = @Label, ResourceID = @ResourceID, ResourceIDs = @ResourceIDs, ReminderInfo = @ReminderInfo, RecurrenceInfo = @RecurrenceInfo, CustomField1 = @CustomField1 WHERE (UniqueID = @UniqueID)">
            <DeleteParameters>
                <asp:Parameter Name="UniqueID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Type" Type="Int32" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="AllDay" Type="Boolean" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Status" Type="Int32" />
                <asp:Parameter Name="Label" Type="Int32" />
                <asp:Parameter Name="ResourceID" Type="Int32" />
                <asp:Parameter Name="ResourceIDs" Type="String" />
                <asp:Parameter Name="ReminderInfo" Type="String" />
                <asp:Parameter Name="RecurrenceInfo" Type="String" />
                <asp:Parameter Name="CustomField1" Type="String" />
                <asp:Parameter DefaultValue="user" Name="TypeNo" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="TargetNo" SessionField="UserNo" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="user" Name="TypeNo" Type="String" />
                <asp:SessionParameter Name="TargetNo" SessionField="UserNo" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Type" Type="Int32" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="AllDay" Type="Boolean" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Status" Type="Int32" />
                <asp:Parameter Name="Label" Type="Int32" />
                <asp:Parameter Name="ResourceID" Type="Int32" />
                <asp:Parameter Name="ResourceIDs" Type="String" />
                <asp:Parameter Name="ReminderInfo" Type="String" />
                <asp:Parameter Name="RecurrenceInfo" Type="String" />
                <asp:Parameter Name="CustomField1" Type="String" />
                <asp:Parameter Name="UniqueID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_z_sys_appointments_company" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_sys_appointments] WHERE [UniqueID] = @UniqueID" InsertCommand="INSERT INTO [z_sys_appointments] ([Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField1], [TypeNo], [TargetNo]) VALUES (@Type, @StartDate, @EndDate, @AllDay, @Subject, @Location, @Description, @Status, @Label, @ResourceID, @ResourceIDs, @ReminderInfo, @RecurrenceInfo, @CustomField1, @TypeNo, @TargetNo)" SelectCommand="SELECT UniqueID, Type, StartDate, EndDate, AllDay, Subject, Location, Description, Status, Label, ResourceID, ResourceIDs, ReminderInfo, RecurrenceInfo, CustomField1, TypeNo, TargetNo FROM z_sys_appointments WHERE (TypeNo = @TypeNo)" UpdateCommand="UPDATE z_sys_appointments SET Type = @Type, StartDate = @StartDate, EndDate = @EndDate, AllDay = @AllDay, Subject = @Subject, Location = @Location, Description = @Description, Status = @Status, Label = @Label, ResourceID = @ResourceID, ResourceIDs = @ResourceIDs, ReminderInfo = @ReminderInfo, RecurrenceInfo = @RecurrenceInfo, CustomField1 = @CustomField1 WHERE (UniqueID = @UniqueID)">
            <DeleteParameters>
                <asp:Parameter Name="UniqueID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Type" Type="Int32" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="AllDay" Type="Boolean" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Status" Type="Int32" />
                <asp:Parameter Name="Label" Type="Int32" />
                <asp:Parameter Name="ResourceID" Type="Int32" />
                <asp:Parameter Name="ResourceIDs" Type="String" />
                <asp:Parameter Name="ReminderInfo" Type="String" />
                <asp:Parameter Name="RecurrenceInfo" Type="String" />
                <asp:Parameter Name="CustomField1" Type="String" />
                <asp:Parameter DefaultValue="comp" Name="TypeNo" Type="String" />
                <asp:Parameter Name="TargetNo" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="comp" Name="TypeNo" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Type" Type="Int32" />
                <asp:Parameter Name="StartDate" Type="DateTime" />
                <asp:Parameter Name="EndDate" Type="DateTime" />
                <asp:Parameter Name="AllDay" Type="Boolean" />
                <asp:Parameter Name="Subject" Type="String" />
                <asp:Parameter Name="Location" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Status" Type="Int32" />
                <asp:Parameter Name="Label" Type="Int32" />
                <asp:Parameter Name="ResourceID" Type="Int32" />
                <asp:Parameter Name="ResourceIDs" Type="String" />
                <asp:Parameter Name="ReminderInfo" Type="String" />
                <asp:Parameter Name="RecurrenceInfo" Type="String" />
                <asp:Parameter Name="CustomField1" Type="String" />
                <asp:Parameter Name="UniqueID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_z_sys_resources_user" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_sys_resources] WHERE [UniqueID] = @UniqueID" InsertCommand="INSERT INTO [z_sys_resources] ([ResourceID], [ResourceNo], [ResourceName], [Color], [Image], [CustomField1], [remark], [TypeNo], [TargetNo]) VALUES (@ResourceID, @ResourceNo, @ResourceName, @Color, @Image, @CustomField1, @remark, @TypeNo, @TargetNo)" SelectCommand="SELECT UniqueID, ResourceID, ResourceNo, ResourceName, Color, Image, CustomField1, remark, TypeNo, TargetNo FROM z_sys_resources WHERE (TypeNo = @TypeNo) AND (TargetNo = @TargetNo) ORDER BY ResourceNo, ResourceName" UpdateCommand="UPDATE z_sys_resources SET ResourceID = @ResourceID, ResourceNo = @ResourceNo, ResourceName = @ResourceName, Color = @Color, Image = @Image, CustomField1 = @CustomField1, remark = @remark WHERE (UniqueID = @UniqueID)">
            <DeleteParameters>
                <asp:Parameter Name="UniqueID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ResourceID" Type="Int32" />
                <asp:Parameter Name="ResourceNo" Type="String" />
                <asp:Parameter Name="ResourceName" Type="String" />
                <asp:Parameter Name="Color" Type="Int32" />
                <asp:Parameter Name="Image" Type="Object" />
                <asp:Parameter Name="CustomField1" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter DefaultValue="user" Name="TypeNo" Type="String" />
                <asp:SessionParameter DefaultValue="" Name="TargetNo" SessionField="UserNo" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="user" Name="TypeNo" Type="String" />
                <asp:SessionParameter Name="TargetNo" SessionField="UserNo" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ResourceID" Type="Int32" />
                <asp:Parameter Name="ResourceNo" Type="String" />
                <asp:Parameter Name="ResourceName" Type="String" />
                <asp:Parameter Name="Color" Type="Int32" />
                <asp:Parameter Name="Image" Type="Object" />
                <asp:Parameter Name="CustomField1" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter Name="UniqueID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sds_z_sys_resources_comp" runat="server" ConnectionString="<%$ ConnectionStrings:dbconn %>" DeleteCommand="DELETE FROM [z_sys_resources] WHERE [UniqueID] = @UniqueID" InsertCommand="INSERT INTO [z_sys_resources] ([ResourceID], [ResourceNo], [ResourceName], [Color], [Image], [CustomField1], [remark], [TypeNo], [TargetNo]) VALUES (@ResourceID, @ResourceNo, @ResourceName, @Color, @Image, @CustomField1, @remark, @TypeNo, @TargetNo)" SelectCommand="SELECT UniqueID, ResourceID, ResourceNo, ResourceName, Color, Image, CustomField1, remark, TypeNo, TargetNo FROM z_sys_resources WHERE (TypeNo = @TypeNo) ORDER BY ResourceNo, ResourceName" UpdateCommand="UPDATE z_sys_resources SET ResourceID = @ResourceID, ResourceNo = @ResourceNo, ResourceName = @ResourceName, Color = @Color, Image = @Image, CustomField1 = @CustomField1, remark = @remark WHERE (UniqueID = @UniqueID)">
            <DeleteParameters>
                <asp:Parameter Name="UniqueID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ResourceID" Type="Int32" />
                <asp:Parameter Name="ResourceNo" Type="String" />
                <asp:Parameter Name="ResourceName" Type="String" />
                <asp:Parameter Name="Color" Type="Int32" />
                <asp:Parameter Name="Image" Type="Object" />
                <asp:Parameter Name="CustomField1" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter DefaultValue="comp" Name="TypeNo" Type="String" />
                <asp:Parameter Name="TargetNo" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="comp" Name="TypeNo" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ResourceID" Type="Int32" />
                <asp:Parameter Name="ResourceNo" Type="String" />
                <asp:Parameter Name="ResourceName" Type="String" />
                <asp:Parameter Name="Color" Type="Int32" />
                <asp:Parameter Name="Image" Type="Object" />
                <asp:Parameter Name="CustomField1" Type="String" />
                <asp:Parameter Name="remark" Type="String" />
                <asp:Parameter Name="UniqueID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
