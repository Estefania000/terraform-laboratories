resource "random_string" "suffix" {
    length  = var.length
    special = true
}
locals {
    #Genera un nombre único para el recurso utilizando un prefijo y un sufijo aleatorio
    unique_name         = "${var.application_name}-${var.environment}-${random_string.suffix.result}"
    application_name    = var.application_name
}

#Otros tipos de variables
variable "enable_monitoring" {
    description = "Habilitar o deshabilitar el monitoreo"
    type        = bool
    default     = true
}

variable "regions" {
    description = "Lista de regiones donde se desplegará la infraestructura"
    type        = list(string)
    default     = ["us-east-1", "us-west-2"]
}

variable "environment_tags" {
    description = "Etiquetas específicas para cada entorno"
    type        = map(string)
    default     = {
    dev  = "Development"
    prod = "Production"
    }
}

variable "application_config" {
    description = "Configuración específica de la aplicación"
    type        = object({
    version      = string
    maintainer   = string
    dependencies = list(string)
    })
    default     = {
    version    = "1.0.0"
    maintainer = "John Doe"
    dependencies = ["dependency1", "dependency2"]
    }
}

variable "allowed_networks" {
    description = "Lista de redes permitidas para acceder a la aplicación"
    type        = set(string)
    default     = ["10.0.0.0/16", "10.1.0.0/16"]
}