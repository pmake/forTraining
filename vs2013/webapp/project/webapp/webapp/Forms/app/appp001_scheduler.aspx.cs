using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ezapp;

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
            ezASPxScheduler.Init(sender, e);
        }

        protected void scd_user_Init(object sender, EventArgs e)
        {
            ezASPxScheduler.Init(sender, e);
        }
    }
}