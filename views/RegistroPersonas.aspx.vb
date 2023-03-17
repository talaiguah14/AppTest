Imports System.IO
Imports System.Data.OleDb
Imports Microsoft.VisualBasic
Imports Newtonsoft.Json
Imports System.Collections

Public Class RegistroPersonas
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            FilaGrPersonas.Style("display") = "none"
            FilaConsultas.Style("display") = "none"
            llenarDdlTiposDocumentos()
            llenarDdlGeneros()
        End If
    End Sub

    Shared Sub MsgBox(ByVal mensaje As String, ByVal pagina As System.Web.UI.Page)
        Dim scriptStr As String = "alert('" & mensaje & "');"
        ScriptManager.RegisterStartupScript(pagina, pagina.GetType, "msgBox", scriptStr, True)
    End Sub

    Protected Sub btnAgregar_Click(sender As Object, e As EventArgs) Handles btnAgregar.Click
        Dim status As Integer
        Dim script As String

        If ddlDocumentType.SelectedIndex = -1 Then
            MsgBox("El campo Tipo Documento es obligatorio, Validar Por favor", Me.Page)
            Exit Sub
        End If
        If String.IsNullOrEmpty(txtNumberDocument.Text) Then
            MsgBox("El campo Nummero es obligatorio, Validar Por favor", Me.Page)
            Exit Sub
        End If
        If String.IsNullOrEmpty(txtFirstName.Text) Then
            MsgBox("El campo Primer Nombre es obligatorio, Validar Por favor", Me.Page)
            Exit Sub
        End If
        If String.IsNullOrEmpty(txtFirstLastName.Text) Then
            MsgBox("El campo Primer Apellido es obligatorio, Validar Por favor", Me.Page)
            Exit Sub
        End If
        If String.IsNullOrEmpty(txtAddress.Text) Then
            MsgBox("El campo Direccion es obligatorio, Validar Por favor", Me.Page)
            Exit Sub
        End If
        If String.IsNullOrEmpty(txtAge.Text) Then
            MsgBox("El campo edad es obligatorio, Validar Por favor", Me.Page)
            Exit Sub
        End If
        If ddlGender.SelectedIndex = -1 Then
            MsgBox("El campo Gender es obligatorio, Validar Por favor", Me.Page)
            Exit Sub
        End If

        Dim headers = New List(Of Parametros) From {
           }

        Dim parametros = New List(Of Parametros)

        status = InsertarPersonas(headers, parametros)

        If Not String.IsNullOrEmpty(status.ToString) Then
            Script = "abrir_modal_Mensaje();"
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "abrir_modal_Mensaje", Script, True)
            lblMensaje.Text = "El Persona se ha ingresado correctamente"
        End If

    End Sub

    Private Function InsertarPersonas(headers As List(Of Parametros), parametros As List(Of Parametros))
        Dim api = New DBapi()
        Dim registroPersonas = New Personas()
        Dim response = Nothing
        Dim id As Integer
        Dim result = Nothing

        Dim idTipoDocumento As Integer = 0
        Dim numberDocument As String = String.Empty
        Dim firstName As String = String.Empty
        Dim secondName As String = String.Empty
        Dim firstLastName As String = String.Empty
        Dim secondLastName As String = String.Empty
        Dim NumberPhone As String = String.Empty
        Dim Mail As String = String.Empty
        Dim address As String = String.Empty
        Dim age As Integer = 0
        Dim gender As Integer = 0

        idTipoDocumento = ddlDocumentType.SelectedValue
        numberDocument = txtNumberDocument.Text
        firstName = txtFirstName.Text
        secondName = txtSecondLastName.Text
        firstLastName = txtFirstLastName.Text
        secondLastName = txtSecondLastName.Text
        NumberPhone = txtNumberPhone.Text
        Mail = txtMail.Text
        address = txtAddress.Text
        age = txtAge.Text
        gender = ddlGender.SelectedValue

        registroPersonas.idTipoDocumento = idTipoDocumento
        registroPersonas.numerodocumento = numberDocument
        registroPersonas.primerNombre = firstName
        registroPersonas.segundoNombre = secondName
        registroPersonas.primerApellido = firstLastName
        registroPersonas.segundoApellido = secondLastName
        registroPersonas.telefono = NumberPhone
        registroPersonas.mail = Mail
        registroPersonas.direccion = address
        registroPersonas.edad = age
        registroPersonas.genero = gender

        response = api.postRegistroPersonas(headers, parametros, registroPersonas)

        result = JsonConvert.DeserializeObject(Of Respuestas)(response)
        Return result.status.ToString
    End Function

    Public Sub llenarDdlGeneros()
        Dim api = New DBapi()
        Dim registroPersonas = New Personas()
        Dim response = Nothing
        Dim result = Nothing
        Dim dtGeneros As New DataTable

        Dim headers = New List(Of Parametros) From {
           }

        Dim parametros = New List(Of Parametros)

        response = api.getGeneros(headers, parametros)

        dtGeneros = JsonConvert.DeserializeObject(Of DataTable)(response)

        ddlGender.DataSource = dtGeneros
        ddlGender.DataTextField = "desGenero"
        ddlGender.DataValueField = "idGenero"
        ddlGender.DataBind()
        ddlGender.Items.Insert(0, New ListItem("Seleccione un genero", "0"))
    End Sub

    Public Sub llenarDdlTiposDocumentos()
        Dim api = New DBapi()
        Dim registroPersonas = New Personas()
        Dim response = Nothing
        Dim result = Nothing
        Dim dtTiposDocumentos As New DataTable

        Dim headers = New List(Of Parametros) From {
           }

        Dim parametros = New List(Of Parametros)

        response = api.getTiposDocumentos(headers, parametros)

        dtTiposDocumentos = JsonConvert.DeserializeObject(Of DataTable)(response)

        ddlDocumentType.DataSource = dtTiposDocumentos
        ddlDocumentType.DataTextField = "des_tipo_documento"
        ddlDocumentType.DataValueField = "id_tipo_documento"
        ddlDocumentType.DataBind()
        ddlDocumentType.Items.Insert(0, New ListItem("Seleccione un tipos de identificacion", "0"))
    End Sub

    Public Function llenarGrvPersonas()
        Dim dtPersonas As DataTable
        Dim script As String
        dtPersonas = obtenerPersonas()
        If dtPersonas.Rows.Count > 10 Then
            grvPersonas.DataSource = dtPersonas
            grvPersonas.DataBind()
            FilaConsultas.Style("display") = ""
        Else
            script = "abrir_modal_Mensaje();"
            ScriptManager.RegisterStartupScript(Me, GetType(Page), "abrir_modal_Mensaje", script, True)
            lblTipoValidacion.Text = "Validacion"
            lblMensaje.Text = "No se puede Mostrar la informacion debe haber 10 registros ingresados"
        End If
    End Function

    Protected Sub btnNombresPersonas_Click(sender As Object, e As EventArgs) Handles btnNombresPersonas.Click
        llenarGrvPersonas()
        FilaGrPersonas.Style("display") = ""
    End Sub

    Private Function obtenerPersonas()
        Dim api = New DBapi()
        Dim response = Nothing
        Dim result = Nothing
        Dim dtpersonas As New DataTable

        Dim headers = New List(Of Parametros) From {
         }

        Dim parametros = New List(Of Parametros)

        response = api.getPersonas(headers, parametros)

        dtpersonas = JsonConvert.DeserializeObject(Of DataTable)(response)

        Return dtpersonas
    End Function
    Private Function obtenerM()
        Dim api = New DBapi()
        Dim response = Nothing
        Dim result = Nothing
        Dim dtpersonas As New DataTable

        Dim headers = New List(Of Parametros) From {
         }

        Dim parametros = New List(Of Parametros)

        response = api.getTotalM(headers, parametros)

        dtpersonas = JsonConvert.DeserializeObject(Of DataTable)(response)

        Return dtpersonas
    End Function
    Private Function obtenerH()
        Dim api = New DBapi()
        Dim response = Nothing
        Dim result = Nothing
        Dim dtpersonas As New DataTable

        Dim headers = New List(Of Parametros) From {
         }

        Dim parametros = New List(Of Parametros)

        response = api.getTotalH(headers, parametros)

        dtpersonas = JsonConvert.DeserializeObject(Of DataTable)(response)

        Return dtpersonas
    End Function
    Private Function obtenerPromedio()
        Dim api = New DBapi()
        Dim response = Nothing
        Dim result = Nothing
        Dim dtpersonas As New DataTable

        Dim headers = New List(Of Parametros) From {
         }

        Dim parametros = New List(Of Parametros)

        response = api.getPromedio(headers, parametros)

        dtpersonas = JsonConvert.DeserializeObject(Of DataTable)(response)

        Return dtpersonas
    End Function
    Private Function obtenerMayor()
        Dim api = New DBapi()
        Dim response = Nothing
        Dim result = Nothing
        Dim dtpersonas As New DataTable

        Dim headers = New List(Of Parametros) From {
         }

        Dim parametros = New List(Of Parametros)

        response = api.getNombreMayor(headers, parametros)

        dtpersonas = JsonConvert.DeserializeObject(Of DataTable)(response)

        Return dtpersonas
    End Function


    Protected Sub btnConsultarMujeres_Click(sender As Object, e As EventArgs) Handles btnConsultarMujeres.Click
        Dim dt As DataTable

        dt = obtenerM()

        lblMensajeM.Text = dt.Rows(0)("mensaje").ToString

    End Sub


    Protected Sub btnConsultarHombres_Click(sender As Object, e As EventArgs) Handles btnConsultarHombres.Click
        Dim dt As DataTable

        dt = obtenerH()

        lblHombres.Text = dt.Rows(0)("mensaje").ToString
    End Sub

    Protected Sub btnMayor_Click(sender As Object, e As EventArgs) Handles btnMayor.Click
        Dim dt As DataTable

        dt = obtenerMayor()

        lblMayor.Text = dt.Rows(0)("nombres").ToString
    End Sub

    Protected Sub btnPromedio_Click(sender As Object, e As EventArgs) Handles btnPromedio.Click
        Dim dt As DataTable

        dt = obtenerPromedio()

        lblPromedio.Text = dt.Rows(0)("Promedio").ToString
    End Sub
End Class