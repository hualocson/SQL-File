using ProjectManagerApp.DB_Layer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectManagerApp.BS_Layer
{
    class BSTeam
    {
        DBMain db = null;
        public BSTeam()
        {
            db = new DBMain();
        }
        public DataTable getAllTeam()
        {
            return db.ExecuteQueryDataSet($"EXEC getAllTeam", CommandType.Text).Tables[0];
        }
        public bool addTeam(string name,string abbreviation,int team_lead,string team_key,int company_id, ref string err)
        {
            return db.MyExecuteNonQuery($"EXEC addTeam '{name}','{abbreviation}',{team_lead},'{team_key}',{company_id}", CommandType.Text, ref err);
        }
        public bool updateTeam(int id, string name, string abbreviation, int team_lead, string team_key, int company_id, ref string err)
        {
            return db.MyExecuteNonQuery($"EXEC updateTeam {id},'{name}','{abbreviation}',{team_lead},'{team_key}',{company_id}", CommandType.Text, ref err);
        }
        public bool deleteTeam(int id, ref string err)
        {
            return db.MyExecuteNonQuery($"EXEC deleteTeam {id}", CommandType.Text, ref err);
        }
    }
}
