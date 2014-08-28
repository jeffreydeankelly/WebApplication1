using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected System.Web.UI.HtmlControls.HtmlInputFile FileSelect;
        //protected System.Web.UI.HtmlControls.HtmlInputButton FileUpload;

        protected void FileUpload_ServerClick(object sender, System.EventArgs e)
        {
            if( ( FileSelect.PostedFile != null ) && ( FileSelect.PostedFile.ContentLength > 0 ) )
            {
                var fileName = Path.GetFileName(FileSelect.PostedFile.FileName);
                var path = Path.Combine(Server.MapPath("~/App_Data/"), fileName);
                FileSelect.PostedFile.SaveAs(path);
                StreamReader sr = System.IO.File.OpenText(path);

                DataTable dt = new DataTable();
                dt.TableName = "tempInvoice_" + DateTime.Now.ToString("MMM_dd_yyyy_HHmm");

                int rowCount = 0;
                string[] columnNames = null;
                string[] streamDataValues = null;

                while (!sr.EndOfStream)
                {
                    string streamRowData = sr.ReadLine().Trim();
                    if (streamRowData.Length > 0)
                    {
                        streamDataValues = streamRowData.Split(',');
                        if (rowCount == 0)
                        {
                            rowCount = 1;
                            columnNames = streamDataValues;
                            foreach (string csvHeader in columnNames)
                            {
                                DataColumn dc = new DataColumn(csvHeader.ToUpper(), typeof(string));
                                dc.DefaultValue = string.Empty;
                                dt.Columns.Add(dc);
                            }
                        }
                        else
                        {
                            DataRow dr = dt.NewRow();
                            for (int i = 0; i < columnNames.Length; i++)
                            {
                                if (streamDataValues[i] == null)
                                {
                                    dr[columnNames[i]] = string.Empty;
                                }
                                else
                                {
                                    streamDataValues[i].ToString().Replace(",", string.Empty);
                                    dr[columnNames[i]] = streamDataValues[i].ToString();
                                }
                            }
                            dt.Rows.Add(dr);
                        }
                    }
                }
                sr.Close();
                sr.Dispose();

                createDatabaseTable(dt);
            }
            else
            {
                Response.Write("Please select a file to upload.");
            }
            //return View();
        }

        private void createDatabaseTable(DataTable dt)
        {
            if (dt == null)
            {
                throw new ArgumentNullException("table");
            }

            string createStatement = "CREATE TABLE [" + dt.TableName + "] (\n";
            // columns
            foreach (DataColumn column in dt.Columns)
            {
                createStatement += "\t[" + column.ToString() + "] VARCHAR(100)";

                createStatement += ",\n";
            }
            createStatement = createStatement.TrimEnd(new char[] { ',', '\n' }) + ");";

            using (SqlConnection sqlConn = new SqlConnection(ConfigurationManager.ConnectionStrings["JDK_DevelopmentConnectionString"].ConnectionString))
            {

                SqlCommand cmd = new SqlCommand(createStatement);  //Here test_insurance_recon is the database name 
                cmd.Connection = sqlConn;
                sqlConn.Open();
                cmd.ExecuteNonQuery();

                SqlBulkCopy bulkCopy =
                    new SqlBulkCopy
                    (
                    sqlConn,
                    SqlBulkCopyOptions.UseInternalTransaction,
                    null
                    );

                // set the destination table name
                bulkCopy.DestinationTableName = dt.TableName;

                // write the data in the "dataTable"
                bulkCopy.WriteToServer(dt);

                sqlConn.Close();
            }
        }
    }
}
