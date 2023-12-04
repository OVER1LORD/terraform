resource "aws_instance" "elb_instance_example1" {
  ami           = lookup(var.ami_id, var.region)
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_1.id

  # Security group assigned to the instance
  vpc_security_group_ids = [aws_security_group.elb_sg.id]

  # Key name
  key_name = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y nginx
    systemctl start nginx
    systemctl enable nginx
    echo "<h1>Deployed ELB Instance Example 1 with Nginx</h1>" | tee /var/www/html/index.html
  EOF

  tags = {
    Name = "EC2-Instance-1"
  }
}

resource "aws_instance" "elb_instance_example2" {
  ami           = lookup(var.ami_id, var.region)
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public_2.id

  # Security group assigned to the instance
  vpc_security_group_ids = [aws_security_group.elb_sg.id]

  # Key name
  key_name = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y apache2
    systemctl start apache2
    systemctl enable apache2
    echo "<h1>Deployed ELB Instance Example 2 with Apache2</h1>" | tee /var/www/html/index.html
  EOF

  tags = {
    Name = "EC2-Instance-2"
  }
}