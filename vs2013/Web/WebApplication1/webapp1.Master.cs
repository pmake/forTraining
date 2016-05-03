using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace WebApplication1
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) set_User();
        }
        private void set_User()
        {
            lbl_username.Text = "使用者:" + Session["UserName"].ToString();
            lbl_copyright.Text = WebConfigurationManager.AppSettings["copyright"];
            lbl_address.Text = WebConfigurationManager.AppSettings["address"];
            lbl_contact.Text = WebConfigurationManager.AppSettings["contact"];
            lbl_display.Text = WebConfigurationManager.AppSettings["display"];
        }
    }
}