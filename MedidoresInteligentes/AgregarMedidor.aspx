<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AgregarMedidor.aspx.cs" Inherits="MedidoresInteligentes.AgregarMedidor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <div class="row">
        <div class="col-lg-6 mx-auto container mt-1 col form-outline">

            
            <div class="card custom-card">
                <div class=" text-white card custom-card">
                    <h3 style="text-align: center">Agregar Medidor</h3>
                </div>
          
    <asp:Label runat="server" ID="mensajesLbl" CssClass="text-success"></asp:Label>
</div>
                <div class="card-body">


                    <div class="form-group">
    <strong for="tipoTxt">Tipo de medidor (Analógico - Digital):</strong>
    <asp:TextBox ID="tipotxt" CssClass="form-control" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="medidorValidator" runat="server" ControlToValidate="tipotxt" ErrorMessage="Campo faltante" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
</div>

<div class="form-group">
    <strong for="serieTxt">Número de serie: </strong>
    <asp:TextBox ID="serietxt" CssClass="form-control" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="serieValidator" runat="server" ControlToValidate="serietxt" ErrorMessage="Campo faltante" CssClass="text-danger" Display="Dynamic"></asp:RequiredFieldValidator>
</div>

                    <div class="container mt-1">
                        <asp:Button runat="server" ID="agregarBtn" OnClick="agregarBtn_Click" text="Agregar" CssClass="btn btn-success"></asp:Button>
                    </div>
                             <div class="alert">
    <div id="errorContainer" runat="server" visible="false">
        <div class="alert alert-danger">
            <asp:Label runat="server" ID="mensajesError" CssClass="text-danger"></asp:Label>
        </div>
    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
