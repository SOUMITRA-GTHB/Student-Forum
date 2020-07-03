
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO
Imports System.Net.Mail
Imports System.Net
Partial Class admin_forgot_password
    Inherits System.Web.UI.Page
    Dim cmd, cmd2 As New SqlCommand
    Dim dr, dr2 As SqlDataReader
    Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\equestion.mdf;Integrated Security=True;User Instance=True")
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Dim rand1 As New Random()
        Dim p As Integer
        For p = 1 To 100
            Label6.Text = rand1.Next(3000)
            TextBox7.Text = Val(Label6.Text)

        Next
        Dim fromAdress As String = TextBox4.Text
        Dim fromPassword As String = TextBox5.Text
        Dim mailSubject As String = TextBox6.Text
        Dim mailbody As String = TextBox7.Text
        Dim toAdress As String = TextBox1.Text
        Dim smtp As New SmtpClient("smtp.gmail.com", 587)
        smtp.EnableSsl = True
        smtp.UseDefaultCredentials = False
        smtp.Credentials = New NetworkCredential(fromAdress, fromPassword)
        Dim mail As New MailMessage(fromAdress, toAdress, mailSubject, mailbody)
        Try
            smtp.Send(mail)
        Catch ex As Exception
            Label10.Text = ex.Message.ToString
        End Try

    End Sub


    Protected Sub LinkButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton2.Click
        Dim rand1 As New Random()
        Dim p As Integer
        For p = 1 To 100
            Label6.Text = rand1.Next(3000)
            TextBox7.Text = Val(Label6.Text)

        Next
        Dim fromAdress As String = TextBox4.Text
        Dim fromPassword As String = TextBox5.Text
        Dim mailSubject As String = TextBox6.Text
        Dim mailbody As String = TextBox7.Text
        Dim toAdress As String = TextBox1.Text
        Dim smtp As New SmtpClient("smtp.gmail.com", 587)
        smtp.EnableSsl = True
        smtp.UseDefaultCredentials = False
        smtp.Credentials = New NetworkCredential(fromAdress, fromPassword)
        Dim mail As New MailMessage(fromAdress, toAdress, mailSubject, mailbody)
        Try
            smtp.Send(mail)
        Catch ex As Exception
            Label10.Text = ex.Message.ToString
        End Try
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        con.Open()
        Try
            If Val(TextBox7.Text) = Val(TextBox2.Text) Then
                Label5.Visible = True
                TextBox3.Visible = True
                cmd = New SqlCommand("select * from admin where aemail='" + TextBox1.Text + "'", con)
                dr = cmd.ExecuteReader
                If dr.Read Then
                    TextBox3.Text = dr(3).ToString

                End If
            Else
                MsgBox("u r wrong user", MsgBoxStyle.RetryCancel)
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            con.Close()

            con.Dispose()
        End Try

    End Sub
End Class
