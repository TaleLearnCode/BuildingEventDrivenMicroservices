using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using SLS.PM.Repository;

var host = new HostBuilder()
	.ConfigureFunctionsWorkerDefaults()
	.ConfigureServices(s =>
	{
		s.AddSingleton((s) => { return new PortfolioManagementContext("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=BEDM_PortfolioManagement;Persist Security Info=True"); });
	})
	.Build();

host.Run();