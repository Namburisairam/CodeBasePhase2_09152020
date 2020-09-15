using System;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Owin;

[assembly: OwinStartup(typeof(EventManagement.Startup))]

namespace EventManagement
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Login/Index")
            });
            //app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);
            //app.UseMicrosoftAccountAuthentication(new MicrosoftProvider().GetAuthenticationOptions());
            //app.UseTwitterAuthentication(new TwitterProvider().GetAuthenticationOptions());
            //app.UseFacebookAuthentication(new FacebookProvider().GetAuthenticationOptions());
            //app.UseGoogleAuthentication(new GoogleProvider().GetAuthenticationOptions());

            app.MapSignalR();
            //var idProvider = new CustomUserIdProvider();
            //GlobalHost.DependencyResolver.Register(typeof(IUserIdProvider), () => idProvider);
        }
    }
}
