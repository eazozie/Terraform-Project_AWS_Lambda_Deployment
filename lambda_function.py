import json

def lambda_handler(event, context):
    """
    This function demonstrates a basic AWS Lambda handler in Python.
    
    :param event: The event data (usually a dict, often from API Gateway or S3)
    :param context: Runtime information about the Lambda function
    :return: A dictionary representing an HTTP response
    """
    # Log the event for debugging purposes
    print("Received event: " + json.dumps(event, indent=2))

    # Process the event data
    # For example, if triggered by API Gateway, the event might have a 'body'
    
    response_body = {
        "message": "Hello from Lambda!",
        "input": event
    }
    
    return {
        'statusCode': 200,
        'body': json.dumps(response_body)
    }
