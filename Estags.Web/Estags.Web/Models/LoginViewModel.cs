
using System.ComponentModel.DataAnnotations;


namespace Estags.Web.Models
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = "Nome do usuário obrigatório")]    //Cmapo Obrigatorio
        public string Usuario { get; set; }

        [Required(ErrorMessage = "Senha obrigatória")]              //Campo Obrigatorio
        public string Senha { get; set; }
        //[Compare("Senha", ErrorMessage = "As senhas não conferem")] //Comparação entre as senhas
       


    }
}
