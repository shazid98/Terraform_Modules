# # Creating load balancer for the app
# resource "aws_elb" "app_lb" {
#   name = "eng114-shazid-lb"
#   security_groups = ["${aws_security_group.app_security_ports.id}"]
#   subnets = ["${aws_subnet.eng114_shazid_terraform_public_subnet.id}"]
#   cross_zone_load_balancing   = true
  
#   health_check {
#     healthy_threshold = 2
#     unhealthy_threshold = 2
#     timeout = 3
#     interval = 30
#     target = "HTTP:80/"
#   }
  
#   listener {
#     lb_port = 80
#     lb_protocol = "http"
#     instance_port = "80"
#     instance_protocol = "http"
#    }
#   }

# # Creating launch template
#   resource "aws_launch_configuration" "app" {
#   name_prefix = "eng114-shazid-terraform-asg-app-"
#   image_id = "${var.node_app_id}" 
#   instance_type = "t2.micro"
#   key_name = "${var.aws_key_name}"
#   security_groups = [ "${aws_security_group.app_security_ports.id}" ]
#   associate_public_ip_address = true
  
#   lifecycle {
#     create_before_destroy = true
#   }
# }

# # Creating an autoscaling group
# resource "aws_autoscaling_group" "app" {
#   name = "eng114-shazid-terraform-asg-app"
#   min_size             = 2
#   desired_capacity     = 2
#   max_size             = 3
  
#   load_balancers = ["${aws_elb.app_lb.id}"]
#   launch_configuration = "${aws_launch_configuration.app.name}"
#   enabled_metrics = [
#     "GroupMinSize",
#     "GroupMaxSize",
#     "GroupDesiredCapacity",
#     "GroupInServiceInstances",
#     "GroupTotalInstances"
#   ]
#   metrics_granularity = "1Minute"
#   vpc_zone_identifier  = ["${aws_subnet.eng114_shazid_terraform_public_subnet.id}"]
#   lifecycle {
#     create_before_destroy = true
#   }
#   tag {
#     key                 = "Name"
#     value               = "eng114-shazid-terraform-app"
#     propagate_at_launch = true
#   }
# }