using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ControlPanel : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    //string path = Server.MapPath("contentFiles");
    //image1.Text = File.ReadAllText(path + "/image1.txt");
    //video1.Text = File.ReadAllText(path + "/video1.txt");
    //section1.Text = File.ReadAllText(path + "/content1.txt");
    //sponsors1.Text = File.ReadAllText(path + "/sponsors1.txt");
  }
  protected void ImageButton_Click(object sender, EventArgs e)
  {
    //Edit Vets Image Section here.
    //image1.Text = RichTextBox.Text;
    //string path = Server.MapPath("contentFiles");
    //File.WriteAllText(path + "/image1.txt", RichTextBox.Text);
  }
  protected void VideoButton_Click(object sender, EventArgs e)
  {
    //Edit Vets Video Section here.
    //video1.Text = RichTextBox.Text;
    //string path = Server.MapPath("contentFiles");
    //File.WriteAllText(path + "/video1.txt", RichTextBox.Text);
  }
  protected void ContentButton_Click(object sender, EventArgs e)
  {
    //Edit Content Section here.
    //section1.Text = RichTextBox.Text;
    //string path = Server.MapPath("contentFiles");
    //File.WriteAllText(path + "/content1.txt", RichTextBox.Text);
  }
  protected void SponsorsButton_Click(object sender, EventArgs e)
  {
    //Edit Sponsor Section here.
    //sponsors1.Text = RichTextBox.Text;
    //string path = Server.MapPath("contentFiles");
    //File.WriteAllText(path + "/sponsors1.txt", RichTextBox.Text);
  }
  protected void BackButton_Click(object sender, EventArgs e)
  {
    //Do nothing, cancel.
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
}