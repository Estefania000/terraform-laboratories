variable "application_name"{
	description	= "Nombre de la aplicación"
	type 		= string
	default		= "integradora"


}
variable "environment" {
	description	= "Entorno de despliegue (dev, string, prod)"
	type		= string
	default 	= "dev"
}



#Las variables son valores de entrada que permiten parametrizar la infraestructura.

variable "length" {
	description = "Lenght of the random string"
	type = number

}