variable "linode_token" {
  default = ""
  type = string
  sensitive   = true
}

variable "instance_number" {
  description = "Number of AutoScaleSet VMs"
  default     = 2
  type        = number
}

variable "instance_type" {
  description = "Instance type"
  default = "g6-standard-2"
  type = string
}

variable "instance_region1" {
  description = "Instance region1"
  type = string
}

variable "instance_region2" {
  description = "Instance region2"
  type = string
}

variable "instance_region3" {
  description = "Instance region3"
  type = string
}

variable "instance_password" {
  default = ""
  type = string
  sensitive   = true
}

variable "download_link" {
  description = "YugabyteDB binary download link"
  type = string
  default = "https://downloads.yugabyte.com/releases/2.20.1.3/yugabyte-2.20.1.3-b3-linux-x86_64.tar.gz"
}

variable "tar_command" {
  description = "YugabyteDB binary download link tar command"
  type = string
  default = "tar xvfz yugabyte-2.20.1.3-b3-linux-x86_64.tar.gz && cd yugabyte-2.20.1.3/ && ./bin/post_install.sh"
}