# variable "alb_name" {
#   type = string
# }

variable "lb_listener_arns" {
  type = list(string)
}

variable "blue_lb_target_group_name" {
  type = string
}

variable "green_lb_target_group_name" {
  type = string
}

variable "ecs_service_name" {
  type = string
}

variable "ecs_cluster_name" {
  type = string
}

variable "name" {
  type = string
}