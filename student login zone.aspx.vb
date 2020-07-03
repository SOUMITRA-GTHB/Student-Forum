Imports System.Data
Imports System.Data.SqlClient
Partial Class student_login_zone
    Inherits System.Web.UI.Page
    Dim cmd As SqlCommand
    Dim dr As SqlDataReader
    Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\equestion.mdf;Integrated Security=True;User Instance=True")

    Protected Sub ImageButton4_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton4.Click
        Try
            con.Open()
            cmd = New SqlCommand("select * from student where sid='" + TextBox1.Text + "'and spass='" + TextBox2.Text + "'", con)
            dr = cmd.ExecuteReader
            If dr.Read Then
                Session("sid") = TextBox1.Text

                Response.Redirect("studentaskquestionzone.aspx")
            Else
                MsgBox("please enter valid information", MsgBoxStyle.Critical)
            End If
        Catch ex As Exception
            'MsgBox(ex.Message)'
        End Try
        con.Close()
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click

    End Sub
End Class
