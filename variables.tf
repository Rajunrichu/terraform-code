variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "aws_profile" {
  description = "AWS profile"
}

variable "AWS_ACCESS_KEY_ID" {
    type = string
    default = "AKIA5FGCGH7YKLXB2DAE"  
}

variable "AWS_SECRET_ACCESS_KEY" {
    type = string
    default = "9qNDog/vmyJWgWCrZyyIbikTy0QjvVR+0IK09X+P"  
}

variable "AWS_DEFAULT_REGION" {
    type = string
    default = "us-east-1"  
}

variable "AMI_ID" {
    type = string
    default = "ami-090fa75af13c156b4"
}

variable "INSTANCE_TYPE" {
    type = string
    default = "t2.micro"
}

