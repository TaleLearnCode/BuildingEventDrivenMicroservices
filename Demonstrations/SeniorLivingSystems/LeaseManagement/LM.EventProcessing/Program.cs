using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using SLS.LM.Repository;

var host = new HostBuilder()
	.ConfigureFunctionsWorkerDefaults()
	.ConfigureServices(s =>
	{
		s.AddSingleton((s) => { return new LeaseManagementContext("Data Source=(localdb)\\mssqllocaldb;Initial Catalog=BEDM_LeaseManagement;Persist Security Info=True"); });
	})
	.Build();

host.Run();