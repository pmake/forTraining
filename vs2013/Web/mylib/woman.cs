using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace mylib
{
    /// <summary>
    /// 女性類別
    /// </summary>
    public class woman : person
    {
        public woman()//constructor
        {
            name = "Anna";
            gender = "F";
            height = 170;
            weight = 50;
        }
        public override string eat (){return "cake";}
    }
}