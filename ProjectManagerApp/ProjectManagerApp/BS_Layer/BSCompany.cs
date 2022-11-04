using ProjectManagerApp.DB_Layer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace ProjectManagerApp.BS_Layer
{
    internal class BSCompany
    {
        DBMain db = null;
        public BSCompany()
        {
            db = new DBMain();
        }
        public DataTable getAllCompany()
        {
            string sqlString = "getAllCompany";
            return db.ExecuteQueryDataSet(sqlString, CommandType.StoredProcedure).Tables[0];
        }
    }
}
