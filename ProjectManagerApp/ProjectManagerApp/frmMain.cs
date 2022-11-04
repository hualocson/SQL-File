using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ProjectManagerApp.Views;

namespace ProjectManagerApp
{
    public partial class frmMain : Form
    {
        #region Open Child Form
        private Form activeForm = null; 
        frmLogin login = null;
        public void openChildForm(Form childForm)
        {
            if (activeForm != null)
                activeForm.Close();
            activeForm = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            pnlRight.Controls.Add(childForm);
            childForm.Dock = DockStyle.Fill;
            pnlRight.Tag = childForm;
            childForm.BringToFront();
            childForm.Show();
        }
        #endregion
        public frmMain()
        {
            InitializeComponent();
            login = new frmLogin();
            login.ShowDialog();
        }

        private void btnCompany_Click(object sender, EventArgs e)
        {
            openChildForm(new frmCompany());
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            if (!login.isSuccess)
                Close();
        }

        private void btnProjectList_Click(object sender, EventArgs e)
        {
            openChildForm(new frmProject());
        }
    }
}
