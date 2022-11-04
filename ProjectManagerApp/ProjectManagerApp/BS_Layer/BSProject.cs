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
            string sqlString = "getAllProject";
            return db.ExecuteQueryDataSet(sqlString, CommandType.StoredProcedure).Tables[0];
        }
    }
}
