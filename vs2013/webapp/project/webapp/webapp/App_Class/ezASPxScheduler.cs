using DevExpress.Web;
using DevExpress.Web.ASPxScheduler;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using DevExpress.XtraScheduler;

namespace ezapp
{
    /// <summary>
    /// ezASPxScheduler 自定公用功能類別
    /// </summary>
    public static class ezASPxScheduler
    {
        /// <summary>
        /// Init 自定預設設定值
        /// </summary>
        /// <param name="sender">sender</param>
        /// <param name="e">e</param>
        public static void Init(object sender, EventArgs e)
        {
            (sender as ASPxScheduler).Font.Size = FontUnit.Small;
            (sender as ASPxScheduler).Views.DayView.ShortDisplayName="日曆";
            (sender as ASPxScheduler).Views.WorkWeekView.ShortDisplayName="工作週";
            (sender as ASPxScheduler).Views.WeekView.ShortDisplayName="週曆";
            (sender as ASPxScheduler).Views.MonthView.ShortDisplayName="月曆";
            (sender as ASPxScheduler).Views.TimelineView.ShortDisplayName="時間軸";
            (sender as ASPxScheduler).Views.FullWeekView.ShortDisplayName="整週";
        }

        /// <summary>
        /// 設定行事曆約會行程是否唯讀狀態
        /// </summary>
        /// <param name="blnReadonly"></param>
        public static void SetReadOnly(object sender, EventArgs e, bool blnReadonly)
        {
            if (blnReadonly)
            {
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentCopy = UsedAppointmentType.None;
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentDelete = UsedAppointmentType.None;
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentCreate = UsedAppointmentType.None;
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentDrag = UsedAppointmentType.None;
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentDragBetweenResources = UsedAppointmentType.None;
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentEdit = UsedAppointmentType.None;
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentResize = UsedAppointmentType.None;
                (sender as ASPxScheduler).OptionsCustomization.AllowInplaceEditor = UsedAppointmentType.None;
                (sender as ASPxScheduler).OptionsCustomization.AllowDisplayAppointmentForm = AllowDisplayAppointmentForm.Never;
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentMultiSelect = false;
            }
            else
            {
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentCopy = UsedAppointmentType.All;
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentDelete = UsedAppointmentType.All;
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentCreate = UsedAppointmentType.All;
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentDrag = UsedAppointmentType.All;
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentDragBetweenResources = UsedAppointmentType.All;
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentEdit = UsedAppointmentType.All;
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentResize = UsedAppointmentType.All;
                (sender as ASPxScheduler).OptionsCustomization.AllowInplaceEditor = UsedAppointmentType.All;
                (sender as ASPxScheduler).OptionsCustomization.AllowDisplayAppointmentForm = AllowDisplayAppointmentForm.Auto;
                (sender as ASPxScheduler).OptionsCustomization.AllowAppointmentMultiSelect = true;
            }
        }

        public static void SetToday(object sender, EventArgs e)
        {
            (sender as ASPxScheduler).Start = DateTime.Today;
        }
    }
}