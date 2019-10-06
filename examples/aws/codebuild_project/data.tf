data "aws_vpc" "vpc" {
  tags = {
    Name = "sandbox_vpc"
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = "${data.aws_vpc.vpc.id}"

  tags = {
    Name = "private*"
  }
}