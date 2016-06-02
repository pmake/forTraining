using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;

namespace webapp.Forms.zzz
{
    public partial class zzzp002_scheduler : ezPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxRoundPanel1_Init(object sender, EventArgs e)
        {
            ezASPxRoundPanel.Init(sender, e , true);
        }

        protected void ASPxScheduler1_Init(object sender, EventArgs e)
        {
            ezASPxScheduler.Init(sender, e, true);
        }

        protected void ASPxScheduler1_AppointmentFormShowing(object sender, DevExpress.Web.ASPxScheduler.AppointmentFormEventArgs e)
        {
            ezASPxScheduler.AppointmentFormShowing(sender, e);
        }

        protected void ASPxScheduler1_GotoDateFormShowing(object sender, DevExpress.Web.ASPxScheduler.GotoDateFormEventArgs e)
        {
            ezASPxScheduler.GotoDateFormShowing(sender, e);
        }

        protected void ASPxScheduler1_PopupMenuShowing(object sender, DevExpress.Web.ASPxScheduler.PopupMenuShowingEventArgs e)
        {
            ezASPxScheduler.PopupMenuShowing(sender, e);
        }
    }
}