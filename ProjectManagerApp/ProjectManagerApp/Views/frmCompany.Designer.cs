namespace ProjectManagerApp.Views
{
    partial class frmCompany
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
            this.pnlHeader = new System.Windows.Forms.Panel();
            this.btnArchiveCompany = new System.Windows.Forms.Button();
            this.btnAddCompany = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.pnlBody = new System.Windows.Forms.Panel();
            this.dtgvCompany = new System.Windows.Forms.DataGridView();
            this.pnlHeader.SuspendLayout();
            this.pnlBody.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvCompany)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlHeader
            // 
            this.pnlHeader.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.pnlHeader.Controls.Add(this.btnArchiveCompany);
            this.pnlHeader.Controls.Add(this.btnAddCompany);
            this.pnlHeader.Controls.Add(this.button1);
            this.pnlHeader.Controls.Add(this.textBox1);
            this.pnlHeader.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlHeader.Location = new System.Drawing.Point(0, 0);
            this.pnlHeader.Name = "pnlHeader";
            this.pnlHeader.Size = new System.Drawing.Size(680, 102);
            this.pnlHeader.TabIndex = 0;
            // 
            // btnArchiveCompany
            // 
            this.btnArchiveCompany.BackColor = System.Drawing.Color.Khaki;
            this.btnArchiveCompany.FlatAppearance.BorderColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.btnArchiveCompany.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnArchiveCompany.Location = new System.Drawing.Point(493, 30);
            this.btnArchiveCompany.Name = "btnArchiveCompany";
            this.btnArchiveCompany.Size = new System.Drawing.Size(175, 30);
            this.btnArchiveCompany.TabIndex = 3;
            this.btnArchiveCompany.Text = "Archive Company";
            this.btnArchiveCompany.UseVisualStyleBackColor = false;
            // 
            // btnAddCompany
            // 
            this.btnAddCompany.BackColor = System.Drawing.Color.Khaki;
            this.btnAddCompany.FlatAppearance.BorderColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.btnAddCompany.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAddCompany.Location = new System.Drawing.Point(296, 30);
            this.btnAddCompany.Name = "btnAddCompany";
            this.btnAddCompany.Size = new System.Drawing.Size(175, 30);
            this.btnAddCompany.TabIndex = 2;
            this.btnAddCompany.Text = "Add Company";
            this.btnAddCompany.UseVisualStyleBackColor = false;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(3, 28);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(86, 36);
            this.button1.TabIndex = 1;
            this.button1.Text = "Search";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(95, 34);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(159, 26);
            this.textBox1.TabIndex = 0;
            // 
            // pnlBody
            // 
            this.pnlBody.Controls.Add(this.dtgvCompany);
            this.pnlBody.Dock = System.Windows.Forms.DockStyle.Fill;
            this.pnlBody.Location = new System.Drawing.Point(0, 102);
            this.pnlBody.Name = "pnlBody";
            this.pnlBody.Size = new System.Drawing.Size(680, 398);
            this.pnlBody.TabIndex = 1;
            // 
            // dtgvCompany
            // 
            this.dtgvCompany.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvCompany.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dtgvCompany.Location = new System.Drawing.Point(0, 0);
            this.dtgvCompany.Name = "dtgvCompany";
            this.dtgvCompany.Size = new System.Drawing.Size(680, 398);
            this.dtgvCompany.TabIndex = 0;
            this.dtgvCompany.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // frmCompany
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.BackColor = System.Drawing.SystemColors.AppWorkspace;
            this.ClientSize = new System.Drawing.Size(680, 500);
            this.Controls.Add(this.pnlBody);
            this.Controls.Add(this.pnlHeader);
            this.Font = new System.Drawing.Font("Consolas", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "frmCompany";
            this.Text = "frmCompany";
            this.Load += new System.EventHandler(this.frmCompany_Load);
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            this.pnlBody.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dtgvCompany)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnlHeader;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Panel pnlBody;
        private System.Windows.Forms.Button btnArchiveCompany;
        private System.Windows.Forms.Button btnAddCompany;
        private System.Windows.Forms.DataGridView dtgvCompany;
    }
}