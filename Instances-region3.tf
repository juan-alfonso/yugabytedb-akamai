resource "linode_instance" "YugabyteDB-instance-worker3" {
  count = var.instance_number
  image = "linode/debian11"
  label = "YugabyteDB-${var.instance_region3}-${count.index}"
  tags = ["YugabyteDB"]
  region = var.instance_region1
  type = var.instance_type
  root_pass = var.instance_password
  interface {
    purpose = "public"
  }
  metadata {
    user_data = base64encode(<<-EOUD
                #cloud-config
                package_update: true
                packages:
                - python-is-python3
                runcmd:
                - wget ${var.download_link}
                - ${var.tar_command}
                EOUD
    )
  }
  connection {
    type     = "ssh"
    user     = "root"
    password = var.instance_password
    host     = self.ip_address
  }

  provisioner "remote-exec" {
    inline = ["sleep 45","cd /yugabyte-2.20.1.3/ && ./bin/yugabyted start --advertise_address=${self.ip_address} --cloud_location=akamai.${var.instance_region3}.zone1 --join=${linode_instance.YugabyteDB-instance-master.ip_address} --fault_tolerance=region"]
  }
  depends_on = [ linode_instance.YugabyteDB-instance-master ]
}