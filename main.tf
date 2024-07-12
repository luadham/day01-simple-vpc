// VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cider
  tags = {
    Environment = var.environment,
    Owner       = var.owner
  }
}

// Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cider
  map_public_ip_on_launch = true
  tags = {
    Environment = var.environment,
    Owner       = var.owner
  }
}

// Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Environment = var.environment,
    Owner       = var.owner
  }
}


// Routing Table
resource "aws_route_table" "routing_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Environment = var.environment,
    Owner       = var.owner
  }
}


// Connect Routing Table with the Public Subnet
resource "aws_route_table_association" "routing_table_assocation" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.routing_table.id
}