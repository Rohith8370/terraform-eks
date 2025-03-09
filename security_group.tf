resource "aws_security_group" "all_worker_mgmt" {
    name_prefix = "all_worker_management"
    vpc_id = module.vpc.vpc_id 
}

resource "aws_security_group_rule" "all_worker_mgmt_ingress" {

    type = "ingress"
    description = "allow inbound traffic from eks"

    security_group_id = aws_security_group.all_worker_mgmt.id
    protocol = "-1"
    from_port = 0
    to_port = 0

    cidr_blocks = [
        "10.0.0.0/8",
        "172.16.0.0/12",
        "192.168.0.0/16",
  ]

  
}

resource "aws_security_group_rule" "all_worker_mgmt_egress" {

    type = "egress"
    description = "allow outbound traffic from eks"

    security_group_id = aws_security_group.all_worker_mgmt.id
    protocol = "-1"
    from_port = 0
    to_port = 0

    cidr_blocks = ["0.0.0.0/0"]
  
}