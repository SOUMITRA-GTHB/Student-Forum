Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO
Imports System.Net.Mail
Imports System.Net
Partial Class teacheraskquestion
    Inherits System.Web.UI.Page
    Dim cmd, cmd1 As New SqlCommand
    Dim dr, dr1 As SqlDataReader
    Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\equestion.mdf;Integrated Security=True;User Instance=True")

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        TextBox4.Text = GridView1.SelectedRow.Cells(2).Text
        TextBox5.Text = GridView1.SelectedRow.Cells(3).Text
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Label14.Text = DateAndTime.Now.Date

        TextBox1.Text = Session("tid")
        con.Open()
        Try
            cmd = New SqlCommand("select * from  teacher where tid='" + TextBox1.Text + "' ", con)
            dr = cmd.ExecuteReader
            If dr.Read Then
                TextBox2.Text = dr(2).ToString
                TextBox3.Text = dr(7).ToString
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        con.Close()
    End Sub

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click

        Dim fromAdress As String = TextBox3.Text
        Dim fromPassword As String = TextBox7.Text
        Dim mailSubject As String = TextBox5.Text
        Dim mailBody As String = TextBox6.Text
        Dim toAddress As String = TextBox4.Text
        Dim smtp As New SmtpClient("smtp.gmail.com", 587)
        smtp.EnableSsl = True
        smtp.UseDefaultCredentials = False
        smtp.Credentials = New NetworkCredential(fromAdress, fromPassword)
        Dim mail As New MailMessage(fromAdress, toAddress, mailSubject, mailBody)
        Try
            smtp.Send(mail)
        Catch ex As Exception
            'Label16.Text = ex.Message.ToString
        End Try

        con.Open()
        Try
            cmd1 = New SqlCommand("insert into treplyans(tid,tname,temail,sub,qdtls,semail,answer,adate) values (@tid,@tname,@temail,@sub,@qdtls,@semail,@answer,@adate)", con)
            cmd1.Parameters.AddWithValue("@tid", TextBox1.Text.Trim())
            cmd1.Parameters.AddWithValue("@tname", TextBox2.Text.Trim())
            cmd1.Parameters.AddWithValue("@temail", TextBox3.Text.Trim())
            cmd1.Parameters.AddWithValue("@sub", DropDownList1.SelectedValue.Trim())
            cmd1.Parameters.AddWithValue("@qdtls", TextBox5.Text.Trim())
            cmd1.Parameters.AddWithValue("@semail", TextBox4.Text.Trim())
            cmd1.Parameters.AddWithValue("@answer", TextBox6.Text.Trim())
            cmd1.Parameters.AddWithValue("@adate", Label14.Text.Trim())
            cmd1.ExecuteReader()
            MsgBox("Submission successful", MsgBoxStyle.OkCancel)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try


    End Sub
End Class
