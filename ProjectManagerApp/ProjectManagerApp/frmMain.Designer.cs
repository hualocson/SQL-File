namespace ProjectManagerApp
{
    partial class frmMain
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.pnlLeft = new System.Windows.Forms.Panel();
            this.btnLogout = new System.Windows.Forms.Button();
            this.btnLicensePermisson = new System.Windows.Forms.Button();
            this.btnUserManagement = new System.Windows.Forms.Button();
            this.btnTeamList = new System.Windows.Forms.Button();
            this.btnProjectList = new System.Windows.Forms.Button();
            this.btnCompanyList = new System.Windows.Forms.Button();
            this.pnlLogo = new System.Windows.Forms.Panel();
            this.pnlRight = new System.Windows.Forms.Panel();
            this.pnlLeft.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlLeft
            // 
            this.pnlLeft.Controls.Add(this.btnLogout);
            this.pnlLeft.Controls.Add(this.btnLicensePermisson);
            this.pnlLeft.Controls.Add(this.btnUserManagement);
            this.pnlLeft.Controls.Add(this.btnTeamList);
            this.pnlLeft.Controls.Add(this.btnProjectList);
            this.pnlLeft.Controls.Add(this.btnCompanyList);
            this.pnlLeft.Controls.Add(this.pnlLogo);
            this.pnlLeft.Dock = System.Windows.Forms.DockStyle.Left;
            this.pnlLeft.Location = new System.Drawing.Point(0, 0);
            this.pnlLeft.Name = "pnlLeft";
            this.pnlLeft.Size = new System.Drawing.Size(120, 500);
            this.pnlLeft.TabIndex = 0;
            // 
            // btnLogout
            // 
            this.btnLogout.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnLogout.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.btnLogout.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnLogout.Location = new System.Drawing.Point(0, 462);
            this.btnLogout.Name = "btnLogout";
            this.btnLogout.Size = new System.Drawing.Size(120, 38);
            this.btnLogout.TabIndex = 6;
            this.btnLogout.Text = "Log Out";
            this.btnLogout.UseVisualStyleBackColor = false;
            // 
            // btnLicensePermisson
            // 
            this.btnLicensePermisson.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnLicensePermisson.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnLicensePermisson.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnLicensePermisson.Location = new System.Drawing.Point(0, 352);
            this.btnLicensePermisson.Name = "btnLicensePermisson";
            this.btnLicensePermisson.Size = new System.Drawing.Size(120, 58);
            this.btnLicensePermisson.TabIndex = 5;
            this.btnLicensePermisson.Text = "License Permisson";
            this.btnLicensePermisson.UseVisualStyleBackColor = false;
            // 
            // btnUserManagement
            // 
            this.btnUserManagement.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnUserManagement.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnUserManagement.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnUserManagement.Location = new System.Drawing.Point(0, 294);
            this.btnUserManagement.Name = "btnUserManagement";
            this.btnUserManagement.Size = new System.Drawing.Size(120, 58);
            this.btnUserManagement.TabIndex = 4;
            this.btnUserManagement.Text = "User Management";
            this.btnUserManagement.UseVisualStyleBackColor = false;
            // 
            // btnTeamList
            // 
            this.btnTeamList.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnTeamList.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnTeamList.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnTeamList.Location = new System.Drawing.Point(0, 236);
            this.btnTeamList.Name = "btnTeamList";
            this.btnTeamList.Size = new System.Drawing.Size(120, 58);
            this.btnTeamList.TabIndex = 3;
            this.btnTeamList.Text = "Team List";
            this.btnTeamList.UseVisualStyleBackColor = false;
            // 
            // btnProjectList
            // 
            this.btnProjectList.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnProjectList.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnProjectList.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnProjectList.Location = new System.Drawing.Point(0, 178);
            this.btnProjectList.Name = "btnProjectList";
            this.btnProjectList.Size = new System.Drawing.Size(120, 58);
            this.btnProjectList.TabIndex = 2;
            this.btnProjectList.Text = "Project List";
            this.btnProjectList.UseVisualStyleBackColor = false;
            this.btnProjectList.Click += new System.EventHandler(this.btnProjectList_Click);
            // 
            // btnCompanyList
            // 
            this.btnCompanyList.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.btnCompanyList.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnCompanyList.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCompanyList.Location = new System.Drawing.Point(0, 120);
            this.btnCompanyList.Name = "btnCompanyList";
            this.btnCompanyList.Size = new System.Drawing.Size(120, 58);
            this.btnCompanyList.TabIndex = 1;
            this.btnCompanyList.Text = "Company List";
            this.btnCompanyList.UseVisualStyleBackColor = false;
            this.btnCompanyList.Click += new System.EventHandler(this.btnCompany_Click);
            // 
            // pnlLogo
            // 
            this.pnlLogo.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.pnlLogo.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlLogo.Location = new System.Drawing.Point(0, 0);
            this.pnlLogo.Name = "pnlLogo";
            this.pnlLogo.Size = new System.Drawing.Size(120, 120);
            this.pnlLogo.TabIndex = 0;
            // 
            // pnlRight
            // 
            this.pnlRight.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.pnlRight.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlRight.Location = new System.Drawing.Point(120, 0);
            this.pnlRight.Margin = new System.Windows.Forms.Padding(0);
            this.pnlRight.Name = "pnlRight";
            this.pnlRight.Size = new System.Drawing.Size(680, 500);
            this.pnlRight.TabIndex = 1;
            // 
            // frmMain
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.AutoValidate = System.Windows.Forms.AutoValidate.EnablePreventFocusChange;
            this.ClientSize = new System.Drawing.Size(800, 500);
            this.Controls.Add(this.pnlRight);
            this.Controls.Add(this.pnlLeft);
            this.Font = new System.Drawing.Font("Consolas", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "frmMain";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "APP";
            this.Load += new System.EventHandler(this.frmMain_Load);
            this.pnlLeft.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnlLeft;
        private System.Windows.Forms.Panel pnlRight;
        private System.Windows.Forms.Button btnCompanyList;
        private System.Windows.Forms.Panel pnlLogo;
        private System.Windows.Forms.Button btnLicensePermisson;
        private System.Windows.Forms.Button btnUserManagement;
        private System.Windows.Forms.Button btnTeamList;
        private System.Windows.Forms.Button btnProjectList;
        private System.Windows.Forms.Button btnLogout;
    }
}

