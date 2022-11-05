variable "vpc_name_tag" {
  description = "Label to display in the aws console"
  type = string
}

variable "vpc_tags" {
        type = map(string)
        default = {}
}