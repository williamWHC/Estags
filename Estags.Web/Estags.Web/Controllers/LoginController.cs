using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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
                if (model.Usuario == "Eric" && model.Senha == "teste")
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