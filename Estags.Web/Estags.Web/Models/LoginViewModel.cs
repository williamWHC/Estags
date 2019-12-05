using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Estags.Web.Models
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = "Nome do usuário obrigatório")]
        public string Usuario { get; set; }

        [Required(ErrorMessage = "Senha obrigatória")]
        public string Senha { get; set; }
        [Compare("Senha", ErrorMessage = "As senhas não conferem")]
        public string RepitaSenha { get; set; }


    }
}
