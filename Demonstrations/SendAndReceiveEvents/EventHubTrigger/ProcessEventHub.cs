using Microsoft.Azure.Functions.Worker;
using Microsoft.Extensions.Logging;

namespace Company.Function;

public class ProcessEventHub
{
	private readonly ILogger _logger;

	public ProcessEventHub(ILoggerFactory loggerFactory)
	{
		_logger = loggerFactory.CreateLogger<ProcessEventHub>();
	}

	[Function("ProcessEventHub")]
	public void Run([EventHubTrigger("sendandreceive", Connection = "EventHubConnectionString")] string[] messages)
	{
		foreach (string message in messages)
			_logger.LogInformation($"Event Hub Message Received: {message}");
	}

}