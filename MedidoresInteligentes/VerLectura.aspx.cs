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
    public partial class VerLectura : System.Web.UI.Page
    {
        private IMedidorDAL medidorDAL = new MedidorDALObjetos();
        private ILecturaDAL lecturasDAL = new LecturaDALObjetos();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Cargar el filtro de medidores y la grilla de lecturas al cargar la página por primera vez
                FiltroMedidor();
                CargarGrilla();
            }
        }

        protected void CargarGrilla()
        {
            // Obtener todas las lecturas
            List<Lectura> lecturas = lecturasDAL.Obtener();

            // Obtener el medidor seleccionado en el filtro
            string medidorSeleccionado = filtroMedidores.SelectedValue;

            // Filtrar las lecturas según el medidor seleccionado
            if (!string.IsNullOrEmpty(medidorSeleccionado) && medidorSeleccionado != "Todos")
            {
                // Utilizar una comparación insensible a mayúsculas y minúsculas para el valor del medidor
                lecturas = lecturas.Where(l => l.Medidortipo.Serie.Trim().Equals(medidorSeleccionado.Trim(), StringComparison.OrdinalIgnoreCase)).ToList();
            }

            // Asignar las lecturas filtradas a la fuente de datos de la grilla y enlazar los datos
            this.grillaLectura.DataSource = lecturas;
            this.grillaLectura.DataBind();
        }

        protected void FiltroMedidor()
        {
            // Obtener la lista de medidores
            List<Medidor> medidores = medidorDAL.ObtenerMedidores();

            // Asignar los medidores como fuente de datos del filtro de medidores y configurar los campos de texto y valores
            this.filtroMedidores.DataSource = medidores;
            this.filtroMedidores.DataTextField = "Tipo";
            this.filtroMedidores.DataValueField = "Serie";
            this.filtroMedidores.DataBind();
        }

        protected void filtroMedidores_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Cuando se selecciona un medidor en el filtro, cargar la grilla de lecturas con las lecturas filtradas
            CargarGrilla();
        }
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            CargarGrilla();
        }

    }
}
