using System;
using System.IO;  //added to allow saving textbox content to text file
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class userInput : System.Web.UI.Page
{		

	protected void Page_Load(object sender, EventArgs e)
	{ //load literal using saved content text file
		if (!IsPostBack)
		{
			string path = Server.MapPath("contentFiles");
			section1.Text = File.ReadAllText(path + "/content1.txt");
		}
	}
	protected void populateTextBox(object sender, EventArgs e)
	{ //load textbox using literal
		if (!IsPostBack)
		{
			string path = Server.MapPath("contentFiles");
			RichTextBox.Text = section1.Text;
			//RichTextBox.Text = File.ReadAllText(path + "/content1.txt");
		}
	}
  protected void updateButton_Click(object sender, EventArgs e)
  { //Save updated content, first back to literal then using literal back to saved content text file.
    string path = Server.MapPath("contentFiles");
		section1.Text = RichTextBox.Text;
    File.WriteAllText(path + "/content1.txt", section1.Text);
		section1.Text = File.ReadAllText(path + "/content1.txt"); //not really necessary, but this confirms that save file is the updated content
	}
  protected void UploadButton_Click(object sender, EventArgs e)
  {
    // Specify the path on the server to 
    // save the uploaded file to.
    string path = Server.MapPath("Uploads\\");
    String savePath = @path;

    // Before attempting to perform operations 
    // on the file, verify that the FileUpload  
    // control contains a file. 
    if (FileUpload1.HasFile)
    {
      // Get the name of the file to upload.
      String fileName = FileUpload1.FileName;

      // Append the name of the file to upload to the path.
      savePath += fileName;


      // Call the SaveAs method to save the  
      // uploaded file to the specified path. 
      // This example does not perform all 
      // the necessary error checking.                
      // If a file with the same name 
      // already exists in the specified path,   
      // the uploaded file overwrites it.
      FileUpload1.SaveAs(savePath);

      // Notify the user of the name of the file 
      // was saved under.
      UploadStatusLabel.Text = "Your file was saved as " + fileName;
    }
    else
    {
      // Notify the user that a file was not uploaded.
      UploadStatusLabel.Text = "You did not specify a file to upload.";
    }

  }	
  protected void BackButton_Click(object sender, EventArgs e)
  {
    //Do nothing, cancel.
  }   
}
