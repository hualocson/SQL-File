using ProjectManagerApp.DB_Layer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjectManagerApp.BS_Layer
{
    class BSTask
    {
        DBMain db = null;
        public BSTask(){
            db = new DBMain();
        }

        public DataTable getAllTask()
        {
            return db.ExecuteQueryDataSet("EXEC getAllTasks", CommandType.Text).Tables[0];
        }
        public bool addTask(string name, string description, string created_at, string dueDate, float progress, int status_id, int project_id, int assignee_id, int create_user, int team_id,ref string err)
        {
            return db.MyExecuteNonQuery($"EXEC addTask '{name}','{description}','{created_at}','{dueDate}',{progress},{status_id},{project_id},{create_user},{team_id}", CommandType.Text, ref err);
        }
        public bool updateTask(int id, string name, string description, string created_at, string dueDate, float progress, int status_id, int project_id, int assignee_id, int create_user, int team_id, ref string err)
        {
            return db.MyExecuteNonQuery($"EXEC updateTask {id},'{name}','{description}','{created_at}','{dueDate}',{progress},{status_id},{project_id},{create_user},{team_id}", CommandType.Text, ref err);
        }
        public bool deleteTask(int id, ref string err)
        {
            return db.MyExecuteNonQuery($"EXEC deleteTask {id}", CommandType.Text, ref err);
        }
    }
}
