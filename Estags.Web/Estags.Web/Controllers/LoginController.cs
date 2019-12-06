
using Estags.Web.Models;
using Microsoft.AspNetCore.Mvc;

namespace Estags.Web.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                if (model.Usuario == "william" && model.Senha == "senha")
                {
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("Usuario", "Usuário ou senha inválida");
                }
            }
            return View("Index");
        }
    }
}