using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using SLS.RM.Repository;

var host = new HostBuilder()
	.ConfigureFunctionsWorkerDefaults()
	.ConfigureServices(s =>
	{
		s.AddSingleton((s) => { return new ResidentManagementContext("Data Source=(localdb)\\mssqllocaldb;Initial Catalog=BEDM_ResidentManagement;Persist Security Info=True"); });
	})
	.Build();

host.Run();