## AWS Global DynamoDB Table

### Variables

`env` - type: string - default = "dev"

`hash_key` - type: string

`hash_key_datatype` - type: string - default = "S"

`name` - type: string

`pitr` - type: string - default = "true"

`range_key_datatype` - type: string - default = "N"

`range_key` - type: string

`region` - type: string - default = "us-east-1"

`sse` - type: string - default = "true"

`ttl` - type: string - default = "false"

`ttl_attribute` - type: string - default = "TimeToLive"

Requires the providers mentioned or you can go through and and change the providers and update the modules if you need to add/remove/update regions.

### example

```
module "ddb_oauth_tokens" {
  source = "../modules/dynamodb_global_table"

  providers = {
    aws.us-east-1 = "aws.us-east-1"
    aws.us-west-2 = "aws.us-west-2"
  }

  env       = "${var.env}"
  hash_key  = "tokenId"
  name      = "OAuthTokens"
  range_key = "lastRefresh"
  region    = "${var.region}"
  ttl       = "true"
}
```
