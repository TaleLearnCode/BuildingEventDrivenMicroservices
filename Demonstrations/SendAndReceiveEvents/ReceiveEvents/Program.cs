﻿// Depends on Azure.Messaging.EventHubs
// Depends on Azure.Messaging.EventHubs.Processor

// Settings
string eventHubsConnectionString = Environment.GetEnvironmentVariable("SendAndRecieveEvents_EventHubConnectionString");
const string eventHubName = "sendandreceive";
string blobStorageConnectionString = Environment.GetEnvironmentVariable("SendAndReceiveEvents_StorageConnectionString");
const string blobContainerName = "checkpoint";

// Read from the default consumer group: $Default
string consumerGroup = EventHubConsumerClient.DefaultConsumerGroupName;

// Create a blob container client that the event processor will use
BlobContainerClient storageClient = new(blobStorageConnectionString, blobContainerName);

// Create an event processor client to process events in the event hub
EventProcessorClient processorClient = new(storageClient, consumerGroup, eventHubsConnectionString, eventHubName);

// Register handlers for processing events and handling errors
processorClient.ProcessEventAsync += ProcessEventHandler;
processorClient.ProcessErrorAsync += ProcessErrorHandler;

// Start processing
await processorClient.StartProcessingAsync();

// Wait for 30 seconds for the events to be processed
await Task.Delay(TimeSpan.FromSeconds(30));

// Stop the processing
await processorClient.StopProcessingAsync();

async Task ProcessEventHandler(ProcessEventArgs eventArgs)
{

	// Write the body of the event to the console window
	Console.WriteLine("\tReceived event: {0}", Encoding.UTF8.GetString(eventArgs.Data.EventBody.ToArray()));

	// Update checkpoint in the blob storage so that the app receives only new events the next time it's run
	await eventArgs.UpdateCheckpointAsync(eventArgs.CancellationToken);

}

Task ProcessErrorHandler(ProcessErrorEventArgs eventArgs)
{
	// Write details about the error to the console window
	Console.WriteLine($"\tPartition '{eventArgs.PartitionId}': an unhandled exception was encountered.  This was not expected to happen.");
	Console.WriteLine(eventArgs.Exception.Message);
	return Task.CompletedTask;
}