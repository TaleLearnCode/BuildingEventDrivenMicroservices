using Microsoft.Azure.Functions.Worker;
using Microsoft.Extensions.Logging;
using SLS.EventMessages;
using SLS.EventMessages.CM;
using SLS.LM.Repository;
using System.Text.Json;

namespace SLS.LM.EventProcessing;

public class CareManagement
{

	private readonly ILogger _logger;
	private readonly LeaseManagementContext _context;

	public CareManagement(
		ILoggerFactory loggerFactory,
		LeaseManagementContext leaseManagementContext)
	{
		_logger = loggerFactory.CreateLogger<CareManagement>();
		_context = leaseManagementContext;
	}

	[Function("CareManagement")]
	public async Task RunAsync([EventHubTrigger("care-management", Connection = "EventHubConnectionString", ConsumerGroup = "lease-management")] string[] messages)
	{
		_logger.LogInformation($"First Event Hubs triggered message: {messages[0]}");

		foreach (string message in messages)
		{
			EventMessage? eventMessage = JsonSerializer.Deserialize<EventMessage>(message);
			if (eventMessage is not null)
			{
				if (eventMessage.MessageType == nameof(ResidentCareTypeChange))
				{
					await EventServices.ChangeResidentCareType.Process(_context, message);
				}
			}
		}

	}

}