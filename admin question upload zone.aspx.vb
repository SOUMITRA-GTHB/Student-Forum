Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.IO
Partial Class admin_question_upload_zone
    Inherits System.Web.UI.Page
    Dim fileName As String = String.Empty
    Dim filePath As String = String.Empty
    Dim cmd1, cmd2 As New SqlCommand
    Dim dr1, dr2 As SqlDataReader
    Dim con As New SqlConnection("Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\equestion.mdf;Integrated Security=True;User Instance=True")

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'generate student id
        Dim n As Integer
        Try
            con.Open()
            cmd1 = New SqlCommand("select MAX(qsl) from question", con)
            dr1 = cmd1.ExecuteReader
            If dr1.Read Then
                n = dr1(0).ToString
                n = n + 1
                TextBox10.Text = Val(n)
                TextBox1.Text = "sf/qs/No-/" & n.ToString
            End If
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
        con.Close()
    End Sub

    Protected Sub ImageButton2_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton2.Click
        con.Open()
        Try
            'If FileUpload1.HasFile Then
            '    fileName = FileUpload1.FileName
            '    filePath = Server.MapPath("~/adminquestion/" & Convert.ToString(fileName))
            '    FileUpload1.SaveAs(filePath)
            '    fileName = "~/adminquestion/" & fileName
            'End If
            fileName = FileUpload1.FileName
            filePath = Server.MapPath("adminquestion/" & Convert.ToString(fileName))
            FileUpload1.SaveAs(filePath)

            cmd2 = New SqlCommand("insert into question(qid,qsl,qpaper,qcourse,qyear,qsub,qname,qset,qdet) values(@qid,@qsl,@qpaper,@qcourse,@qyear,@qsub,@qname,@qset,@qdet)", con)
            cmd2.Parameters.AddWithValue("@qid", TextBox1.Text.Trim())
            cmd2.Parameters.AddWithValue("@qsl", TextBox10.Text.Trim())
            cmd2.Parameters.AddWithValue("@qpaper", TextBox9.Text.Trim())
            cmd2.Parameters.AddWithValue("@qcourse", TextBox3.Text.Trim())
            cmd2.Parameters.AddWithValue("@qyear", TextBox4.Text.Trim())
            cmd2.Parameters.AddWithValue("@qsub", DropDownList1.SelectedValue.Trim())
            cmd2.Parameters.AddWithValue("@qname", TextBox7.Text.Trim())
            cmd2.Parameters.AddWithValue("@qset", TextBox8.Text.Trim())
            cmd2.Parameters.AddWithValue("@qdet", fileName)
            cmd2.ExecuteReader()
            MsgBox("upload successful", MsgBoxStyle.OkCancel)
        Catch ex As Exception
            MsgBox(ex.Message)
        End Try
    End Sub
End Class
