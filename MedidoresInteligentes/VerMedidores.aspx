<%@ Page Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="VerMedidores.aspx.cs" Inherits="MedidoresInteligentes.VerMedidores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Contenido" runat="server">
    <div class="row">
        <div class="col-lg-6 mx-auto">
            <div class="card">
                <div class="card custom-card text-white">
                    <h3 style="text-align: center">Medidores</h3>
                </div>
                <div class="card-body">

                    <asp:GridView CssClass="table table-hover table-bordered" runat="server"
                        AutoGenerateColumns="false" id="grillaLectura">
                        <Columns>
                            <asp:BoundField DataField="Tipo" HeaderText="Tipo medidor" />
                            <asp:BoundField DataField="Serie" HeaderText="Número de serie" />
                        </Columns>

                    </asp:GridView>


                </div>
            </div>

        </div>

    </div>
</asp:Content>

