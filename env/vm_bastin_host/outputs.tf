output "bastion_host_name" {
  description = "Name of Instance"
  value       = module.bastion_host.*.name
}
