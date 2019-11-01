# tfs_repo
Terraform templates for different uses. The template directory should describe its purpose.

<h3>Sync with your current Infrastructure</h3>
If you need to create a resource that is dependent on current resources.
An example would be to create and aws_internet_gateway you need a VPC ID.
So you cna either make a new VPC or use terraform import to populate your
states so as to get the vpc to create your resources in.

Thus navigate to your VPC in AWS, get the vpc ID. In your template. Declare a
vpc resource as bellow.

resource "aws_vpc" "my_vpc" {}

i.e vpcid = x
Save your file and run the following command

$ terraform import aws_vpc.my_vpc x


Terraform will sync your vpc per given id and you cna now create resources in
your vpc
