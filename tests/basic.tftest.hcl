run "basic" {
  variables {
    application  = "myca"
    customer_tla = "abc"
    environment  = "dev"
    location     = "westeurope"
    workload     = "shrd"
  }

  module {
    source = "./"
  }

  command = plan

  assert {
    condition     = output.resource_prefix == "abcdev-shrd-euw-myca"
    error_message = "Unexpected output.resource_prefix value"
  }

  assert {
    condition     = output.subscription == "abcdev-shrd-sub"
    error_message = "Unexpected output.subscription value"
  }
}
