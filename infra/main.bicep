param location string = 'westus'
param adminUsername string = 'azureuser'
param vmName string = 'selfhealvm'

resource vnet 'Microsoft.Network/virtualNetworks@2023-02-01' = {
  name: 'vnet-demo'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: ['10.0.0.0/16']
    }
    subnets: [
      {
        name: 'subnet-demo'
        properties: {
          addressPrefix: '10.0.1.0/24'
        }
      }
    ]
  }
}

resource nsg 'Microsoft.Network/networkSecurityGroups@2023-02-01' = {
  name: 'nsg-demo'
  location: location
  properties: {
    securityRules: [
      {
        name: 'AllowHTTP'
        properties: {
          priority: 100
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '80'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'AllowSSH'
        properties: {
          priority: 101
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}

resource publicIP 'Microsoft.Network/publicIPAddresses@2023-02-01' = {
  name: 'publicip-demo'
  location: location
  sku: {
    name: 'Standard'
   }
  properties: {
    publicIPAllocationMethod: 'Static'
  }
}

resource nic 'Microsoft.Network/networkInterfaces@2023-02-01' = {
  name: 'nic-demo'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', 'vnet-demo', 'subnet-demo')
          }
          publicIPAddress: {
            id: publicIP.id
          }
        }
      }
    ]
    networkSecurityGroup: {
      id: nsg.id
    }
  }
}

resource vm 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      linuxConfiguration: {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [
            {
              path: '/home/azureuser/.ssh/authorized_keys'
              keyData: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC81jUeQsex/wzhUirfu61Zt4pDrSs8C3YraIuLBtDLM6wBJ171lKMVqxlG9dmhj6ten1oiNiJdDUJEw+IHMMBYge68dlnooBIHNmbWx/XAQo3H+eGaC1b+POavtkG/QfOwpB+JWR3CU/IcNilnbJe2rmOWv7YzZPN9X0W/VToE1Vy85H9BhXbqsbM1KUzXqA49G8Hl62XNpk1CLEO2fLrsuvGjTay28GI6CkRel7+u0LHwE7b6tw6mIIaPGnvDpAWjj50iiczKHUi7Pg0jnNr4l3ckVebjaL1GWU8ahw3W8xQlTUmQbYjK2j4xOiKp7Q9ZNTODxQWeLJRB7SXQYGNUkqYu8+yGRHKaG9pKqD0DV5jpu0uH6GZGcxviH2ZWenb0qqrqY/a7aZFK/LOJBZVXELlnZEbP7cWUjmWOSav9XvpYUygQ8TgtPfdUOaKqMorJsnALeLxNVcZmCa70ENXKVyT7PKvaJCyfWXl1lmEHlYeWRP2SzRhyhIgDqBLL1rc= tania@SandboxHost-639117444495043173'
            }
          ]
        }
      }
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: '0001-com-ubuntu-server-jammy'
        sku: '22_04-lts-gen2'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
  }
}
