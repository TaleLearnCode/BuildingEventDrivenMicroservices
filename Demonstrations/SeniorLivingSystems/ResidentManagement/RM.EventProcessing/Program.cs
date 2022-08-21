using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using SLS.RM.Repository;

var host = new HostBuilder()
	.ConfigureFunctionsWorkerDefaults()
	.ConfigureServices(s =>
	{
		s.AddSingleton((s) => { return new ResidentManagementContext("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=BEDM_ResidentManagement;Persist Security Info=True"); });
	})
	.Build();

host.Run();