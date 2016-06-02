using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;
using DevExpress.Web;
using DevExpress.Web.ASPxScheduler;

namespace webapp.Forms.app
{
    public partial class appp001_scheduler : ezPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void pgc_master_Init(object sender, EventArgs e)
        {
            ezAspxPageControl.Init(sender, e);
        }

        protected void rpl_master_Init(object sender, EventArgs e)
        {
            ezASPxRoundPanel.Init(sender, e, true);
        }

        protected void scd_company_Init(object sender, EventArgs e)
        {
            ezASPxScheduler.Init(sender, e , false);
            ezASPxScheduler.SetReadOnly(sender, e, true);
        }

        protected void scd_user_Init(object sender, EventArgs e)
        {
            ezASPxScheduler.Init(sender, e , false);
        }

        protected void scd_user_PopupMenuShowing(object sender, DevExpress.Web.ASPxScheduler.PopupMenuShowingEventArgs e)
        {
            ezASPxScheduler.PopupMenuShowing(sender, e);
        }

        protected void scd_company_PopupMenuShowing(object sender, PopupMenuShowingEventArgs e)
        {
            ezASPxScheduler.PopupMenuShowing(sender, e);
        }

        protected void scd_user_AppointmentFormShowing(object sender, AppointmentFormEventArgs e)
        {
            ezASPxScheduler.AppointmentFormShowing(sender, e);
        }

        protected void scd_user_GotoDateFormShowing(object sender, GotoDateFormEventArgs e)
        {
            ezASPxScheduler.GotoDateFormShowing(sender, e);
        }

        protected void scd_company_AppointmentFormShowing(object sender, AppointmentFormEventArgs e)
        {
            ezASPxScheduler.AppointmentFormShowing(sender, e);
        }

        protected void scd_company_GotoDateFormShowing(object sender, GotoDateFormEventArgs e)
        {
            ezASPxScheduler.GotoDateFormShowing(sender, e);
        }
    }
}