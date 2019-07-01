## Encrypted SNS to SQS

All communication between service endpoints in AWS is conducted by HTTPS, which means everything is encrypted in transit between services. However, by default SNS and SQS do not encrypt data that is **_at rest_** on their respective platform. This module will create the topic/queue + encryption key + IAM required for these services to operate in a more secure manner. Required for a lot of industries such as banking and healthcare.
