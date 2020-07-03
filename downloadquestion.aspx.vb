Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO
Partial Class downloadquestion
    Inherits System.Web.UI.Page
    Dim fileName1 As String = String.Empty
    Dim filePath1 As String = String.Empty
    Dim fileName2 As String = String.Empty
    Dim filePath2 As String = String.Empty
    Dim cmd1, cmd2 As New SqlCommand
    Dim dr1, dr2 As SqlDataReader
    Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\equestion.mdf;Integrated Security=True;User Instance=True")
    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click
        Dim lnkbtn As ImageButton = TryCast(sender, ImageButton)

        Dim gvrow As GridViewRow = TryCast(lnkbtn.NamingContainer, GridViewRow)
        filePath1 = Server.MapPath("adminquestion/" & Convert.ToString(TextBox1.Text))
        Response.ContentType = "adminquestion/jpg"
        Response.ContentType = "adminquestion/docx"
        Response.ContentType = "adminquestion/pdf"
        Response.AddHeader("Content-Disposition", "attachment;filename=""" & filePath1 & """")
        Response.TransmitFile(Server.MapPath("adminquestion/" + TextBox1.Text))
        Response.[End]()
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        TextBox1.Text = GridView1.SelectedRow.Cells(9).Text
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Literal1.Text = "<marquee direction=left>if you download question 1st must select question from gridview otherwise shows an error</marquee>"
    End Sub
End Class
