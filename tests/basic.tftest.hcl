run "basic" {
  variables {
    application      = "myca"
    customer_acronym = "abc"
    environment      = "dev"
    location         = "West Europe"
    workload         = "shrd"
  }

  module {
    source = "./"
  }

  command = plan

  assert {
    condition     = output.resource_prefix == "abcdev-shrd-weu-myca"
    error_message = "Unexpected output.resource_prefix value"
  }

  assert {
    condition     = output.naming.subscription == "abcdev-shrd-sub"
    error_message = "Unexpected output.subscription value"
  }

  assert {
    condition     = length(output.naming.compute_web.virtual_machine_windows) <= 15
    error_message = "Windows VM names cannot be longer than 15 characters"
  }
}
