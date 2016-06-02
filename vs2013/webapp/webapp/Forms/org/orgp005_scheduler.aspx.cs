using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;

namespace webapp.Forms.org
{
    public partial class orgp005_scheduler : ezPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rpl_master_Init(object sender, EventArgs e)
        {
            ezASPxRoundPanel.Init(sender, e, true);
        }

        protected void sds_z_sys_appointments_company_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void sds_z_sys_resources_comp_Init(object sender, EventArgs e)
        {
            ezSqlDataSource.Init(sender, e);
        }

        protected void scd_company_Init(object sender, EventArgs e)
        {
            ezASPxScheduler.Init(sender, e, false);
        }

        protected void scd_company_PopupMenuShowing(object sender, DevExpress.Web.ASPxScheduler.PopupMenuShowingEventArgs e)
        {
            ezASPxScheduler.PopupMenuShowing(sender, e);
        }

        protected void scd_company_AppointmentFormShowing(object sender, DevExpress.Web.ASPxScheduler.AppointmentFormEventArgs e)
        {
            ezASPxScheduler.AppointmentFormShowing(sender, e);
        }

        protected void scd_company_GotoDateFormShowing(object sender, DevExpress.Web.ASPxScheduler.GotoDateFormEventArgs e)
        {
            ezASPxScheduler.GotoDateFormShowing(sender, e);
        }
    }
}