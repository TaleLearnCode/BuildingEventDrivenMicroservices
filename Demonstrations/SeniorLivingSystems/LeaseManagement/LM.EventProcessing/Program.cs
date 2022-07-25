var host = new HostBuilder()
	.ConfigureFunctionsWorkerDefaults()
	.ConfigureServices(s =>
	{
		s.AddSingleton((s) => { return new LeaseManagementContext("Data Source=(localdb)\\mssqllocaldb;Initial Catalog=BEDM_LeaseManagement;Persist Security Info=True"); });
	})
	.Build();

host.Run();