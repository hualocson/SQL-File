namespace ProjectManagerApp.Views
{
    partial class frmProject
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
            this.btnArchiveProject = new System.Windows.Forms.Button();
            this.btnAddProject = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.dtgvProject = new System.Windows.Forms.DataGridView();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvProject)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlHeader
            // 
            this.pnlHeader.BackColor = System.Drawing.SystemColors.ButtonFace;
            this.pnlHeader.Controls.Add(this.btnArchiveProject);
            this.pnlHeader.Controls.Add(this.btnAddProject);
            this.pnlHeader.Controls.Add(this.button1);
            this.pnlHeader.Controls.Add(this.textBox1);
            this.pnlHeader.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlHeader.Location = new System.Drawing.Point(0, 0);
            this.pnlHeader.Name = "pnlHeader";
            this.pnlHeader.Size = new System.Drawing.Size(680, 102);
            this.pnlHeader.TabIndex = 1;
            // 
            // btnArchiveProject
            // 
            this.btnArchiveProject.BackColor = System.Drawing.Color.Khaki;
            this.btnArchiveProject.FlatAppearance.BorderColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.btnArchiveProject.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnArchiveProject.Location = new System.Drawing.Point(493, 30);
            this.btnArchiveProject.Name = "btnArchiveProject";
            this.btnArchiveProject.Size = new System.Drawing.Size(175, 30);
            this.btnArchiveProject.TabIndex = 3;
            this.btnArchiveProject.Text = "Archive Project";
            this.btnArchiveProject.UseVisualStyleBackColor = false;
            // 
            // btnAddProject
            // 
            this.btnAddProject.BackColor = System.Drawing.Color.Khaki;
            this.btnAddProject.FlatAppearance.BorderColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.btnAddProject.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnAddProject.Location = new System.Drawing.Point(296, 30);
            this.btnAddProject.Name = "btnAddProject";
            this.btnAddProject.Size = new System.Drawing.Size(175, 30);
            this.btnAddProject.TabIndex = 2;
            this.btnAddProject.Text = "Add Project";
            this.btnAddProject.UseVisualStyleBackColor = false;
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
            // dtgvProject
            // 
            this.dtgvProject.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dtgvProject.Location = new System.Drawing.Point(55, 156);
            this.dtgvProject.Name = "dtgvProject";
            this.dtgvProject.Size = new System.Drawing.Size(447, 234);
            this.dtgvProject.TabIndex = 2;
            // 
            // frmProject
            // 
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.None;
            this.ClientSize = new System.Drawing.Size(680, 500);
            this.Controls.Add(this.dtgvProject);
            this.Controls.Add(this.pnlHeader);
            this.Font = new System.Drawing.Font("Consolas", 12F);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Name = "frmProject";
            this.Text = "frmProject";
            this.Load += new System.EventHandler(this.frmProject_Load);
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dtgvProject)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnlHeader;
        private System.Windows.Forms.Button btnArchiveProject;
        private System.Windows.Forms.Button btnAddProject;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.DataGridView dtgvProject;
    }
}