<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="RegistroPersonas.aspx.vb" Inherits="AppTest.RegistroPersonas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>AppTest</title>
    <link href="../css/Estilo_modal_mensaje.css" rel="stylesheet" />
    <link href="../css/Estilo_Modal_small.css" rel="stylesheet" />
    <link href="../css/normalize.css" rel="stylesheet" />
    <link href="../css/styles.css" rel="stylesheet" />
    <script type="text/javascript">
        function Cerrar_Boostrap() {
            //cierra el modal Bootstrap
            $('#currentdetail').modal('hide');
            $('.modal-backdrop').hide();
            //fin cierre modal Bootstrap 
        }

        function abrir_modal_Mensaje() {
            //document.getElementById("Modal_5").click();
            document.getElementById("popup_Mensaje").style.display = 'flex';
        }
        function OcultarModalMensaje() {
            document.getElementById("popup_Mensaje").style.display = 'none';
        }
        function abrir_modal_Small() {
            //document.getElementById("Modal_5").click();
            document.getElementById("popup_solicitud").style.display = 'flex';
        }
        function OcultarModalSmall() {
            document.getElementById("popup_solicitud").style.display = 'none';
        }

    </script>
    <style type="text/css">
        .auto-style1 {
            width: 50%;
            text-align: right;
            height: 29px;
        }
        .auto-style2 {
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>AppTest</h1>
            <h2>Agregar Persona</h2>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table width="100%" runat="server">
                        <tr>
                            <td class="etiqueta">
                                <asp:Label ID="lblDocumentType" runat="server" Text="Tipo Documento:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlDocumentType">
                                </asp:DropDownList>
                            </td>
                            <td class="etiqueta">
                                <asp:Label ID="lblNumerDocument" runat="server" Text="Numero Documento:"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtNumberDocument" runat="server" TextMode="Number"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="etiqueta">
                                <asp:Label ID="lblFirstName" runat="server" Text="Primer Nombre:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                            </td>
                            <td class="etiqueta">
                                <asp:Label ID="lbllastName" runat="server" Text="Segundo Nombre:"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="txtSecondName" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <asp:Label ID="lblFirstLastName" runat="server" Text="Primer Apellido:"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtFirstLastName" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style1">
                                <asp:Label ID="lblSecondLastName" runat="server" Text="Segundo Apellido:"></asp:Label>
                            </td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtSecondLastName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="etiqueta">
                                <asp:Label ID="lblNumberPhone" runat="server" Text="Numero Telefono:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNumberPhone" runat="server" TextMode="Number"></asp:TextBox>
                            </td>
                            <td class="etiqueta">
                                <asp:Label ID="lblMail" runat="server" Text="Correo Electronico:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMail" runat="server" TextMode="Email"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="etiqueta">
                                <asp:Label ID="lblAddress" runat="server" Text="Direccion:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                            </td>
                            <td class="etiqueta">
                                <asp:Label ID="lblAge" runat="server" Text="Edad:"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAge" runat="server" TextMode="Number"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="etiqueta">
                                <asp:Label ID="lblGender" runat="server" Text="Genero:"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlGender">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td id="filaBoton" class="FilaBoton" colspan="2">
                                <asp:Button ID="btnAgregar" runat="server" Text="Registrar" CssClass="boton" />
                            </td>
                            <td  align="center" colspan="2">
                                <asp:Button CssClass="boton" ID="btnNombresPersonas" runat="server" text="Consultar Personas"/>
                            </td>
                        </tr>
                        <tr id="FilaGrPersonas">
                            <td colspan="4">
                                <asp:GridView ID="grvPersonas" CssClass="grvPedidos" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Tipo Documento" DataField="tipoDocumento" >
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="numero_documento" DataField="numero_documento" >
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Nombres" DataField="Nombres" >
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" >
                                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr id="FilaConsultas">
                            <td align="center" width="15%" >
                                <asp:Button CssClass="boton" ID="btnConsultarMujeres" runat="server" text="Consultar numero de mujeres"/>
                                <asp:Label ID="lblMensajeM" runat="server"></asp:Label>
                            </td>
                            <td  align="center" width="15%">
                                <asp:Button CssClass="boton" ID="btnConsultarHombres" runat="server" text="Consultar numero de hombres "/>
                                 <asp:Label ID="lblHombres" runat="server"></asp:Label>
                            </td>
                            <td align="center" width="15%">
                                <asp:Button  CssClass="boton" ID="btnMayor" runat="server" text="Consultar"/>
                                <asp:Label ID="lblMayor" runat="server"></asp:Label>
                            </td>
                            <td align="center" width="15%">
                                <asp:Button CssClass="boton" ID="btnPromedio" runat="server" text="Consultar promedio edad"/>
                                <asp:Label ID="lblPromedio" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <%--Inicio Modal Mensaje--%>
                    <div class="page_Mensaje" style="display: none">
                        <div class="page__container_Mensaje">
                            <a id="Modal_5" href="#popup_Mensaje" class="open-popup_Mensaje" visible="false">open</a>
                        </div>
                    </div>
                    <div id="popup_Mensaje" class="popup_Mensaje">
                        <div class="popup__block_Mensaje">
                            <%--<a href="#" class="popup__close_small">close</a>--%>
                            <asp:Label ID="lblCerrarModal" runat="server" class="popup__close_Mensaje" onclick="OcultarModalMensaje()"></asp:Label>
                            <div class="popup_contenido">
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate>
                                        <div class="datagrid">
                                            <table runat="server" width="100%">
                                                <thead>
                                                    <tr>
                                                        <th align="center" class="filaValidadion">
                                                            <asp:Label runat="server" ID="lblTipoValidacion" CssClass="tipoValidacion">Confirmacion</asp:Label>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td align="center" class="filaMensaje">
                                                            <asp:Label ID="lblMensaje" runat="server" CssClass="Mensaje"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" class="filaBtnValidacion">
                                                            <asp:Button runat="server" ID="Button1" Text="Aceptar" CssClass="boton botonValidacion" />
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                    <%--Fin Modal Mensaje--%>
                  
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
