namespace ProjectManagerApp
{
    partial class frmLogin
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
            this.label2 = new System.Windows.Forms.Label();
            this.lbUserName = new System.Windows.Forms.Label();
            this.btnLogin = new System.Windows.Forms.Button();
            this.txbPassword = new System.Windows.Forms.TextBox();
            this.txbUsername = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(18, 79);
            this.label2.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(90, 19);
            this.label2.TabIndex = 9;
            this.label2.Text = "Password:";
            // 
            // lbUserName
            // 
            this.lbUserName.AutoSize = true;
            this.lbUserName.Location = new System.Drawing.Point(18, 33);
            this.lbUserName.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.lbUserName.Name = "lbUserName";
            this.lbUserName.Size = new System.Drawing.Size(99, 19);
            this.lbUserName.TabIndex = 8;
            this.lbUserName.Text = "User Name:";
            // 
            // btnLogin
            // 
            this.btnLogin.Location = new System.Drawing.Point(22, 132);
            this.btnLogin.Margin = new System.Windows.Forms.Padding(6);
            this.btnLogin.Name = "btnLogin";
            this.btnLogin.Size = new System.Drawing.Size(314, 35);
            this.btnLogin.TabIndex = 7;
            this.btnLogin.Text = "Login";
            this.btnLogin.UseVisualStyleBackColor = true;
            this.btnLogin.Click += new System.EventHandler(this.btnLogin_Click);
            // 
            // txbPassword
            // 
            this.txbPassword.Location = new System.Drawing.Point(123, 79);
            this.txbPassword.Margin = new System.Windows.Forms.Padding(6);
            this.txbPassword.Name = "txbPassword";
            this.txbPassword.PasswordChar = '*';
            this.txbPassword.Size = new System.Drawing.Size(213, 26);
            this.txbPassword.TabIndex = 6;
            // 
            // txbUsername
            // 
            this.txbUsername.Location = new System.Drawing.Point(124, 33);
            this.txbUsername.Margin = new System.Windows.Forms.Padding(6);
            this.txbUsername.Name = "txbUsername";
            this.txbUsername.Size = new System.Drawing.Size(213, 26);
            this.txbUsername.TabIndex = 5;
            // 
            // frmLogin
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(352, 194);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.lbUserName);
            this.Controls.Add(this.btnLogin);
            this.Controls.Add(this.txbPassword);
            this.Controls.Add(this.txbUsername);
            this.Font = new System.Drawing.Font("Consolas", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "frmLogin";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Login";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lbUserName;
        private System.Windows.Forms.Button btnLogin;
        private System.Windows.Forms.TextBox txbPassword;
        private System.Windows.Forms.TextBox txbUsername;
    }
}