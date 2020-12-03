data "aws_iam_policy_document" "ecs_service_policy" {
  version = "2012-10-17"
  statement {
    sid     = ""
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ecs.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "ecs_service_role" {
  name                = "ecsServiceRole"
  path                = "/"
  assume_role_policy  = data.aws_iam_policy_document.ecs_service_policy.json
}

data "aws_iam_policy_document" "ecs_service_role_policy" {
  statement {
    sid    = "ECSTaskManagement"
    effect = "Allow"
    actions = [
      "ec2:AttachNetworkInterface",
      "ec2:CreateNetworkInterface",
      "ec2:CreateNetworkInterfacePermission",
      "ec2:DeleteNetworkInterface",
      "ec2:DeleteNetworkInterfacePermission",
      "ec2:Describe*",
      "ec2:DetachNetworkInterface",
      "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
      "elasticloadbalancing:DeregisterTargets",
      "elasticloadbalancing:Describe*",
      "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
      "elasticloadbalancing:RegisterTargets",
      # "route53:ChangeResourceRecordSets",
      # "route53:CreateHealthCheck",
      # "route53:DeleteHealthCheck",
      # "route53:Get*",
      # "route53:List*",
      # "route53:UpdateHealthCheck",
      "servicediscovery:DeregisterInstance",
      "servicediscovery:Get*",
      "servicediscovery:List*",
      "servicediscovery:RegisterInstance",
      "servicediscovery:UpdateInstanceCustomHealthStatus"
    ]
    resources = ["*"]
  }
  statement {
    sid    = "AutoScaling"
    effect = "Allow"
    actions = [
      "autoscaling:Describe"
    ]
    resources = ["*"]
  }
  statement {
    sid    = "AutoScalingManagement"
    effect = "Allow"
    actions = [
      "autoscaling:DeletePolicy",
      "autoscaling:PutScalingPolicy",
      "autoscaling:SetInstanceProtection",
      "autoscaling:UpdateAutoScalingGroup"
    ]
    resources = ["*"]
    condition {
      test = "Null"
      variable = "autoscaling:ResourceTag/AmazonECSManaged"
      values = [
        "false"
      ]
    }
  }
  statement {
    sid    = "AutoScalingPlanManagement"
    effect = "Allow"
    actions = [
      "autoscaling-plans:CreateScalingPlan",
      "autoscaling-plans:DeleteScalingPlan",
      "autoscaling-plans:DescribeScalingPlans"
    ]
    resources = ["*"]
  }
  statement {
    sid    = "CWAlarmManagement"
    effect = "Allow"
    actions = [
      "cloudwatch:DeleteAlarms",
      "cloudwatch:DescribeAlarms",
      "cloudwatch:PutMetricAlarm"
    ]
    resources = ["arn:aws:cloudwatch:*:*:alarm:*"]
  }
  statement {
    sid    = "ECSTagging"
    effect = "Allow"
    actions = [
      "ec2:CreateTags"
    ]
    resources = ["arn:aws:ec2:*:*:network-interface/*"]
  }
  statement {
    sid    = "CWLogGroupManagement"
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:DescribeLogGroups",
      "logs:PutRetentionPolicy"
    ]
    resources = ["arn:aws:logs:*:*:log-group:/aws/ecs/*"]
  }
  statement {
    sid    = "CWLogStreamManagement"
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:DescribeLogStreams",
      "logs:PutLogEvents"
    ]
    resources = ["arn:aws:logs:*:*:log-group:/aws/ecs/*:log-stream:*"]
  }
}

resource "aws_iam_role_policy" "ecs_service_role_policy" {
  role   = aws_iam_role.ecs_service_role.name
  policy = data.aws_iam_policy_document.ecs_service_role_policy.json
}
