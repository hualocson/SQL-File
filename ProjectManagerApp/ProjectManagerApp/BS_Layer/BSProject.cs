using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProjectManagerApp.DB_Layer;

namespace ProjectManagerApp.BS_Layer
{
    internal class BSProject
    {
        DBMain db = null;
        public BSProject()
        {
            db = new DBMain();
        }

        public DataTable getAllProject()
        {
            string sqlString = "EXEC getAllProject";
            return db.ExecuteQueryDataSet(sqlString, CommandType.Text).Tables[0];
        }
        public bool addProject(string name, string progress, string deadline, string created_at, string key, ref string err)
        {
            return db.MyExecuteNonQuery($"EXEC addProject '{name}',{progress},'{deadline}','{created_at}','{key}'", CommandType.Text, ref err);
        }
        public bool updateProject(int id, string name, string progress, string deadline, string created_at, string key, ref string err)
        {
            return db.MyExecuteNonQuery($"EXEC updateProject {id},'{name}',{progress},'{deadline}','{created_at}','{key}'", CommandType.Text, ref err);
        }
        public bool deleteProject(int id, ref string err)
        {
            return db.MyExecuteNonQuery($"EXEC deleteProject {id}", CommandType.Text, ref err);
        }
    }
}
