# docker-aws-api-import

Lets you create or update Amazon API Gateway APIs from a Swagger or RAML API representation.

## Usage

    docker run --rm \
      && -v ~/.aws/credentials:/root/.aws/credentials \
      && -v `pwd`:/HOST_DIR \
      && alexisno/aws-api-import <ARGS>

* Inject your AWS credentials and/or config in the container using a volume:
  * `-v ~/.aws/credentials:/root/.aws/credentials`
  * `-v ~/.aws/config:/root/.aws/config` see the default (config file)[./root/.aws/config]
* Inject the API representation file using another volume: `-v `pwd`:/HOST_DIR`.
* Use the arguments you would normaly use with (aws-api-import)[https://github.com/awslabs/aws-apigateway-importer]. Don't forget to specify the paths using the volume cited above. Examples:
  * `-c /HOST_DIR/path/to/api.raml`
  * `-update API_ID --deploy STAGE_NAME /HOST_DIR/path/to/swagger.yaml`
