variable "company_name" {
  type        = string
  description = "Short company name used as resource naming prefix."
  default     = "aa"
}

variable "env" {
  type        = string
  description = "Environment into which this app is deployed into."
  validation {
    condition     = contains(["dev", "test", "perf", "staging", "prod"], var.env)
    error_message = "Env variable must contain one of dev,test,perf,staging,prod."
  }
}

variable "short_region" {
  type        = string
  description = "Short azure region name - eun,euw etc."
  validation {
    condition = (
      length(var.short_region) == 3 &&
      contains(["eun", "euw"], var.short_region)
    )
    error_message = "Variable must of exactly 3 chars long - eun, euw etc."
  }
}

variable "project_name" {
  type        = string
  default     = "availableapi"
  description = "Name of the project/platform that this resource is intended for."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group the resource will be part of."
}

variable "la_workspace_resource_id" {
  type        = string
  description = "Resource id of the LA workspace"
}