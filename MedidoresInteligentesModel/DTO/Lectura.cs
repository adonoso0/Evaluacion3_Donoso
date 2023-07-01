using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedidoresInteligentesModel
{
    public class Lectura
    {
        private Medidor medidortipo;
        private DateTime fechaLectura;
        private string horaLectura;
        private decimal valorConsumo;

        public Medidor Medidortipo { get => medidortipo; set => medidortipo = value; }
        public DateTime FechaLectura { get => fechaLectura; set => fechaLectura = value; }
        public string HoraLectura { get => horaLectura; set => horaLectura = value; }
        public decimal ValorConsumo { get => valorConsumo; set => valorConsumo = value; }
        
    }

}
