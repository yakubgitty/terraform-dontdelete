# Define a random integer
 
resource "random_integer" "unique_id" {
  min = 1000
  max = 9999
}

# Define the storage account properties
resource "azurerm_storage_account" "sa" {
  name                     = "${var.storage_account_name}${random_integer.unique_id.id}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_replication_type = "LRS"
  account_tier             = "Standard"
  min_tls_version          = "TLS1_2"
}  