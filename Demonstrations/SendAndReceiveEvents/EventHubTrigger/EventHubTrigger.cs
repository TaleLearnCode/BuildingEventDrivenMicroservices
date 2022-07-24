using Microsoft.Azure.Functions.Worker;
using Microsoft.Extensions.Logging;

namespace Company.Function;

public class EventHubTrigger
{

	private readonly ILogger _logger;

	public EventHubTrigger(ILoggerFactory loggerFactory)
	{
		_logger = loggerFactory.CreateLogger<EventHubTrigger>();
	}

	[Function("EventHubTrigger")]
	public void Run([QueueTrigger("sendandreceive", Connection = "EventHubConnectionString")] string myQueueItem)
	{
		_logger.LogInformation($"Processing EventHub Message: {myQueueItem}");
	}

}