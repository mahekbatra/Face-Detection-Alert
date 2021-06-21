provider "aws" {
	region     = "ap-south-1"
	profile    = "default"
}

#1.Launching of OS
resource "aws_instance" "os1" {
	ami           = "ami-0ad704c126371a549"
	instance_type = "t2.micro"
	tags = {
		  Name= "My OS"
	  }
}



#2.Harddisk Creation
resource "aws_ebs_volume" "st1" {
   availability_zone = aws_instance.os1.availability_zone 
   size              =  5

  tags = {
    Name = "HelloWorld"
  }
}

#3.Volume Attachment
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   =  aws_ebs_volume.st1.id
  instance_id =  aws_instance.os1.id
}
