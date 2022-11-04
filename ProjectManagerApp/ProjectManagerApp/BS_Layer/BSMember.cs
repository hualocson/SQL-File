using ProjectManagerApp.DB_Layer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectManagerApp.BS_Layer
{
    internal class BSMember
    {
        DBMain db = null;
        public BSMember()
        {
            db = new DBMain();
        }

        public DataTable getUserByUsername(string username, ref string err)
        {
            string sqlString = $"Select * From getMemberByUsername ('{username}')";
            return db.ExecuteQueryDataSet(sqlString, CommandType.Text).Tables[0];
        }

        public DataTable getAllMember()
        {
            string sqlString = "Exec getAllMember";
            return db.ExecuteQueryDataSet(sqlString, CommandType.Text).Tables[0];
        }

        public bool login(string username, string password, ref string err)
        {
            DataTable user = getUserByUsername(username, ref err);
            if (user.Rows.Count == 0)
            {
                return false;
            }
            else
            {
                return (user.Rows[0][6].ToString().Equals(password));
            }
        }
    }
}
