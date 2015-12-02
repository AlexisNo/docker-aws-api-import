# docker-aws-api-import

Use [`aws-api-import`](https://github.com/awslabs/aws-apigateway-importer) in a docker container.
Lets you create or update Amazon API Gateway APIs from a Swagger or RAML API representation.


## Set AWS credentials and config

### Using environment variables

You can pass environment variables to the container to set your AWS credentials and/or config

    docker run --rm \
      -e AWS_ACCESS_KEY_ID=******************** \
      -e AWS_SECRET_ACCESS_KEY=**************************************** \
      -e AWS_DEFAULT_REGION=us-east-1 \
      alexisno/aws-api-import <ARGS>

`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` have to be both specified to be effective.


### Using volumes

Alternatively , you can inject your AWS credentials and/or config in the container using a volume.

    docker run --rm \
      -v ~/.aws/credentials:/root/.aws/credentials \
      -v ~/.aws/config:/root/.aws/config \
      alexisno/aws-api-import <ARGS>

See the default [config file](./root/.aws/config).


## Execute `aws-api-import`

Inject the API representation file using a volume: ``-v `pwd`/path/to/swagger.json:/swagger.json``.

    docker run --rm \
      -e AWS_ACCESS_KEY_ID=******************** \
      -e AWS_SECRET_ACCESS_KEY=**************************************** \
      -e AWS_DEFAULT_REGION=us-east-1 \
      -v `pwd`/path/to/swagger.js:/swagger.json
      alexisno/aws-api-import <ARGS>

Use the arguments you would normally use with [`aws-api-import`](https://github.com/awslabs/aws-apigateway-importer). Don't forget to use the volume cited above to specify the path to the definition file.

`<ARGS>` examples:

 * `-c /swagger.json`
 * `--update <API_ID> --deploy <STAGE_NAME> /swagger.json`
