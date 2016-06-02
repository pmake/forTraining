using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.XtraPrinting;

namespace webapp.Forms.zzz
{
    public partial class zzzp007_pivotgrid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_excel_Click(object sender, EventArgs e)
        {
            pge_master.ExportXlsxToResponse("abc");
        }

        protected void btn_pdf_Click(object sender, EventArgs e)
        {
            PdfExportOptions pdfOptions = new PdfExportOptions();
            pdfOptions.NeverEmbeddedFonts = "Lucida Bright";
            pdfOptions.Compressed = true;  
            pdfOptions.ImageQuality = PdfJpegImageQuality.Highest;
            pdfOptions.DocumentOptions.Author = "AuthorName";
            pdfOptions.DocumentOptions.Title = "Title";
            pdfOptions.PasswordSecurityOptions.PermissionsPassword = "password";
            pdfOptions.PasswordSecurityOptions.PermissionsOptions.ChangingPermissions = ChangingPermissions.None;
            pdfOptions.PasswordSecurityOptions.PermissionsOptions.PrintingPermissions = PrintingPermissions.HighResolution;

            pge_master.ExportPdfToResponse("abc", pdfOptions);


        }
    }
}