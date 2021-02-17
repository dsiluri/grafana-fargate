module "grafana" {
  source = "git@github.com:ulikabbq/grafana-fargate?ref=v1.0//tf"

  dns_zone      = "ZZ7C1JZLM75QT"
  region        = "eu-west-1"
  vpc_id        = "vpc-04e9a561"
  lb_subnets    = ["subnet-6ef25245", "subnet-32089345"]
  subnets       = ["subnet-28fd4671", "subnet-8ad27ca4"]
  db_subnet_ids = ["subnet-6ef25245", "subnet-32089345"]
  cert_arn      = "arn:aws:acm:eu-west-1:433223883348:certificate/9891d84e-8a28-4531-afdb-78a2719b1a63"
  dns_name      = "grafana.ulikabbq.com"
  account_id    = "433223883348"
  aws_account_ids = {
    main = "433223883348"
  }
  grafana_count = 2
}

// Run this module in sub accounts so that grafana can assume the Grafana role in the account
module "iam" {
  source = "git@github.com:ulikabbq/grafana-fargate?ref=v1.0//tf/iam_role/"

  grafana_account_id = "433223883348"
}


