variable "namespace" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "pub_sub_ids" {
  type = list(string)
}

variable "prv_sub_ids" {
  type = list(string)
}