# ---------------------------------------------------------------------------------------------------------------------
# AWS PROVIDER
# ---------------------------------------------------------------------------------------------------------------------
provider "aws" {
  region = "${var.primary_region}"
}

# ---------------------------------------------------------------------------------------------------------------------
# CLOUDWATCH DASHBOARD
# ---------------------------------------------------------------------------------------------------------------------
resource "aws_cloudwatch_dashboard" "metrics" {
  count = "${var.generate_metrics ? 1 : 0}"

  dashboard_name = "quorum-network-${var.network_id}"
  dashboard_body = <<EOF
{
  "widgets": [
    ${data.template_file.heading_widget.rendered},
    ${data.template_file.pending_transaction_widget.rendered},
    ${data.template_file.process_crash_widget.rendered},
    ${data.template_file.block_number_widget.rendered},
    ${data.template_file.large_block_skew_widget.rendered},
    ${data.template_file.gas.rendered}
  ]
}
EOF
}

# ---------------------------------------------------------------------------------------------------------------------
# WIDGET FOR HEADING
# ---------------------------------------------------------------------------------------------------------------------
data "template_file" "heading_widget" {
  count = "${var.generate_metrics ? 1 : 0}"

  template = "${file("${path.module}/cloudwatch-widgets/heading.json")}"

  vars {
    network_id = "${var.network_id}"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# WIDGET FOR PENDING TRANSACTIONS
# ---------------------------------------------------------------------------------------------------------------------
data "template_file" "pending_transaction_widget" {
  count = "${var.generate_metrics ? 1 : 0}"

  template = "${file("${path.module}/cloudwatch-widgets/pending-transactions.json")}"

  vars {
    network_id     = "${var.network_id}"
    primary_region = "${var.primary_region}"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# WIDGET FOR PROCESS CRASHES
# ---------------------------------------------------------------------------------------------------------------------
data "template_file" "process_crash_widget" {
  count = "${var.generate_metrics ? 1 : 0}"

  template = "${file("${path.module}/cloudwatch-widgets/process-crashes.json")}"

  vars {
    network_id     = "${var.network_id}"
    primary_region = "${var.primary_region}"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# WIDGET FOR BLOCK NUMBER
# ---------------------------------------------------------------------------------------------------------------------
data "template_file" "block_number_widget" {
  count = "${var.generate_metrics ? 1 : 0}"

  template = "${file("${path.module}/cloudwatch-widgets/block-number.json")}"

  vars {
    network_id     = "${var.network_id}"
    primary_region = "${var.primary_region}"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# WIDGET FOR LARGE BLOCK SKEW
# ---------------------------------------------------------------------------------------------------------------------
data "template_file" "large_block_skew_widget" {
  count = "${var.generate_metrics ? 1 : 0}"

  template = "${file("${path.module}/cloudwatch-widgets/large-block-skew.json")}"

  vars {
    network_id     = "${var.network_id}"
    primary_region = "${var.primary_region}"
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# WIDGET FOR GAS USED IN A BLOCK
# ---------------------------------------------------------------------------------------------------------------------
data "template_file" "gas" {
  count = "${var.generate_metrics ? 1 : 0}"

  template = "${file("${path.module}/cloudwatch-widgets/gas.json")}"

  vars {
    network_id     = "${var.network_id}"
    primary_region = "${var.primary_region}"
  }
}
