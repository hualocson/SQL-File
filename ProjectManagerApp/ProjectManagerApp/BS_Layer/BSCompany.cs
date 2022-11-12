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
            string sqlString = "EXEC getAllCompany";
            return db.ExecuteQueryDataSet(sqlString, CommandType.Text).Tables[0];
        }
        public bool addCompany(string name, string abbreviation, string address, string phone, ref string err)
        {
            return db.MyExecuteNonQuery($"EXEC addCompany '{name}',N'{abbreviation}','{address}','{phone}'", CommandType.Text, ref err);
        }
        public bool updateCompany(int id, string name, string abbreviation, string address, string phone, ref string err)
        {
            return db.MyExecuteNonQuery($"EXEC updateCompany {id},'{name}',N'{abbreviation}','{address}','{phone}'", CommandType.Text, ref err);
        }
        public bool deleteCompany(int id, ref string err)
        {
            return db.MyExecuteNonQuery($"EXEC deleteCompany {id}", CommandType.Text, ref err);
        }
    }
}
