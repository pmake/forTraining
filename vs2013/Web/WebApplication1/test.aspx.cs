using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using mylib;

namespace WebApplication1
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_man_Click(object sender, EventArgs e)
        {
            man man1 = new man("Ken");
         
            lbl_man.Text = "Hi my name is " + man1.name + " 身高: " + man1.height + " 體重: " + man1.weight + " 喜歡的食物: " + man1.eat();
        }
        protected void btn_woman_Click(object sender, EventArgs e)
        {
            woman Anna = new woman();
            lbl_woman.Text = "Hi my name is " + Anna.name + " 身高: " + Anna.height + " 體重: " + Anna.weight + " 喜歡的食物: " + Anna.eat();
        }
    }
}