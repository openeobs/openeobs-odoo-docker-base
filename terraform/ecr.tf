resource "aws_ecr_repository" "odoo_base" {
  name = "odoo_base"
}

output "odoo_base-ecr_url" {
  value = "${aws_ecr_repository.odoo_base.repository_url}"
}
