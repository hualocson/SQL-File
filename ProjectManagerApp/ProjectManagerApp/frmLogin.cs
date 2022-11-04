using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ProjectManagerApp.BS_Layer;

namespace ProjectManagerApp
{
    public partial class frmLogin : Form
    {
        string err = "";
        BSMember member = null;
        public bool isSuccess = false;
        public frmLogin()
        {
            InitializeComponent();
            member = new BSMember();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txbUsername.Text.Trim();
            string pass = txbPassword.Text.Trim();
            isSuccess = true;
            //if (member.login(username, pass, ref err))
            //{
            //    isSuccess = true;
            //    Close();
            //}
            //else
            //{
            //    txbPassword.Clear();
            //    MessageBox.Show("Check your username or password!");
            //    txbPassword.Focus();
            //}
        }
    }
}
