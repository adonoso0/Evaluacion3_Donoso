using MedidoresInteligentesModel;
using MedidoresInteligentesModel.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedidoresInteligentes
{
    public partial class AgregarLectura : System.Web.UI.Page
    {
        // Declaración de instancias de las clases de acceso a datos
        private ILecturaDAL lecturaDAL = new LecturaDALObjetos();
        private IMedidorDAL medidorDAL = new MedidorDALObjetos();

        // Método que se ejecuta cuando se carga la página
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Obtener la lista de medidores y asignarla al DropDownList
                List<Medidor> medidores = medidorDAL.ObtenerMedidores();
                this.medidorDbl.DataSource = medidores;
                this.medidorDbl.DataTextField = "Tipo";
                this.medidorDbl.DataValueField = "Serie";
                this.medidorDbl.DataBind();
            }
        }

        // Evento del botón "Agregar" al hacer clic
        protected void agregarBtn_Click(object sender, EventArgs e)
        {
            // Verificar si la página es válida según las validaciones definidas
            if (Page.IsValid)
            {
                // Obtener los valores de los campos del formulario
                DateTime fechaLectura = Convert.ToDateTime(this.calendartxt.SelectedDate);
                string horaLectura = this.horatxt.Text + ":" + this.minutotxt.Text;

                // Validar el campo de selección del medidor
                string medidorValor = this.medidorDbl.SelectedValue;
                string medidorText = this.medidorDbl.SelectedItem.Text;
                if (string.IsNullOrEmpty(medidorText) || medidorText.Trim() == "Seleccione un medidor de la lista")
                {
                    this.mensajesError.Text = "Debe elegir un medidor de la lista (si no hay ninguno, debe agregar uno)";
                    return;
                }

                // Validar el campo de la hora
                int hora;
                if (!int.TryParse(this.horatxt.Text, out hora) || hora < 0 || hora > 23)
                {
                    this.mensajesError.Text = "Sólo valores entre 0 y 23";
                    return;
                }

                // Validar el campo del minuto
                int minuto;
                if (!int.TryParse(this.minutotxt.Text, out minuto) || minuto < 0 || minuto > 59)
                {
                    this.mensajesError.Text = "Sólo valores entre 0 y 59.";
                    return;
                }

                // Validar el campo del valor de consumo
                decimal valorConsumo;
                if (!decimal.TryParse(this.consumotxt.Text, out valorConsumo) || valorConsumo < 0 || valorConsumo > 600)
                {
                    this.mensajesError.Text = "Sólo valores entre 0 y 600.";
                    return;
                }

                // Obtener la lista de medidores
                List<Medidor> medidores = medidorDAL.ObtenerMedidores();

                // Encontrar el medidor seleccionado
                Medidor medidor = medidores.Find(m => m.Serie == this.medidorDbl.SelectedItem.Value);

                // Crear el objeto Lectura con los valores obtenidos
                Lectura lectura = new Lectura()
                {
                    Medidortipo = medidor,
                    FechaLectura = fechaLectura,
                    HoraLectura = horaLectura,
                    ValorConsumo = valorConsumo
                };

                // Agregar la lectura utilizando el DAL correspondiente
                lecturaDAL.Agregar(lectura);

                // Mostrar mensaje de éxito
                this.mensajesLbl.Text = "Medidor guardado correctamente";
                Response.Redirect("VerLectura.aspx");
            }
        }
    }
}
