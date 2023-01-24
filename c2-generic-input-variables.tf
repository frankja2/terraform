variable "business_division" {
    description = "Business Division in the larget organization this Infrastructure belongs"
    type = string
    default = "sap"
}
variable "environment" {
    description = "Environment Variable used as a prefix"
    default = "dev"
}
variable "resource_group_name" {
    description = "Resource Group Name"
    type = string
    default = "rg-default"
}
variable "resource_group_location" {
    description = "Region in which Azure Resources to be created"
    type = string
    default = "eastus2"
}