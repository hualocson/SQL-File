using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ProjectManagerApp.BS_Layer;

namespace ProjectManagerApp.Views
{
    public partial class frmProject : Form
    {
        public frmProject()
        {
            InitializeComponent();
        }
        BSProject dbProject = new BSProject();
        DataTable dtProject = null;
        private void loadData()
        {
            try
            {
                dtProject = new DataTable();
                dtProject.Clear();
                dtProject = dbProject.getAllProject();
                // Đưa dữ liệu lên DataGridView  
                dtgvProject.DataSource = dtProject;
                // Thay đổi độ rộng cột
                dtgvProject.AutoResizeColumns();
                dtgvProject.AutoGenerateColumns = true;
            }
            catch (SqlException)
            {
                MessageBox.Show("Lỗi rồi!!!");
            }
        }

        private void frmProject_Load(object sender, EventArgs e)
        {
            loadData();
        }
    }
}
