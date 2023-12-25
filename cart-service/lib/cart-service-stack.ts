import * as cdk from 'aws-cdk-lib';
import { Construct } from 'constructs';
import * as lambda from 'aws-cdk-lib/aws-lambda';
import * as apigateway from 'aws-cdk-lib/aws-apigateway';

export class CartServiceStack extends cdk.Stack {
  constructor(scope: Construct, id: string, props?: cdk.StackProps) {
    super(scope, id, props);

    const lambdaFunction = new lambda.Function(this, 'CartLambdaFunction', {
      runtime: lambda.Runtime.NODEJS_14_X,
      handler: 'main.handler',
      code: lambda.Code.fromAsset('../dist'),
    });

    const api = new apigateway.RestApi(this, 'CartLambdaApi', {
      restApiName: 'CartLambdaApi',
    });

    const cart = new apigateway.LambdaIntegration(lambdaFunction);

    const resource = api.root.addResource('{proxy+}');
    resource.addMethod('ANY', cart);
  }
}
