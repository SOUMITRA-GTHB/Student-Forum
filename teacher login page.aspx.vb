
Imports System.Data
Imports System.Data.SqlClient
Partial Class teacher_login_page
    Inherits System.Web.UI.Page
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\equestion.mdf;Integrated Security=True;User Instance=True")

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click
        Try
            con.Open()
            cmd = New SqlCommand("select * from teacher where tid='" + TextBox1.Text + "'and tpass='" + TextBox2.Text + "'", con)
            dr = cmd.ExecuteReader
            If dr.Read Then
                Session("tid") = TextBox1.Text
                Response.Redirect("teacheraskquestion.aspx")
            Else
                MsgBox("please enter valid information", MsgBoxStyle.Critical)
            End If
        Catch ex As Exception
            'MsgBox(ex.Message)'
        End Try
        con.Close()
    End Sub
End Class