variable "namespace" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "pub_sub_ids" {
  type = list(string)
}

variable "alb_sg_id" {
  type = string
}

variable "label" {
  type = string
}