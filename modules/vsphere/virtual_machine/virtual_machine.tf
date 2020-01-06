locals {
  servername = "${var.application_environment}${var.application_domain}"
}

resource "vsphere_virtual_machine" "vsphereserver" {
  count                      = var.amount_of_servers
  name                       = "${local.servername}${count.index + 1}"
  resource_pool_id           = var.vsphere_resource_pool_id
  datastore_id               = count.index % 2 == 0 ? var.vsphere_datastore_datastore1 : var.vsphere_datastore_datastore2
  num_cpus                   = var.vm_cpu
  memory                     = var.vm_memory
  guest_id                   = var.vm_windows_version
  scsi_type                  = var.scsi_type
  wait_for_guest_net_timeout = 0
  network_interface {
    network_id = var.vm_network_name
  }

  clone {
    template_uuid = var.vm_template_uuid

    customize {
      windows_options {
        computer_name         = "${local.servername}${count.index + 1}"
        join_domain           = var.vm_domain
        domain_admin_user     = var.vm_domain_admin_user
        domain_admin_password = var.vm_domain_admin_password
        admin_password        = var.vm_admin_password
        full_name             = "Administrator"
        organization_name     = "Albelli BV"
        auto_logon            = "true"
        auto_logon_count      = "2"
        time_zone             = "110"
      }

      network_interface {
        ipv4_address    = "${var.vm_ipv4_address}.${var.vm_ipv4_address_host + count.index}"
        ipv4_netmask    = var.vm_ipv4_subnet_mask
        dns_server_list = var.vm_dns_server_list
      }
      ipv4_gateway = var.vm_ipv4_gateway
    }
  }
  disk {
    label            = "disk0"
    size             = var.vm_disk_1_size
    thin_provisioned = var.vm_thin_provisioned_disk_1
  }
  disk {
    label            = "disk1"
    unit_number      = 1
    size             = var.vm_disk2_size
    thin_provisioned = false
  }

  //  provisioner "file" {
  //    source = "${path.module}/files/Octopus"
  //    destination = "C:/APShared/Launch/Scripts/"
  //    connection {
  //      type = "winrm"
  //      user = "administrator"
  //      password = "${var.vm_admin_password}"
  //      host = "${var.vm_ipv4_address}.${var.vm_ipv4_address_host + count.index}"
  //      insecure = "true"
  //      timeout = "25m"
  //      https = "false"
  //    }
  //  }

  provisioner "file" {
    content     = data.template_file.octopus_script.rendered
    destination = "C:/APShared/Launch/Scripts/InstallOctopus.ps1"
    connection {
      type     = "winrm"
      user     = "administrator"
      password = var.vm_admin_password
      host     = "${var.vm_ipv4_address}.${var.vm_ipv4_address_host + count.index}"
      insecure = "true"
      timeout  = "25m"
      https    = "false"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "powershell.exe -Command C:/APShared/Launch/Scripts/InstallOctopus.ps1",
    ]
    connection {
      host     = "${var.vm_ipv4_address}.${var.vm_ipv4_address_host + count.index}"
      type     = "winrm"
      https    = "false"
      user     = "administrator"
      password = var.vm_admin_password
      agent    = "false"
      insecure = "true"
    }
  }
}

data "template_file" "octopus_script" {
  template = file("${path.module}/files/Octopus/InstallOctopus.ps1")
  vars = {
    octopus_role        = var.octopus_role
    octopus_environment = var.octopus_environment
    octopus_trust       = var.octopus_trust
    octopus_apikey      = var.octopus_apikey
  }
}

