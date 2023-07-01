<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="VerLectura.aspx.cs" Inherits="MedidoresInteligentes.VerLectura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="card">
                <div class="card custom-card text-white">
                    <h3 style="text-align: center">Lecturas</h3>
                </div>
                <div class="card-body">
                    <asp:ScriptManager ID="ScriptManager1" runat="server" />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="form-group">
                                <strong for="filtroMedidores">Filtrar lecturas de:</strong> 
                                <asp:DropDownList ID="filtroMedidores" CssClass="form-select" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="filtroMedidores_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Text="Todos"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar lecturas"  CssClass="btn btn-primary " OnClick="btnActualizar_Click" />
                            </div>

                            <asp:GridView CssClass="table table-hover table-bordered" runat="server" AutoGenerateColumns="false" id="grillaLectura">
                                <Columns>
                                    <asp:BoundField DataField="Medidortipo.Tipo" HeaderText="Medidor" />
                                    <asp:BoundField DataField="FechaLectura" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />
                                    <asp:BoundField DataField="HoraLectura" HeaderText="Hora y Minutos" />
                                    <asp:BoundField DataField="ValorConsumo" HeaderText="Consumo" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="filtroMedidores" EventName="SelectedIndexChanged" />
                            <asp:AsyncPostBackTrigger ControlID="btnActualizar" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
