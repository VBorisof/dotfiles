namespace Manageme.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class NAMEController : ControllerBase
    {
        public NAMEController() { }


        [HttpGet]
        [SwaggerResponse((int) HttpStatusCode.OK, "Okay", typeof(string))]
        public IActionResult Get()
        {
            return this.FromServiceResult(
            
            );
        }
    }
}
