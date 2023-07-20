using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MixMashter.Api.Models;
using MixMashter.Api.Models.Command;
using MixMashter.Api.Models.Repositories;
using System.Windows.Input;
using Tool.Cqs.Commands;
using Tools.CQS.Command;

namespace MixMashter.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthRepository _authRepository;
        private readonly ILogger _logger;

        public AuthController(IAuthRepository authRepository, ILogger<AuthController> logger)
        {
            _authRepository = authRepository;
            _logger = logger;
        }

        [HttpPost ("Register")]
        public IActionResult Register([FromBody]RegisterForm form )
        {
            _logger.LogInformation($"New User Registered : {form.FirstName} {form.LastName} as {form.UserName} ({form.Email}) ");
            ICommandResult result = _authRepository.Execute(new RegisterCommand(form.FirstName, form.LastName, form.UserName, form.Email, form.BirthDate, form.Passwd));

            if (result.IsFailure)
            {
                _logger.LogError(result.Message);
                return BadRequest();
            }


            return NoContent();
        }

    }
}
