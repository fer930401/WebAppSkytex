using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Skytex.Startup))]
namespace Skytex
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
