using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedidoresInteligentesModel
{
    public class Medidor
    {
        private string tipo;
        private string serie;

        public string Tipo { get => tipo; set => tipo = value; }
        public string Serie { get => serie; set => serie = value; }
    }
}
