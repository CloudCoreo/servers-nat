coreo_aws_ec2_securityGroups "${NAT_SG_NAME}${SUFFIX}" do
  action :sustain
  description "NAT security group"
  vpc "${VPC_NAME}${SUFFIX}"
  allows [
             {
                 :direction => :ingress,
                 :protocol => :tcp,
                 :ports => $ {NAT_INGRESS_PORTS},
      :cidrs => $ {NAT_INGRESS_CIDRS}
  },
      {
          :direction => :egress,
          :protocol => :tcp,
          :ports => $ {NAT_EGRESS_PORTS},
      :cidrs => $ {NAT_EGRESS_CIDRS}
  },
      {
          :direction => :ingress,
          :protocol => :udp,
          :ports => [123],
          :cidrs => ["0.0.0.0/0"],
      },
      {
          :direction => :egress,
          :protocol => :udp,
          :ports => [123],
          :cidrs => ["10.0.0.0/8"],
      }
  ]
  region "${PLAN::region}"
end

coreo_aws_iam_policy "${NAT_NAME}" do
  action :sustain
  policy_name "AllowVpcManagement"
  policy_document <<-EOH
{
  "Statement": [
    {
      "Effect": "Allow",
      "Resource": [
          "*"
      ],
      "Action": [ 
          "ec2:DeleteTags",
          "ec2:DescribeAvailabilityZones",
          "ec2:ModifyInstanceAttribute",
          "ec2:DescribeInstanceAttribute",
          "ec2:DescribeInstanceStatus",
          "ec2:DescribeInstances",
          "ec2:DescribePlacementGroups",
          "ec2:DescribeRegions",
          "ec2:DescribeTags",
          "ec2:ModifyInstanceAttribute",
          "ec2:ReportInstanceStatus",
          "ec2:DescribeSecurityGroups",
          "ec2:ReplaceRoute",
          "ec2:CreateRoute",
          "ec2:ReplaceRouteTableAssociation",
          "ec2:DescribeSubnets",
          "ec2:DescribeRouteTables",
          "ec2:AllocateAddress",
          "ec2:AssociateAddress",
          "ec2:DescribeAddresses",
          "ec2:DisassociateAddress",
          "ec2:ReleaseAddress"
      ]
    }
  ]
}
  EOH
end

coreo_aws_iam_instance_profile "${NAT_NAME}" do
  action :sustain
  policies ["${NAT_NAME}"]
end

coreo_aws_ec2_instance "${NAT_NAME}${SUFFIX}" do
  action :define
  image_id "${AWS_LINUX_AMI}"
  size "${NAT_SIZE}"
  security_groups ["${NAT_SG_NAME}${SUFFIX}"]
  associate_public_ip true
  role "${NAT_NAME}"
  ssh_key "${NAT_KEY}"
  region "PLAN::region"
end

coreo_aws_ec2_autoscaling "${NAT_NAME}${SUFFIX}" do
  action :sustain
  minimum ${NAT_GROUP_SIZE_MIN}
  maximum ${NAT_GROUP_SIZE_MAX}
  server_definition "${NAT_NAME}${SUFFIX}"
  subnet "${PUBLIC_SUBNET_NAME}${SUFFIX}"
  region "PLAN::region"
end
