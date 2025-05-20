resource "aws_network_acl" "example" {
  vpc_id = aws_vpc.example.id

  ingress {
    rule_no    = 100
    protocol   = "tcp"
    from_port  = 80
    to_port    = 80
    cidr_block = "0.0.0.0/0"
    action     = "allow"
  }

  egress {
    rule_no    = 100
    protocol   = "tcp"
    from_port  = 80
    to_port    = 80
    cidr_block = "0.0.0.0/0"
    action     = "allow"
  }
}

resource "aws_network_acl_rule" "example" {
  network_acl_id = aws_network_acl.example.id
  rule_no        = 100
  protocol       = "tcp"
  from_port      = 80
  to_port        = 80
  cidr_block     = "0.0.0.0/0"
  action         = "allow"
  depends_on     = [aws_vpc.example]
}

resource "aws_network_acl_rule" "example" {
  network_acl_id = aws_network_acl.example.id
  rule_no        = 100
  protocol       = "tcp"
  from_port      = 80
  to_port        = 80
  cidr_block     = "0.0.0.0/0"
  action         = "allow"
  depends_on     = [aws_vpc.example]
}

resource "aws_network_acl_rule" "example" {
  network_acl_id = aws_network_acl.example.id
  rule_no        = 100
  protocol       = "tcp"
  from_port      = 80
  to_port        = 80
  cidr_block     = "0.0.0.0/0"
  action         = "allow"
  depends_on     = [aws_vpc.example]
}

resource "aws_network_acl_rule" "example" {
  network_acl_id = aws_network_acl.example.id
  rule_no        = 100
  protocol       = "tcp"
  from_port      = 80
  to_port        = 80
  cidr_block     = "0.0.0.0/0"
  action         = "allow"
  depends_on     = [aws_vpc.example]
}

resource "aws_network_acl_rule" "example" {
  network_acl_id = aws_network_acl.example.id
  rule_no        = 100
  protocol       = "tcp"
  from_port      = 80
  to_port        = 80
  cidr_block     = "0.0.0.0/0"
  action         = "allow"
  depends_on     = [aws_vpc.example]
}

resource "aws_network_acl_rule" "example" {
  network_acl_id = aws_network_acl.example.id
  rule_no        = 100
  protocol       = "tcp"
  from_port      = 80
  to_port        = 80
  cidr_block     = "0.0.0.0/0"
  action         = "allow"
  depends_on     = [aws_vpc.example]
}