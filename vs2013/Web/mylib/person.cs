using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace mylib
{
    /// <summary>
    /// 人類類別
    /// </summary>
    public abstract class person
    {
        private string givenName = "Archi";
        /// <summary>
        /// 姓名
        /// </summary>
        public string name
        { 
            get
            {
                return givenName;
            }
            set
            {
                givenName = value;
            }
        }
        /// <summary>
        /// 性別
        /// </summary>
        public string gender { get; set; }
        /// <summary>
        /// 身高
        /// </summary>
        public int height { get; set; }
        /// <summary>
        /// 體重
        /// </summary>
        public int weight { get; set; }
        /// <summary>
        /// 喜歡的食物
        /// </summary>
        public virtual string eat() 
        { 
            return ""; 
        }
    }
}