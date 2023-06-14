variable "availability_zone" {
  default = "ap-guangzhou-3"
}

resource "tencentcloud_vpc" "foo" {
  name       = "your_first_vpc"
  cidr_block = "10.0.0.0/16"

  tags = {
    "created_by" = "oob"
  }
}

resource "tencentcloud_subnet" "foo" {
  availability_zone = var.availability_zone
  name              = "your_first_subnet"
  vpc_id            = tencentcloud_vpc.foo.id
  cidr_block        = "10.0.20.0/28"
  is_multicast      = false

  tags = {
    "created_by" = "oob"
  }
}
