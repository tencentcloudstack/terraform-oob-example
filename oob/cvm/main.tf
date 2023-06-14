resource "tencentcloud_instance" "foo" {
  instance_name     = "your_first_cvm_instance"
  availability_zone = var.availability_zone
  image_id          = data.tencentcloud_images.default.images.0.image_id
  # instance_type     = ""
  # vpc_id            = ""
  # subnet_id         = ""
  # system_disk_type  = "CLOUD_PREMIUM"
  project_id = 0
}

data "tencentcloud_instance_types" "default" {
  filter {
    name   = "zone"
    values = [var.availability_zone]
  }
  cpu_core_count   = 2
  exclude_sold_out = true
}

data "tencentcloud_images" "default" {
  image_type       = ["PUBLIC_IMAGE"]
  image_name_regex = "Final"
}

variable "availability_zone" {
  default = "ap-guangzhou-7"
}
