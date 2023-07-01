<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AgregarLectura.aspx.cs" Inherits="MedidoresInteligentes.AgregarLectura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">

    <div class="row">
        <div class="col-lg-6 mx-auto">
            
            <div class="card">
                <div class="card custom-card text-white">
                    <h3 style="text-align: center">Agregar Lectura</h3>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <strong for="medidorDbl">Medidor:</strong> 
                        <asp:DropDownList ID="medidorDbl" CssClass="form-select" runat="server" AppendDataBoundItems="true">
                            <asp:ListItem Text="Seleccione un medidor de la lista"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="medidorValidator" runat="server" ControlToValidate="medidorDbl" ErrorMessage="Seleccione un medidor de la lista" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <strong for="calendarTxt">Elegir fecha:</strong>
                        <asp:Calendar ID="calendartxt" CssClass="calendar" runat="server"></asp:Calendar>
                    </div>

                    <div class="form-group">
    <strong for="horaTxt">Hora:</strong>
    <asp:TextBox ID="horatxt" CssClass="form-control" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="horaValidator" runat="server" ControlToValidate="horatxt" ErrorMessage="Debe ingresar la hora" CssClass="text-danger" Display="Dynamic" ValidationGroup="formularioGroup"></asp:RequiredFieldValidator>
    <asp:RangeValidator ID="horaRangeValidator" runat="server" ControlToValidate="horatxt" Type="Integer" MinimumValue="0" MaximumValue="23" ErrorMessage="Sólo valores entre 0 y 23" CssClass="text-danger" Display="Dynamic" ValidationGroup="formularioGroup"></asp:RangeValidator>
</div>


                    <div class="form-group">
                        <strong for="minutoTxt">Minuto:</strong>
                        <asp:TextBox ID="minutotxt" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RangeValidator ID="minutoValidator" runat="server" ControlToValidate="minutotxt" Type="Integer" MinimumValue="0" MaximumValue="59" ErrorMessage="Sólo valores entre 0 y 59" CssClass="text-danger" Display="Dynamic"></asp:RangeValidator>
                        
                    </div>

                    <div class="form-group">
                        <strong for="consumoTxt">Valor consumo:</strong>
                        <asp:TextBox ID="consumotxt" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RangeValidator ID="consumoValidator" runat="server" ControlToValidate="consumotxt" Type="Double" MinimumValue="0" MaximumValue="600" ErrorMessage="Sólo valores entre 0 y 600" CssClass="text-danger" Display="Dynamic"></asp:RangeValidator>
                    </div>

                    <div class="container mt-1 col">
                        <asp:Button runat="server" ID="agregarBtn" OnClick="agregarBtn_Click" text="Agregar" CssClass="btn btn-success"></asp:Button>
                    </div>
                    <div class="alert">
                        <asp:Label runat="server" id="mensajesLbl" CssClass="text-success"></asp:Label>
                        <asp:Label runat="server" id="mensajesError" CssClass="text-danger"></asp:Label>
                    </div>
                </div>
            </div>

        </div>

    </div>

</asp:Content>
