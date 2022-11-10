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

        public int getUserByUsername(string username,string password, ref string err)
        {
            string sqlString = $"SELECT dbo.getMemberByUsername('{username}','{password}')";
            return Int32.Parse(db.ExcuteQueryScalar(sqlString, CommandType.Text,ref err));
        }

        public DataTable getAllMember()
        {
            string sqlString = "EXEC getAllMember";
            return db.ExecuteQueryDataSet(sqlString, CommandType.Text).Tables[0];
        }

        public bool login(string username, string password, ref string err)
        {
            int count = getUserByUsername(username,password, ref err);
            if (count !=0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool addMember(string name, int gender, int role, int team_id, string username, string password, int company_id,ref string err)
        {
            return db.MyExecuteNonQuery($"EXEC addMember '{name}',{gender},{role},{team_id},'{username}','{password}',{company_id}", CommandType.Text, ref err);
        }

        public bool updateMember(int id, string name, int gender, int role, int team_id, string username, string password, int company_id, ref string err)
        {
            return db.MyExecuteNonQuery($"EXEC updateMember {id},'{name}',{gender},{role},{team_id},'{username}','{password}',{company_id}", CommandType.Text, ref err);
        }

        public bool deleteMember(int id, ref string err)
        {
            return db.MyExecuteNonQuery($"EXEC deleteMember {id}", CommandType.Text, ref err);
        }
    }
}
