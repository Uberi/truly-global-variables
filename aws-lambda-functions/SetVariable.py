import boto3
import json
import re

# this is exposed at https://taadt2w2i0.execute-api.us-east-1.amazonaws.com/prod/SetVariable using an AWS API Gateway trigger

def lambda_handler(event, context):
    if not re.match(r"^[a-zA-Z_]\w*$", event["variable"]):
        raise ValueError("Bad variable name: must be a valid identifier")
    variables = boto3.resource("dynamodb", region_name="us-east-1").Table("galacticvariables-mobilehub-981538607-variables")
    return variables.put_item(Item={"variable": event["variable"], "value": event["value"]})