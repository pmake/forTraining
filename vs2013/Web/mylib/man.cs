using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace mylib
{
    /// <summary>
    /// 男性類別
    /// </summary>
    public class man : person//':'代表繼承
    {
        //多型特性允許相同名稱的多個建構函數或方法，限制為參數數量或形態不能完全相同
        public man()
        {
            //name = "Joy";
            gender = "M";
            height = 180;
            weight = 75;
        }
        public man(string _name)
        {
            name = _name;
            gender = "M";
            height = 180;
            weight = 75;
        }
        public man(string _name, string _gender)
        {
            name = _name;
            gender = _gender;
            height = 180;
            weight = 75;
        }
        public override string eat() {return "123";}
    }
}