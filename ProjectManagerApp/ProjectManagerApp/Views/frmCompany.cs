using ProjectManagerApp.BS_Layer;
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

namespace ProjectManagerApp.Views
{
    public partial class frmCompany : Form
    {
        public frmCompany()
        {
            InitializeComponent();
        }
        BSCompany dbCompany = new BSCompany();
        DataTable dtCompany = null;
        private void loadData()
        {
            try
            {
                dtCompany = new DataTable();
                dtCompany.Clear();
                dtCompany = dbCompany.getAllCompany();
                // Đưa dữ liệu lên DataGridView  
                dtgvCompany.DataSource = dtCompany;
                // Thay đổi độ rộng cột
                dtgvCompany.AutoResizeColumns();
                dtgvCompany.AutoGenerateColumns = true;
            }
            catch (SqlException)
            {
                MessageBox.Show("Không lấy được nội dung trong table THANHPHO. Lỗi rồi!!!");
            }
        }
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void frmCompany_Load(object sender, EventArgs e)
        {
            loadData();
        }
    }
}
