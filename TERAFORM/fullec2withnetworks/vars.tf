variable "access_key" {
    default = ""
    
}

variable "secret_key" {
    default = ""
}

variable "key_name" {
    default = "First_Key"
    description = "(optional) describe your variable"
}

variable "key_path" {
    default = "./First_Key.pem"
}

variable "os_user" {
    default = "ubuntu"
}