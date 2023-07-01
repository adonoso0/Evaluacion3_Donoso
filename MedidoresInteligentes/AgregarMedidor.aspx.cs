using MedidoresInteligentesModel.DAL;
using MedidoresInteligentesModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedidoresInteligentes
{
    public partial class AgregarMedidor : System.Web.UI.Page
    {
        private IMedidorDAL medidorDAL = new MedidorDALObjetos();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }

        protected void agregarBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Obtener los datos del formulario
                string tipo = this.tipotxt.Text.Trim();
                string serie = this.serietxt.Text.Trim();

                // Validar que los campos no estén vacíos usando RequiredFieldValidator
                if (Page.IsValid)
                {
                    // Verificar si el número de serie ya existe en la lista de medidores
                    List<Medidor> medidores = medidorDAL.ObtenerMedidores();
                    bool existente = medidores.Any(m => m.Serie.Equals(serie));
                    if (existente)
                    {
                        this.mensajesError.Text = "El número de serie ya existe";
                        this.errorContainer.Visible = true; // Mostrar el contenedor de error
                        return;
                    }

                    // Construir el objeto Medidor
                    Medidor medidor = new Medidor()
                    {
                        Tipo = tipo,
                        Serie = serie
                    };

                    // Llamar al método Agregar del DAL
                    medidorDAL.Agregar(medidor);

                    // Mostrar mensaje de éxito usando JavaScript ....plot twist: no se ve en el navegador
                    string script = @"<script>
                                window.onload = function () {
                                    alert('Los datos fueron añadidos correctamente.');
                                }
                            </script>";
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", script);

                    // Redireccionar a la página "VerMedidores"
                    Response.Redirect("VerMedidores.aspx");
                }
                else
                {
                    this.errorContainer.Visible = true; // Mostrar el contenedor de error
                }
            }
        }

    }
}
