# 1. Public IP for VM
resource "azurerm_public_ip" "vm_pip" {
  name                = "pip-dev-vm"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

# 2. Network Interface Card (NIC)
resource "azurerm_network_interface" "vm_nic" {
  name                = "nic-dev-vm"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id  # Apne existing subnet ka resource name check kar lein
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_pip.id
  }
}

# 3. Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vm-dev-app"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s" # Low cost VM size
  admin_username      = "azureuser"
  admin_password      = "P@ssw0rd123456!" # Testing ke liye password base auth
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.vm_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {
    environment = "dev"
    managed_by  = "terraform"
  }
}