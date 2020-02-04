===========================================================================
AWS Solution Architects - Associate
===========================================================================

==== Section 2 =====
Regions
	- ASIA 
	- EUROPE
	- NORTH AMERICA / SOUTH
	- Middle EAST

	Availblility_Zone: - AZ
		- us-east-1a
		- us-east-1b
		- us-west-1a
		- us-west-1b

	Cloud_Front: - is a CDN (Content delivery network) - moves your file closer to the user requesting them.
		- Edge_Locations: Where content will be cached.
			- You can read and write in edge locations.
			- Objects are cached for TTL(Time to live).
			- You can clear cached objects but you will be charged for that.
		- Origin: Origin of files that CDN will distribute. This can be S3, EC2, ELB or Route53
		- Distribution: Is the name given to CDN which consist of a collection of edge location. 
			- Web_Distribution: Used for websites
			- RTMP: - Media Streaming

	**** EXAM:*****
		- CloudFront signed URLs and signed cookies provide the same basic functionality:
			- they allow you to control who can access your content.
			- If you want to serve private content through CloudFront use signed_URLs: or signed_cookies:

			Use_signed_URLs:
			- RTMP distribution
			- You want to restrict access to individual files

			Use_signed_Cookies:
			- You want to provide access to multiple restricted files
			- You do not want to change your current URLs.

	What is an AWS Availability Zone (AZ)?
		- AWS Availability Zone is an isolated location within an AWS Region. 
		- Within each AWS Region, S3 operates in a minimum of three AZs, each separated by miles to protect against local events like fires, floods, etc
		- Amazon S3 Standard, S3 Standard-Infrequent Access, and S3 Glacier storage classes replicate data across a minimum of three AZs to protect against the loss of one entire AZ.
		- Amazon S3 One Zone-IA storage class 

==== Section 3 =====
===========================================================================
===========================================================================

IAM - Identity and Access Management. 
	- IAM allow you to manage users and their level of access to the aws console.
	- IAM is universal do not apply to regions.  

	It can be Understand using below 4 things
	- Users: People, end users
		- New users have NO permissions when created.
		- New users are assigned Access Key ID and Secret Keys when first created.
		- These (Access Key ID and Secret Keys) can not be used to login to console. This should be used by API and command line for access.
	- Groups: Collection of users.
	- Policies: Are basically the Permissions. [Policy document written in JSON]
		Identity_based_Policy:
			- Manage_policy: Standalone policies that you can attach to multiple users, groups and roles.
			- Inline_policy: that are embedded directly into a single user, group or role. 
		Resource_based_Policy:
			- Policy that you attach to a resource like Amazon S3 bucket.

	- Roles: IAM roles are a secure way to grant permissions to entities that you trust. 

	New Users and account set up
	- Always enable MFA on your Root account.
	- New Users have No permissions once created.
	- Access keys ID & Secret are not the same as password.

	Power_users: have access to all AWS service. But are not allowed to manage users, groups and roles

	Security_Token_Service: STS 
		- Create and provide trusted users with temporary security crdentials that can access your AWS resources.
		- Temporary security credentials are short-term and are not stored with user but generated dynamically.
		- STS is a global service with single endpoint.

	********* EXAM: ******

	Cloud_watch: is a monitoring service for logging and alarming.
		- Cloud_watch: do not aggregate data across regions. Metrics are separate between regions.
			- CloudWatch will only cover the activities of the regional services (EC2, S3, RDS etc.) and not for global services such as IAM, CloudFront, AWS WAF, and Route 53.
		- Cloud watch provide following metrics
			- CPU Utilization
			- Network Utilization (Network In and Out)
			- Disk performance
			- Disk Reads/Writes

		- there are certain metrics that are not readily available in CloudWatch such as 
			- memory utilization, 
			- disk space utilization, 
			- disk swap utilization, 
			- page file utilization, 
			- log collection and many others which can be collected by setting up a custom metric.

		- CloudWatch alarm actions, you can create alarms that automatically stop, terminate, reboot, or recover your EC2 instances
		- multi-platform CloudWatch agent which can be installed on both Linux and Windows-based EC2 instances.

		Two key funtionality:
		 - monitoring resources
		 - alerting you

    AWS_Budgets: gives you the ability to set custom budgets that alert you when your costs or usage exceed.
    	- Budgets can be tracked at the monthly, quarterly, or yearly
    Cost_Explorer: only helps you visualize and manage your AWS costs and usages over time.

	Creating billing alarm
		- AWS Console -> Cloud Watch -> Billing -> Create Alarm

	To calculate the total number of IP addresses of a given CIDR Block, you simply need to follow the 2 easy steps below. Lets say you have a CIDR block /27: 

	1. Subtract 32 with the mask number : 
		(32 - 27) = 5
	2. Raise the number 2 to the power of the answer in Step #1 : 
		2^5 = (2 * 2 * 2 * 2 * 2)
  		= 32

  		32-28 = 4

   ******* EXAM: *********
   ** Microsoft Active Directory which implements Security Assertion Markup Language (SAML)
   	** This feature enables federated single sign-on (SSO), so users can log into the AWS Management Console or call the AWS APIs without you having to create an IAM user for everyone in your organization.

   ** AWS Directory Service AD Connector - help integrating with company Active Directory.
   ** You can assign an IAM Role to the users or groups from your Active Directory once it is integrated with your VPC via the AWS Directory Service AD Connector.
   - One of the best practices in Amazon IAM is to grant least privilege.

===========================================================================
===========================================================================

S3 - Simple storage services, Only used to store files.

   - S3 is a object-based storage. Think of objects as a file.
   		- Key: Name of the Object 
   		- value: Data of a file 
   		- version_ID: Important for versioning
   		- Metadata: data about data you are storing
   		- Subresource: Access control list, Torrent
   - Files are stored in bucket. Bucket is nothing but a folder. 
   - Bucket should have unique names. 
   - By default, you can create up to 100 buckets in each of your AWS accounts
   - Files can save from 0 Bytes to 5 TB.
   - Sample of an S3 URL: https://s3-eu-west-1.amazonaws.com/yourbucket.
   - When you upload an object in S3 you get an HTTP 200 OK code back.

   Data_consistency_model:
		- read-after-write consistency for PUTS of new objects in your S3 buckets
		- eventual consistency for read-after-write HEAD or GET requests
		- eventual consistency for Overwrite PUTS and DELETES in all region 
		- It is eventually consistent for overwriting and deletes (this means it can take some time to propagate)

   S3_feature:
   	- Tiered storage available
   	- Life cycle management
   	- versioning
   	- Encryption
   	- MFA delete 
   	- Secure data via Access control list and Bucket Policies

   S3_Storage_Class: "Exam Topic to remember"
   	- S3_standard: replicate data across a minimum of three AZs to protect against the loss of one entire AZ.
   		- availability:  99.99% 
   		- durability:  99.11x9s
   		$0.023 per GB for the lowest band
   	- S3_IA: (Infrequently available) - replicate data across a minimum of three AZs to protect against the loss of one entire AZ.
   		- availability:
   		- durability: 
   		$0.0125 per GB
   	- S3_One_Zone_IA: (Infrequently available) - replicates data within a single AZ
   		- availability: 99.5%
   		- durability: 99.9%
   		$0.01 per GB
   	- S3 Intelligent Tiering
   		- availability: 99.9%
   		- durability: 99.999999999%
   	- S3_Glacier: - retrieval time from mins to hours - replicate data across a minimum of three AZs to protect against the loss of one entire AZ.
   		- availability:
   		- durability: 
    - S3 Glacier Deep Archive - retrieval time of 12 hours acceptable
    	- availability:
   		- durability: 

   S3_Permissions:
   	- Bucket and object permissions are independent of each other. 
   	- An object does not inherit the permissions from its bucket.
   
   S3_Buckets:
   	- By default all newly created buckets are PRIVATE.
   		- Bucket policies - Work at bucket level
   		- Access Control lists (ACLs) - Work as individual object level

   S3_Encryption:	**** EXAM: *****
   	- Encryption at rest (Server Side)
   		- Use Server-Side Encryption with Amazon S3-Managed Keys (SSE-S3)
		- Use Server-Side Encryption with AWS KMS-Managed Keys (SSE-KMS)
		- Use Server-Side Encryption with Customer-Provided Keys (SSE-C)

   	- Encryption at rest (Client Side)
   		- Encrypt data client-side and upload the encrypted data to Amazon S3.
   

   	- You can protect data in transit using Secure Sockets Layer (SSL) or client-side encryption.
   	- If your data is stored in EBS Volumes, you can enable EBS Encryption
   	- if it is stored on Amazon S3, you can enable client-side and server-side encryption

   	S3_Versioning:
   		- Stores all version of objects
   		- Once enabled versioning can not be disabled, only suspended. A way of disabling it is to delete the bucket and re-create it
   		- Integrates with lifecycle rules.
   		- You pay for each version you have
   		- Delete an object:
   			- Once you delete a file inside a versioned bucket, you donot delete the file, you simply add a Delete Marker (this basically creates a new version of the object) If you delete the version with the Detele Marker you will basically restore the object.
   			- If you want to permanently delete the object, you have to delete all the Versions of the object.
   			- You can optionally add another layer of security by configuring a bucket to enable MFA Delete

   	S3_Lifecycle_Management:
   		- Automates moving your objects between the different storage tiers.
   		- Can be used on conjuction of versioning

    S3_Cross_Region_Replication: CRR		
    	- versioning must be enabled on both source and destination
    	- Regions must be unique
    	- Files in an existing bucket are not replicated automatically
    		- Cross region replication does not replicate existing object by default, only new ones (after the replicate is set) will be replicated automatically.
    	- All subsequent updated files will be replicated automatically
    	- Delete markers are not replicated.
    		- If you delete an object in the primary bucket, the delete action and markers would not be done or replicated in your remote bucket, this is a security function.
    	- You can not replicate over multiple buckets, the maps are always 1-to-1

    S3_Transfer_Acceleration:
    	- utilizes cloudFront Edge network to accelerate your uploads to S3.
    	- Instead of uploading to S3 you can upload file to edge location (via URL) which will then transfer the file to S3. 

    Query_in_Place:
    	- S3 allows customers to run sophisticated queries against data stored without the need to move data into a separate analytics platform.
    	- Ability to query this data in place on Amazon S3 can significantly increase performance and reduce cost for analytics solutions leveraging S3 as a data lake

    	S3_Select:
    		- S3 feature that makes it easy to retrieve specific data from the contents of an object using simple SQL expressions without having to retrieve the entire object.
    		- You can use S3 Select to retrieve a subset of data using SQL clauses, like SELECT and WHERE, from objects stored in CSV, JSON/

    S3_Object_Lock:
    	- 

	**** Snowball: 
		- Data transport solution that uses secure appliances to transfer large amount of data.
		- Amazon Snowball is a petabyte-scale data transport solution that uses secure appliances to transfer large amounts of data into and out of the AWS cloud. 
		- Transferring data with Snowball is simple, fast, secure, and can be as little as one-fifth the cost of high-speed Internet
			- Import to S3
			- Export from S3

		****** AWS Snowball Edge -
			- The AWS Snowball Edge is a type of Snowball device with on-board storage and compute power for select AWS capabilities.
			- Remember that an 80 TB Snowball appliance  only have 72 TB of usable capacity.
			- 100 TB Snowball Edge appliance only have 83 TB of usable capacity.

**** Storage_Gateway: - 
		- is a service that connect on-prem software application with cloud based storage(S3) to provide seamless and secure integration. 

		- Types
			- File Gateway (NFS) - enables you to store and retrieve objects in Amazon S3 using file protocols,
				- For storing file 
			- Volume Gateway  - For storing hard disk data on S3.
				- Stored volume - Entire dataset is stored onsite and asynchronously backed up to S3.
				- cached volume - Entire dataset is stored in S3. Frequently accessed data is cached.
			- Tape gateway - provides your backup application with an iSCSI virtual tape library (VTL) interface

 ****VPC_Endpoints: An Amazon VPC Endpoint for Amazon S3 is a logical entity within a VPC that allows connectivity only to S3.
		- A VPC endpoint enables you to privately connect your VPC to supported AWS services.
		- VPC endpoint services powered by PrivateLink without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect connection
	
	How are Amazon S3 and Amazon S3 Glacier designed to achieve 99.999999999% durability?
		- Amazon S3 Standard, S3 Standard-IA, and S3 Glacier storage classes redundantly store your objects on multiple devices across a minimum of three Availability Zones (AZs) in an Amazon S3 Region before returning SUCCESS.		

	*****Event_Notification:
		- Amazon S3 event notifications can be sent in response to actions in Amazon S3 like PUTs, POSTs, COPYs, or DELETEs

		- Amazon S3 supports the following destinations where it can publish events:
			- Amazon SNS, 
			- Amazon SQS, 
			- AWS Lambda
		- There are no additional charges for using Amazon S3 for event notifications
		- You pay only for use of Amazon SNS or Amazon SQS to deliver event notifications, or for the cost of running an AWS Lambda function.

	S3_Transfer_Acceleration:
		- Amazon S3 Transfer Acceleration enables fast, easy, and secure transfers of files over long distances between your client and your Amazon S3 bucket.
		- S3 Transfer Acceleration leverages Amazon CloudFront’s globally distributed AWS Edge Locations.
		- As data arrives at an AWS Edge Location, data is routed to your Amazon S3 bucket over an optimized network path.

	Questions:
    	- CloudFront_Signed_URLs: and CloudFront_Signed_Cookies: are different ways to ensure that users attempting access to files in an S3 bucket can be authorised.
    	- CloudFront_Origin_Access_Identity: is a virtual user identity that is used to give the CloudFront distribution permission to fetch a private object from an S3 bucket.	
    	- Using File Gateway is the recommended way to use S3 with shared document pools.
    	- Life-cycle management and Infrequent Access storage is available for both S3 and EFS


==== Section 4 =====
===========================================================================
===========================================================================

EC2 - Elastic cloud compute 
	- is a web service that provide resizable compute capacity in the cloud.

	- Termination protection is turned off by default, you must turn it on.
	- EBS Root Volumes of your default AMI can not be encrypted 
		 - Root Volumes can be encypted via bit locker
	- Additional volumes can be encrypted

	EC2_instances:
		- On demand
		- Reserved 
		- Spot 
		- Dedicated Host


 *****EBS_Volume: Elastic block storage - Volume exist on EBS. Think of EBS as virtual hard drive.
		- Provides persistent block storage volumes for use with Amazon EC2 instances in the AWS Cloud.
		- When you create an EBS volume in an Availability Zone, it is automatically replicated within that zone to prevent data loss due to a failure of any single hardware component.
		- An EBS volume can only be attached to one EC2 instance at a time.
		- After you create a volume, you can attach it to any EC2 instance in the same Availability Zone
		- You can specify not to terminate the EBS volume when you terminate the EC2 instance during instance creation
		- EBS volumes support live configuration changes while in production which means that you can modify the volume type, volume size, and IOPS capacity without service interruptions
		- Amazon EBS encryption uses 256-bit Advanced Encryption Standard algorithms (AES-256)
		- EBS Volumes offer 99.999% SLA.


		- Termination protection is turned off by default.
		- EBS Types
			- SSD (Solid state drive) - SSD are good for random access.
				- gp2 
				- iop
			- HDD (hard disk drive) - Are great for sequential access (processing log files, bigdata work flows as an example)
				- st1
				- sc1 

	Security_Group: are associated with EC2 instances and provide security at the protocol and port access level.

		- Each security group – working much the same way as a firewall – contains a set of rules that filter traffic coming into and out of an EC2 instance
		- You can specify allow rules but There are no ‘Deny’ rules.
		- Everything is blocked in security group. We have to allow something explicitly otherwise it will be dropped.
		- only 100 security groups per VPC

		- AWS Security groups are STATEFUL, if you create an inbound rule allowing traffic in, that traffic is automatically allowed back out again.
		- Any number of SG can be attached to EC2
		- You can not block specific IP addresses via SG instead use network access control lists.


	Snapshots: 
		- Snapshots exist on S3. snapshot means photograph of a disk.
		- Snapshots are point in copies of Volumes.
		- Snapshots are incremental. this means that only the block that have changed since your last snapshot are moved to S3.
		- To create snapshot for Amazon EBS volumes that serves as root. we need stop the Instance before taking snapshot.

		- copy ebs volume from one AZ to another AZ. 
			- create a snapshot []
			- convert snapshot to AMI 
			- Use that AMI to launch into other AZ 
			- 

	AMI_Types: EBS Vs Instance Store
		- Instance store volumes sometimes called Ephemeral storage(if stop we loose all of our data.)
		- Instance store volumes cannot be stopped. If underlying host fails, you will lose data.
		- Instance store is ideal for temporary storage of information that changes frequently, such as buffers, caches & other temporary content.

		- EBS backed instances can be stopped. We are not going to loose data on these instances if stopped.
		- EBS backed instances can be rebooted and can not loose data.
		- EBS volumes we can keep the root device volume.

	Encypted Root Device volumes & Snapshots
		- Snapshots of encypted volumes are encypted automatically.
		- volumes restored from encypted Snapshots are encrypted automatically.
		- You can share Snapshots only if they are unencrypted
		- These Snapshots can be shared with other AWS accounts or made public.

		Steps to encrypt the root device volume 
			- Create a Snapshot of the unencrypted root device volume
			- Create a copy of the snapshot and select the encrypt option
			- Create a AMI from the encypted Snapshot
			- Use that AMI to launch new encrypted instances
			- After that Root device volume is encrypted
	
	RAID: (Redundant Array of Inexpensive Disks)
		- is a data storage virtualization technology that combines multiple physical disk drive components into one or more logical units for the purposes of data redundancy, performance improvement, or both.
		- Remeber that the RAID available in AWS is only software

		- RAID0: – splits ("stripes") data evenly across two or more disks. 
			- RAID 0 allows you to stack EBS volumes in a “rack,” that dramatically boosts performance by combining the throughput and IOP performance, 
			- but provides a single point of failure (if one volume goes down, the whole rack goes down).
		- RAID1: – consists of an exact copy (or mirror) of a set of data on two or more disks.
		- RAID5: and RAID 6 are not recommended for Amazon EBS because the parity write operations of these RAID modes consume some of the IOPS available to your volumes.

	Elastic_Load_Balancers: ELB
		- automatically distributes incoming application traffic across multiple targets in multi AZ, such as 
			- Amazon EC2 instances
			- Container (ECS)  
			- IP Addresses
		- Load balancers would not expose any IP, instead they expose DNS names.
		- Cross_Zone_Load_balancing: When enabled distribute traffic across multi AZ. 

		Types_of_Load_Balancer:
			- Application_Load_balancers: Best for load balancing HTTP & HTTPS traffic. They operate at layer 7. 
				- Support Path-based and host-based routing.
				- Need at least 2 subnets for this load balancer.
			- Network_Load_Balancer: Loadbalancing TCP traffic where extreme performance is needed. They operate at layer 4.
			- Classic_Load_Balancer: Legacy ELB, mostly operate at layer 4, but can go up to 7.
		
		X-Forwarded-For:
			- (XFF) The HTTP header field is a common method for identifying the originating IP address of a client connecting to a web server through an HTTP proxy or load balancer.

	[Lot of questions in EXAM]

	******* EXAM: *******
	Cloud_watch: is a monitoring service for logging and alarming.
		- Cloud_watch: do not aggregate data across regions. Metrics are separate between regions.
			- CloudWatch will only cover the activities of the regional services (EC2, S3, RDS etc.) and not for global services such as IAM, CloudFront, AWS WAF, and Route 53.
		- Cloud watch provide 
			- CPU Utilization
			- Network Utilization
			- Disk performance
			- Disk Reads/Writes

		- there are certain metrics that are not readily available in CloudWatch such as 
			- memory utilization, 
			- disk space utilization, 
			- disk swap utilization, 
			- page file utilization, 
			- log collection and many others which can be collected by setting up a custom metric.

		- CloudWatch alarm actions, you can create alarms that automatically stop, terminate, reboot, or recover your EC2 instances
		- multi-platform CloudWatch agent which can be installed on both Linux and Windows-based EC2 instances.

		Two key funtionality:
		 - monitoring resources
		 - alerting you
		
	Cloud_Trail: increase visbility into your user and resource activity by recording AWS Management console and API calls. LIKE A CCTV
		** CloudTrail is the record of an activity in an AWS account. This activity can be an action taken by a user, role, or service that is monitorable by CloudTrail.
		- There are two types of events that can be logged in CloudTrail: management events and data events.
		** A trail can be applied to all regions or a single region
		- CloudTrail is a service that enables governance, compliance, operational auditing, and risk auditing of your AWS account

	Differemce:
		Cloud_Watch: monitors performance/resources
		Cloud_Trail: monitor API calls in the AWS platform. It is about auditing

	Standard monitoring = 5 min
	Detailed monitoring = 1 min

	What you can do with cloud watch 
		- Create dashboards
		- Create alarms
		- Events 
		- Logs - Cloud watch log allow you to aggregate, monitor and store logs.

	AWS_Command_Line:
		- Learned about .aws where access key and secrets were stored on your machine.
		- This is not a secure way to access AWS. Instead used role and assign to EC2.

	Identity_Access_Management_Roles:
		- Roles are more secure than storing your access key and secret access key on individual EC2 instances
		- Roles are easier to manage 
		- Roles can be assigned to EC2 after it is created using console or command line.
		- Roles are universal - you can use them in any region.

	BootStrap: is a way to automate EC2 deployments
		#!/bin/bash
		yum update -y
		yum install httpd -y
		service httpd start
		chkconfig httpd on
		cd var/www/html
		echo "<html><h1>Hello Cloud guru welcome to my page.</h1></html>" > index.html
		aws mb s3://BucketViaBash
		aws s3 cp index.html s3://BucketViaBash

	metadata:
		- use to get information about the instance (such as IP addresses)
		- curl http://169.254.169.254/latest/meta-data
		- curl <ip_address>/latest/userdata/

	Elastic_IP_Address:
	 	- An Elastic IP address is a public IPv4 address, which is reachable from the internet.
	 	- If your instance does not have a public IPv4 address, you can associate an Elastic IP address with your instance to enable communication with the internet
	 	- AWS do not support Elastic IP addresses for IPv6.

	Lanch_configurations_AND_Auto_Scaling_group: 
		- is an instance configuration template that an Auto Scaling group uses to launch EC2 instances
		- An Auto Scaling group contains a collection of Amazon EC2 instances that are treated as a logical grouping for the purposes of automatic scaling and management.
		- Autoscaling group will automatically spread evenly on the number of instances across the AZ you selected once you configured it. So 3 AZ with 3 as group size, means 1 box in each AZ
		- Keep in mind that whenever you create an Auto Scaling group, you must specify a launch configuration, a launch template, or an EC2 instance.
	
	Placement_groups: 
		- You can launch or start instances in a placement group, which determines how instances are placed on the underlying hardware. 
		- The name you specify for a placement group must be unique within your AWS account.
		- Only specific types of instances can be launched in a placement group.
		- You canot merge placement groups.
		- You canot move an existing instance into a placement group.

		Types of placement group:
			- Clustered placement groups 
				- grouping of instances in a single AZ. 
				- This is needed for a application which need low network latency, high throughput . 
			- Spread placement groups	
				- Instance are away from each other. 
				- It can span across multiple AZ.
			- Partition 
				- Spreads instances across logical partitions, ensuring that instances in one partition do not share underlying hardware with instances in other partitions.

	Elastic_File_Storage: EFS:  https://aws.amazon.com/efs/
		- Amazon EFS provides scalable file storage for use with Amazon EC2.
		- You can create an EFS file system and configure your instances to mount the file system

		- Supports NFSv4.
		- You only pay for the storage you use.
		- Scale up to petabytes.
		- Can support thousands of concurrent connections.
		- Data is stored across multiple AZ. ******
		- Read after write consistency. ******
		- You need to make sure that the EC2 instance that needs to connect with the EFS volume, is associated with the same security group you have on the EFS volume.
		- You can assign permissions at the file level and at the folder level.
		- ******** Exam *****
		- When an instance terminates, Amazon EC2 uses the value of the DeleteOnTermination: attribute for each attached Amazon EBS volume to determine whether to preserve or delete the volume.
			- Changing this attribute to “false” will ensure the EBS volumes are not deleted when the instances are terminated.


	Amazon_ECS:******
		- Amazon ECS enables you to inject sensitive data into your containers by storing your sensitive data in either AWS Secrets Manager secrets or AWS Systems Manager Parameter Store parameters and 
			- then referencing them in your container definition. This feature is supported by tasks using both the EC2 and Fargate launch types.
		- ******
		-  A Task Definition is required to run Docker containers in Amazon ECS and you can specify the IAM role (Task Role) that the task should use for permissions.


	Lambda:
		- AWS Lambda lets you run code without provisioning or managing servers.
		- You pay only for the compute time you consume - there is no charge when your code is not running.
		- Lambda basically is based on triggers.

		You can use lambda in two ways:
		- Event_driven_based: Lambda runs your code based on events, such, new file on S3 or a new alarm on cloudwatch
		- Compute_service_based: Lambda runs your code based on HTTP requests using an API Gateway or API calls made using AWS SDKs.

		Lambda_is_charged_as_follow:
		- First 1M requests per month are free. $0.20 PER 1M requests thereafter
		- Duration: You are charged for the amount of memory you allocate on your functions. First 400,000 GB-seconds per month, up to 3.2M seconds of computing time, are free.
		- Your functions canot go over 5 minutes in run-time.

	Same_origion_policy:
		- This is enforce by client.

	Cross_Origin_Resource_Sharing: (CORS) - https://docs.aws.amazon.com/AmazonS3/latest/dev/cors.html
		- defines a way for client web applications that are loaded in one domain to interact with resources in a different domain
		- CORS enables clients in one domain to interact with resources in a different domain

******* EXAM: *********

	- Transferring data from an EC2 instance to 
		- Amazon S3, 
		- Amazon Glacier, 
		- Amazon DynamoDB, 
		- Amazon SES, 
		- Amazon SQS, or Amazon SimpleDB in the same AWS Region has no cost at all.

	- Lambda@Edge lets you run Lambda functions to customize the content that CloudFront delivers, executing the functions in AWS locations closer to the viewer.
	
	- Amazon EC2 has a soft limit of 20 instances per region, which can be easily resolved by completing the Amazon EC2 instance request form
	
	- An elastic_network_interface: (ENI) is a logical networking component in a VPC that represents a virtual network card. You can attach a network interface to an EC2 instance in the following ways:
		- When it is running (hot attach)
		- When it is stopped (warm attach)
		- When the instance is being launched (cold attach).

	- Remember that since the instance is using a RAID configuration, the snapshot process is different. You should stop all I/O activity of the volumes before creating a snapshot.	
	- Amazon Data Lifecycle Manager (Amazon DLM) to automate the creation, retention, and deletion of snapshots taken to back up your Amazon EBS volumes.

	- Perfect Forward Secrecy is a feature that provides additional safeguards against the eavesdropping of encrypted data, through the use of a unique random session key.
		- CloudFront and Elastic Load Balancing are the two AWS services that support Perfect Forward Secrecy

	- AWS Fargate launch type which is a serverless infrastructure managed by AWS. 
		- Fargate only supports container images hosted on Elastic Container Registry (ECR) or Docker Hub.

	- You can specify whether Amazon EC2 should hibernate, stop, or terminate Spot Instances when they are interrupted.

==== Section 5 =====
===========================================================================
===========================================================================

Databases
	
	relational_DataBase: Think of a data stored in excel file. data in a relational database is organized into tables.
		-  It uses a structure that allows us to identify and access data in relation to another piece of data in the database
		- Example: SQL, PostgreSQL, MySQL, Oracle, MariaDB, Aurora
		- Relational Database Service (RDS)(OLTP)
		- A relational database is known for having a rigid schema, with a lot of constraints and limits as to which (and what type of) data can be inserted or not. 
	
		RDS has 2 key Features
			- Multi AZ for disaster revovery 
			- Read Replicas for performance

	non_relational_DataBase: This is also referred as NoSQL databases
		- DynamoDB (NoSQL)
		- NoSQL, it is not as rigid as a relational database because you can easily add or remove rows or elements in your table/collection entry.
		- It also has a more flexible_schema: because it can store complex hierarchical data within a single item
		- consist of 
			- Collection = tables
			- Documents = rows
			- Key_Value_Pair = Fields

	DB instance storage comes in three types: 
		- Magnetic, 
		- General Purpose (SSD) - can provide bursts of performance up to 3,000 IOPS
		- Provisioned IOPS (PIOPS) -  provides sustained performance for mission-critical low-latency workloads

	Amazon RDS storage types?
		- High-performance OLTP workloads: Amazon RDS Provisioned IOPS (SSD) Storage
		- Database workloads with moderate I/O requirements: Amazon RDS General Purpose (SSD) Storage

	Amazon RDS General Purpose (SSD) storage
		- is suitable for a broad range of database workloads that have moderate I/O requirements.
		- With the baseline of 3 IOPS/GB and ability to burst up to 3,000 IOPS

	Amazon RDS Provisioned IOPS (SSD) storage?
		- is an SSD-backed storage option designed to deliver fast, predictable, and consistent I/O performance.
		- you specify an IOPS rate when creating a DB instance and Amazon RDS provisions that IOPS rate for the lifetime of the DB instance.
	
	Amazon RDS Magnetic storage?
		- is useful for small database workloads where data is accessed less frequently.
		- Magnetic storage is not recommended for production database instances.
		
	data_warehousing:
		- Is a system used for reporting and data analysis, and is considered a core component of business intelligence.

	OLTP (online transaction processing) vs. OLAP (online analytic processing)
		- We can divide IT systems into transactional (OLTP) and analytical (OLAP). 
		- RDS (OLTP) - e.g when searching a product in amazon site
		- In general, we can assume that OLTP systems provide source data to data warehouses, whereas OLAP systems help to analyze it.
		- OLAP - When store manager search on product using inventory for analyzing purposes.
	

	EXAM_QUESTION: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html

	Elastic_cache: In Memory Caching
		- Used to speed up performance of exising databases (Frequently accessed identical queries) and web application.
		- Elastic cache support 2 open source in-memory caching engines
			- MemCached:
				- if you need to scale horizontally use MemCached
			- Reddis: In memory key-value store 
				- Reddis is Multi AZ
				- you can back up and restore of Reddis

	RDS_Execise:
		- RDS run on virtual Machines. You can not log into these systems
		- RDS is serverless. Aurora Serverless is Serverless

	RDS_BackUps_MultiAZ_ReadReplicas:
		Multi AZ
			- Multi AZ is for disaster recovery only.
			- you can force a failover from one AZ to another by rebooting the RDS instance.  
			- When you provision a Multi-AZ DB Instance, Amazon RDS automatically creates a primary DB Instance and synchronously replicates the data to a standby instance in a different Availability Zone.

		Read Replicas
			- Use to increase performance
			- must have back up turned on 
			- can be in different region
			- you can not have read replicas for SQL server
			- allow you to have read only copy of your production databases. This can be done via asynchronously replication from the primary RDS instance.
			- used for read-heavy database workloads.

		** improve the performance of database **
			- use Elasticache
			- use read replicas	

			- Encryption can be done using AWS KMS 

		Two different type of back up for RDS 
			- Automated_backups:
				- When automated backups are turned on for your DB Instance, Amazon RDS automatically performs a full daily snapshot of your data (during your preferred backup window) and captures transaction logs
			- Database_Snapshots:
				- DB Snapshots are user-initiated and enable you to back up your DB instance in a known state as frequently as you wish, and then restore to that specific state at any time

	DynamoDB: NoSQL database - it is not an RDBMS service and therefore it will never have the ability to store relational data.

		- Amazon DynamoDB is a key-value and document database that delivers single-digit millisecond performance at any scale. It is fully managed.
			- Uses SSD storage.
			- Spread across 3 distinct data centres. Which got 6 copies of your data.
			- Eventual Consistent Reads (Default)
				- Consistency across all copies of data is usually reached within a second. (best read performance)
			- Strongly Consistent Reads.
				- Consistency across all copies of data is usually reached LESS than a second.
			- It is scalable.
			- DynamoDB can be very expensive for writes.
			- DynamoDB Time-to-Live (TTL) mechanism enables you to manage web sessions of your application easily

	RedShift: (OLAP)  **** EXAM ****
			- Amazon Redshift is a fast, scalable data warehouse that makes it simple and cost-effective to analyze all your data across your data warehouse.
			- Amazon solution for online analysis.
			- Redshift stores data by columns.
			- is used for business intelligence or data warehousing
			- It is only available in 1 AZ

			-*** Amazon_Redshift: 
				- Amazon RedShift Enhanced VPC routing forces all COPY and UNLOAD traffic between clusters and data repositories through a VPC

			- WORK LOAD MANAGEMENT (WLM)


	Aurora:
		- Amazon Aurora is a MySQL and PostgreSQL-compatible relational database built for the cloud, that combines the performance and availability of traditional enterprise databases with the simplicity and cost-effectiveness of open source databases.		
		- Amazon Aurora is a relational database that will automatically scale to accommodate data growth.

		Scaling:
			- Scales in 10GB Increments up to 64TB
			- Compute resources can scale up to 32vCPUs and 244GB of Memory.
			- 2 Copies of your data are contained in each availability zone, with a minimum of 3 availability zones.
			- Aurora handles the loss of up two copies of data without affecting database write capability.
			- Aurora handles the loss of up three copies of data without affecting database read capability.

		Replicas:
			- Aurora Replicas: Separate aurora replicas (up to 15 replicas).
			- MySQL Read replicas: (up to 5 replicas).
			- In case of loss of the primary aurora DB, failover will automatically occur on the Aurora replica, it will not in the MySQL read replica.

   	********** EXAM: **********
    - Both the Oracle and SQL Server database engines have limits to how many databases that can run per instance

    - Open Source technology such as Aurora, MySQL, MariaDB or PostgreSQL have no such limits.

    - database_authentication:
    	IAM_DB_Authentication:
	    	- You can authenticate to your DB instance using AWS Identity and Access Management (IAM) database authentication. IAM database authentication works with MySQL and PostgreSQL.
	    	- With this authentication method, you do not need to use a password when you connect to a DB instance. Instead, you use an authentication token.

    - Amazon DynamoDB Accelerator (DAX:) 
    	- is a fully managed, highly available, in-memory cache that can reduce Amazon DynamoDB response times from milliseconds to microseconds

    - Amazon RDS Multi-AZ deployments provide enhanced availability and durability for Database (DB) Instances
    - You can store session state data on both DynamoDB and ElastiCache.

    - Amazon RDS automatically performs a failover in the event of any of the following:
		- Loss of availability in primary Availability Zone
		- Loss of network connectivity to primary
		- Compute unit failure on primary
		- Storage failure on primary

	- When failing over, Amazon RDS simply flips the canonical name record (CNAME) for your DB instance to point at the standby instance.

	- ElastiCache Redis has a good use case for autocompletion

	- You cannot encrypt an existing DB, you need to create a snapshot, copy it, encrypt the copy, then build an encrypted DB from the snapshot.

	- There two main ways you can increase performance on an Amazon RDS database are 
		- 1) scale up to a larger RDS instance type with more CPU/RAM, and 
		- 2) use RDS read replicas to offload read traffic from the master database instance.
		- Using multi-AZ will not increase performance, it only increases availability


==== Section 6 =====
===========================================================================
===========================================================================

Route 53 
	
	DNS:
	 - Domain Name Systems (DNS) is the phonebook of the Internet.
	 - Humans access information online through domain names, like nytimes.com or espn.com
	 - Web browsers interact through Internet Protocol (IP) addresses.
	 	- IP addresses comes in 2 forms 
	 		- IPv4
	 			- 32 bit field and has over 4 billion addresses
	 		- IPv6
	 			- 128 bit. Created to solve depletion issue of IPv4
	 	- Top level domain (TLD)
	 		- .com
	 		- .edu
	 		- .gov

	 	- Common DNS Types		
		 	- Start of authority (SOA)
		 		- Contains all the record for DNS entry 

		 	- Name server record (NS Record)
		 		- They are used by TLD to direct traffic to the content DNS server which contain authoritative DNS record.

		 	- A Records 
		 		- "A" record is a fundamental type of DNS record. "A" record stands for "Address".
		 		- "A" record used by computer to translate the name of the domain to an IP address.

		 	- CName (Canonical Name)
	 			- CNAME records can be used to resolve one domain name to another. 

	 		- MX records (Mail records)

	 		- PTX records 

	 	- ALIAS record
	 		- An ALIAS record is a virtual record type we created to provide CNAME-like behaviour on apex domains.
	 		- For example, if your domain is example.com and you want it to point to a hostname like myapp.herokuapp.com, you can’t use a CNAME record, but you can use an ALIAS record.
	 		
	 		Key_difference:
	 		- Cname can not have naked domain name e.g. (https://acloud.guru) it must be A record or Alias record.

	 	- Time to live (TTL)
	 		- the length DNS record is cached on either resolving server or user local PC in seconds.
	 		- The lower the ttl faster the changes to DNS records to propogate throughout the  internet.
	 		- default time is 48 hrs.
	 	
	 	

	 Exam Tips:
	 	- ELB do not have predefined IPv4 addresses; you resolve to them using  DNS name.
	 	- Understand difference between alias record and Cname 
	 	- Given a choice always use Alias record over Cname 
	 	- A Route_Origin_Authorization: (ROA) - ROA authorizes Amazon to advertise an address range

==== Section 7 =====
===========================================================================
===========================================================================

VPC  
	5-10 questions in exams on VPC.

	What Is Amazon VPC? (Virtual Private Cloud)
	- VPC is your private section of AWS, Where you can place AWS resources and allow/restrict access to them.
	- Think of a VPC as a virtual data centre in the cloud.

	What are the components of Amazon VPC

		VPC: 
			- A virtual private cloud (VPC) is a virtual network dedicated to your AWS account. It is logically isolated from other virtual networks in the AWS Cloud.

		Subnet: 
			- A subnet is a range of IP addresses in your VPC. You can launch AWS resources into a specified subnet. 
			- Use a public subnet for resources that must be connected to the internet, and a private subnet for resources that are not be connected to the internet.
			- To protect the AWS resources in each subnet, you can use multiple layers of security, including security groups and network access control lists (ACL)

		Internet_Gateway: 
			- The Amazon VPC side of a connection to the public Internet.		

		NAT_Gateway: Network Address Translation
			- A highly available, managed Network Address Translation (NAT) service for your resources in a private subnet to access the Internet.

		Virtual_private_gateway: 
			- The Amazon VPC side of a VPN connection	
			- Use to connect to VPN

		Peering_Connection: 
			- A peering connection enables you to route traffic via private IP addresses between two peered VPCs.

		VPC_Endpoints: 
			- Enables private connectivity to services hosted in AWS, from within your VPC without using an Internet Gateway, VPN, Network Address Translation (NAT) devices, or firewall proxies.

		Egress_only_Internet_Gateway: 
			- A stateful gateway to provide egress only access for IPv6 traffic from the VPC to the Internet.

	What we can do with a VPC 
		- Launch instances into subnet of your choice.
		- Assign custome IP address range in each subnet
		- Configure route tables in each subnets
		- Create internet gateway and attach it to your VPC 
		- Much better security control over your aws resources
		- Instance Security groups
		- Subnet network access control list (ACLS)
	
	Default VPC
		- Amazon provides a default VPC to immediately deploy instances.
		- All Subnets in default VPC have a route out to the internet.
		- Each EC2 instance got public and private IP address.

	VPC_Peering:
		- You can peer one VPC to another VPC using private IP subnets.
		- You can peer VPC's with others AWS accounts as well as with other VPC's in the same account.

	tips_to_remember:
		- SG are Stateful; Network access control list is  Stateless
		- 1 subnet = 1 AZ (We can have multiple subnet in 1 AZ)
		- NO TRANSITIVE PEERING
		- Amazon reserve 5 IP addresses within your subnets 
		- 1 gateway per VPC 
		- Securit group can not span across VPC.
		- An Application Load Balancer must be deployed into at least two subnets.
		- A Bastion host allows you to securely administer (via SSH or RDP) an EC2 instance located in a private subnet.

	NAT - Network Address Translation
		- Allow your private subnet to communicate to the internet.

		Consist of two things
		
		- NAT_instance: This is specific to single EC2 instance 
			- When creating a NAT instance disbale Source/Destination Check on the instance.
			- NAT instance must be in public subnet
			- There must be a route out of the private subnet to the NAT instance.
			- The amount of traffic NAT instance can support depends on the instance size. 

		- NAT_Gateway: Allow your private subnet to communicate to the internet.
			- redundant inside the AZ
			- starts at 5 gbps and scales currently to 45 gbps
			- automatically assign public ip address
			- remember to update route tables. 
			- No need to disbale Source/Destination Check on the instance.

	NACL Vs SG
		- NACL cannot be deployed in multiple VPCs.
		- NACL cannot be attached to multiple subnets, only one at the time.
		- Each subnet must be associated with a network ACL, if you donot, default NACL will be used.
		- By default when you create one NACL, everything is denied.
		- Rules are applied in numerical order (starting from the lowest), so when you should create the first rule having number 100 and add others on incremental of 100
		- Remember to open ephemaral ports on your outbound rules only.


	VPC_flow_logs:
		- Following traffic is not monitored
			- DHCP
			- Traffic to reserved IP address for default VPC.
			- Traffic to and from 192.254.169.254 for instance metadata 

	Direct_Connect:
		- Directly connects your data centre to AWS 
		- Useful for high throughput worklods
		- Secure reliable connection 

	VPC_Endpoints:
		- A VPC endpoint enables you to privately connect your VPC to supported AWS services and VPC endpoint services powered by PrivateLink without requiring an internet gateway, NAT device, VPN connection, or AWS Direct Connect connection.

		2 type of VPC endpoints
			- Interface endpoint
			- Gateway endpoint
				- Supported for Amazon S3 
				- DynamoDB

	Elastic_IP_Addresses: 
		- An Elastic IP address is a public IPv4 address, which is reachable from the internet.
		- If your instance does not have a public IPv4 address, you can associate an Elastic IP address with your instance to enable communication with the internet.
		- An Elastic IP address is associated with your AWS account


	Create_Custom_VPC:

		Step1: Create a VPC. by default it will create 3 more items
				- Route table
				- NACL 
				- Security group
		
		Step2: Create 2 subnets 

		Step3: Make 1 subnet as public update following settings (so when we launch EC2 in public subnet it will assign IP address automatically)
				- Update "Modify auto assign IP settings"
			  
		Step4: Create internet gateway ( we allow subnet that can interact with outside world via internet.)

		Step5: Create a public route table (So we can put route out to internet.)
				- Try not to modify private/default route table.
				- Any default created subnet will be assigned to default route table.

		Step6: Update route table created in step5 to add route out to internet.
				- 0.0.0.0/0  attach to IG created in step 4	  # route out for IPv4
				- ::/0       attach to IG created in step 4  # route out for  for IPv6

		Step7: Associate public subnet with the public route table .
				- When we attach subnet to this route table it will become public.

		Step8: Create 2 EC2 instances. One in public and one in private.
				- Public EC2 in one SG  (DMZ)
				- Private EC2 in another SG (DB-SG)


		Step9: The SG associated with Private EC2
				- It should all ICAMP # That will allow you to ping inside private subnet
				- All to do SSH 
				- ALL to do HTTP and HTTPS 

				- Grab Private IP address of Private EC2.
				- Login/SSH into public subnet. Then try to ping private EC2 


		Step10: Try to SSH into Private EC2 via Public EC2 
				- You need keys to do that.
					
		Step11: If we want public EC2 communicate with private we need NAT (instance/gateway)
				- NAT instance - nothing but a EC2 instance
					- Create EC2 instance.
					- Disbale disbale Source/Destination Check on the instance.
					- Update (default) routing table to communicate  NAT instance to Private EC2 

				- NAT Gateway
					- Create a NAT gateway 
						- Obtain a elastic IP address 
					- Update (default) routing table to communicate  NAT instance to Private EC2
						- 0.0.0.0/0

******* EXAM: *******
- In an ideal and secure VPC architecture, you launch the web servers or elastic load balancers in the public subnet and the database servers in the private subnet.
- Direct_Connect: is a network service that provides an alternative to using the Internet to connect customers’ on-premise sites to AWS.
- 

==== Section 8 =====
===========================================================================
===========================================================================

HA architecture

	Advance_Load_Balancer: Watch video to referh these concepts 

		Sticky_Sessions: 
			- allow you to bind a users session to a specific ec2 instance.
			- This ensures that all the request from the user during that session are sent to the same instance.
			- Sticky sessions can be enabled for application load balancer but traffic will be sent to target group level.


		Cross_Zone_Load_balancing: https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-crosszone-lb.html
			- Enables you to load balance across multiple AZ.

		Path_Patterns:
			- Allow you to direct traffic to different EC2 instances based on URL contained in request.
				e.g for image traffice is sent to different EC2 in other AZ.

		launchconfiguration:
			- A launch configuration is a template that an Auto Scaling group uses to launch EC2 instances. 
			- When you create a launch configuration, you specify information for the instances such as the ID of the Amazon Machine Image (AMI), the instance type, a key pair, one or more security groups, 
			and a block device mapping.

		Auto_Scaling_Group: ASG
			- Auto Scaling group contains a collection of EC2 instances that share similar characteristics and are treated as a logical grouping 
			for the purposes of instance scaling and management.

			Scaling_Out: We use ASG and we add additional ec2 instances 
			Scaling_up: We increase recources in our EC2 like RAM, CPU

			Dynamic_Scaling:
				- to add and remove capacity for resources to maintain resource utilization at the specific target value.
			Predictive_Scaling:
				- to forecast your future load demands by analyzing your historic record for metric.
				***EXAM:****
				- Scaling based on a schedule allows you to scale your application in response to predictable load changes.
					- To configure your Auto Scaling group to scale based on a schedule, you create a scheduled action. 
					- The scheduled action tells Amazon EC2 Auto Scaling to perform a scaling action at specified times.


		HA_Architecture:
			- 

		Cloud_Formation:
			- gives developers and systems administrators an easy way to create and manage a collection of related AWS resources, provisioning and updating them in an orderly and predictable fashion.
			- You can use AWS CloudFormation’s sample templates or create your own templates to describe the AWS resources, and any associated dependencies or runtime parameters, required to run your application.
			- ********* EXAM ******
			- TemplateURL, lets you specify where the CloudFormation template for a stack action
			- CloudFormation allows you to define your infrastructure through code and securely and repeatably deploy the infrastructure with minimal administrative effort. 
				- This is a perfect use case for CloudFormation.

	   Availability: Availability can be described as the % of a time period when the service will be able to respond to your request in some fashion.	
       Durability: a resource will continue to exist until you decide to remove it.
       resiliency: a resource ability to recover from damage or disruption
       Reliability: Reliability is closely related to availability, however a system can be 'available' but not be working properly. Reliability is the probability that a system will work as designed. 
       		- The ability of a system to recover from infrastructure or service disruptions, dynamically acquire computing resources to meet demand, and mitigate disruptions

    AWS_Well_Architected_Framework:
    		The Well-Architected Framework has been developed to help cloud architects build secure, high-performing, resilient, and efficient infrastructure for their applications.

    	Five_Pillars:
    		- Operational excellence
    		- Security
			- Reliability
			- Performance efficiency
			- Cost optimization

		General_Design_Principles:
			- Stop guessing your capacity needs.
			- Test systems at production scale.
			- Automate to make architectural experimentation easier.
			- Allow for evolutionary architectures.
			- Data-driven architectures.
			- Improve through game days.

yum update -y
yum install http -y
service http start
cd var/www/html
echo "<html><h1>Hello Cloud guru. This is web server01</h1></html>" >  index.html

Questions:
	- Scaling based on a schedule allows you to scale your application in response to predictable load changes.
		- To configure your Auto Scaling group to scale based on a schedule, you create a scheduled action.
	- Cheat sheet - https://tutorialsdojo.com/aws-cheat-sheet-aws-auto-scaling/

==== Section 9 =====
===========================================================================
===========================================================================
Application_Services:
	
	SQS: Amazon Simple Queue Service (SQS) is a fully managed message queuing service that enables you to decouple and scale microservices, distributed systems, and serverless applications.

		- It is basically a message queue service, like Kafka for example. You add items in the queue, and then someone will ask for these objects from the queue.
		- Retention can go up to 14 days.
		- It is a pull base system.
		- Message are 256 KB in size.
		- You can have duplicates if you donot manage very well your visibility timeouts.
		- Type of queues:
			- Default: All queue are standard by default. They donot have an order. Ordering is best-effort, so they donot guarantee ordering on default queues.
			- FIFO: (first in first out) These queues guarantee ordering.
					
		- SQS long polling doesnt return a response until a message arrives in the queue, reducing your overall cost over time. 

	SWF: (Simple Workflow Service) is an Amazon Web Services tool that helps developers coordinate, track and audit multi-step, multi-machine application jobs.

		- It ensures that a task is assigned only once and is never duplicated.
		- Retention can go up to 1 year
		- SWF Workers: Workers are programs that interact with Amazon SWF to get tasks, process received task, and return the result.
		- SWF Decider: The decider is a program that controls the coordination of tasks.
		- SWF Domains: Domains isolate a set of types, executions, and task lists from others within the same account.

	SNS: enables message filtering and fan out to a large number of subscribers, including serverless functions, queues, and distributed systems. Additionally, Amazon SNS fans out notifications to end users via mobile push messages, SMS, and email.

		- In the exams it will be around Auto Scaling questions.
		- SNS stores copies of the messages on multiple AZ.
		- Push-based
		- It can notify through:
			- AWS Lambda functions
			- HTTP/S webhooks
			- mobile push
			- SMS
			- email

	Elastic_Transcoder: Amazon Elastic Transcoder a is media transcoding service.

	API_Gateway: 5-10 marks in exam 

		Amazon API Gateway is a fully managed service that makes it easy for developers to create, publish, maintain, monitor, and secure APIs at any scale.

		- You can enable cache
		- Scaled automatically
		- You can throttle requests
		- Connect to CloudWatch to log all requests.
		- CORS is enforced by the client.

	Kinesis:
		Amazon Kinesis makes it easy to collect, process, and analyze real-time, streaming data so you can get timely insights and react quickly to new information.

		- Kinesis streams: It consists of shards, where each stream is saved and stored for 24h, up to 7 days. You can have multiple shards on each stream. A consumer then read from the shards and process the data.
		- Kinesis Firehose: It doesnot have shards, so data traverses the Firehose. Data has to be processed immediately with lambda or stored in S3 for example.
							It can stream data to 
								- Amazon S3, 
								- Amazon Redshift, 
								- Amazon Elasticsearch Service, and Splunk, enabling near real-time analytics with existing business intelligence tools
		- Kinesis Analytics: It allows you to analyze the data that exists in Kinesis Firehose of streams.

**** EXAM ****
- Amazon MQ supports industry-standard APIs and protocols so you can migrate from your existing message broker without rewriting application code.
- Amazon SQS is a message queueing service and is not compatible with industry-standard message brokers. You would need to rewrite some application code to get the application working with SQS

- In API Gateway Throttling can be configured at multiple levels including Global and Service Call
- API Gateway can scale to any level of traffic received by an API. 
- API Gateway scales up to the default throttling limit of 10,000 requests per second, and can burst past that up to 5,000 RPS.
- Throttling is used to protect back-end instances from traffic spikes

- To publish messages to Amazon SNS topics from an Amazon VPC, create an interface VPC endpoint.


===========================================================================
==== Section 9 =====
===========================================================================
===========================================================================

Serverless:

	Lambda:
		- AWS Lambda lets you run code without provisioning or managing servers. 
		- You pay only for the compute time you consume - there is no charge when your code is not running. 

		- Lambda can be triggered in two ways:
			- Event_driven_based: Lambda runs your code based on events, such, new file on S3 or changes in DynamoDB or  a new alarm on cloudwatch
			- Compute_service_based: Lambda runs your code based on HTTP requests using an API Gateway or API calls made using AWS SDKs.

		- AWS lambda, supports: Node.js, Python, Go, Java, PowerShell and  C#
		- Lambda is charged as follow:
			- First 1M requests per month are free. $0.20 PER 1M requests thereafter
			- Duration: You are charged for the amount of memory you allocate on your functions. First 400,000 GB-seconds per month, up to 3.2M seconds of computing time, are free.
			- Your functions canot go over 5 minutes in run-time.
		- AWS X-Ray is use to debug lambda

	Cross_Origin_Resource_Sharing: (CORS)
		- defines a way for client web applications that are loaded in one domain to interact with resources in a different domain
			- With CORS support, you can build rich client-side web applications with Amazon S3 and selectively allow cross-origin access to your Amazon S3 resources.

	****** EXAM: ******
	- When you create or update Lambda functions that use environment variables, AWS Lambda encrypts them using the AWS Key Management Service. 
		- When your Lambda function is invoked, those values are decrypted and made available to the Lambda code.
	
	- how traffic is shifted from the original AWS Lambda function version to the new AWS Lambda function version
		- Canary: Traffic is shifted in two increments. 
			- specify the percentage of traffic shifted in the first increment and the interval, in minutes, before the remaining traffic is shifted in the second increment.

		- Linear: Traffic is shifted in equal increments with an equal number of minutes between each increment.	
		- All-at-once: All traffic is shifted from the original Lambda function to the updated Lambda function version at once.
===========================================================================
===========================================================================

Questions:

- AWS does not copy launch permissions, user-defined tags, or Amazon S3 bucket permissions from the source AMI to the new AMI.

- Amazon_Athena:
	- is an interactive query service that makes it easy to analyse data in Amazon S3, using standard SQL commands. 
	- Support these formats "JSON", "Apache Parquet", "Apache ORC".

- AWS_WAF: Web Application Firewall 
	- AWS WAF helps protect web applications from common web exploits that could affect application availability, compromise security, or consume excessive resources.
	- AWS WAF gives you control over which traffic to allow or block to your Amazon Web Services.
	- AWS WAF can block following attacks
		- common attack patterns
		- SQL injection or cross-site scripting
		- rules that are designed for your specific application
		- AWS WAF can block traffic from IP addresses based on rules

- AWS_Shield: is a managed Distributed Denial of Service (DDoS) protection service that safeguards web applications running on AWS.

- Route 53 has the following routing policies 
	- Simple, Weighted, Latency, Failover, Multivalue answer, Geoproximity. and Geolocation

- AWS PrivateLink: simplifies the security of data shared with cloud-based applications by eliminating the exposure of data to the public Internet.

AWS_Security:
	- AWS Shield operates on layer 3 and 4 of the ISO network model and its primary purpose is to protect against DDoS attacks.
	- AWS WAF protect from cross scripting attacks
	- AWS WAF can block traffic from IP addresses based on rules
	- Amazon Macie tackles a different problem related to Data Loss Prevention and protects sensitive data
	- SSL certificates will only be useful to encrypt data in transit, not data at rest.
	- EBS, S3 and EFS all allow the user to configure encryption at rest using either the AWS Key Management Service (KMS) or, in some cases, using customer provided keys.

-  A Route_Origin_Authorization: (ROA) - ROA authorizes Amazon to advertise an address range

- Alias Records can also point to AWS Resources that are hosted in other accounts by manually entering the ARN

- Alias Records have special functions that are not present in other DNS servers. 
	- Their main function is to provide special functionality and integration into AWS services. Unlike CNAME records, they can also be used at the Zone Apex, where CNAME records cannot.

- VPC peering only routes traffic between source and destination VPCs. VPC peering does not support edge to edge routing.

- Chef Configuration management
	- Chef is a configuration management tool for dealing with machine setup on physical servers, virtual machines and in the cloud.
	- Chef recipes are specialized Ruby applications that AWS_OpsWorks_Stacks: uses to perform tasks on instances such as installing packages or creating configuration files.
	- 
- AWS_OpsWorks: is a configuration management service that provides managed instances of Chef and Puppet. 
	- Chef and Puppet are automation platforms that allow you to use code to automate the configurations of your servers.
	- OpsWorks lets you use Chef and Puppet to automate how servers are configured, deployed, and managed across your Amazon EC2 instances or on-premises compute environments.

- AWS services encrypts data at rest by default? 
	- data saved to persistent media, known as data at rest
	- data that may be intercepted as it travels the network, known as data in transit.
		- AWS Storage Gateway 
		- Amazon Glacier
		- Amazon Redshift

- Amazon Simple Queue Service (SQS) and Amazon Simple Workflow Service (SWF) are the services that you can use for creating a decoupled architecture in AWS.
	- Decoupled architecture is a type of computing architecture that enables computing components or layers to execute independently while still interfacing with each other.

- Amazon Cognito is used for adding sign-up, sign-in and access control to mobile apps

- AWS Device farm is an app testing service for Android, iOS and web apps

===========================================================================
===========================================================================

Question_DO_NOT_KNOW:

- SAML Federation (IAM)
- aws directory service ad connector (IAM)
- Amazon Inspector




-AWS services encrypts data at rest by default
	
- AWS Shared Responsibility Model
- ENI attachment to an EC2 instance, what does 'warm attach' 
- cooldown period for ec2 

======= Questions ======


AWS Web Application Firewall - AWS WAF
What are the four levels of AWS premium support?
AWS services allow native encryption of data, while at rest?

 Direct Connect Link 
 Amazon Athena support
 Route 53 routing policies?	

 
===========================================================================
===========================================================================

Study_Plan:
	- Cloud guru videos 

	- FAQ:
		- S3
		- EC2 
		- RDS 
		- Load Balancer
		- SQS 
		- VPC
	
	Class_Dojo:
		- https://tutorialsdojo.com/aws-certified-solutions-architect-associate/

	Practice Test 
		- Jon Bonso
		- Neal Davis

===========================================================================
===========================================================================


================ Docker ================

Docker in 12 mins - https://www.youtube.com/watch?v=YFl2mCHdv24

Images: - Consider images as a class
	- Instances of images are called container
	- Image contains
		- OS
		- Software
		- Application code 

Docker_file: 
	- Simple text file which contains step to create a image. 
	- We can also define path in docker file to get it downloaded from docker hub or Amazon ECR (Elastic container registery)

Container: - Consider container as a object
	- Container communicate via TCP IP
	container are not persistent

Volumes: -

Network: -


Docker_Compose: https://www.youtube.com/watch?v=Qw9zlE3t8Ko
	- tool for defining & running multi-container docker application
	- docker-compose.yml "file name which hold all the commands"
	- commands
		- docker ps 
		- docker compose up
		- docker compose down 


Container registeries 
	Docker Hub - is the official Docker registery from Docker Inc. 
		- Centralize place to store and retrive container images.
		- public registery, a place where you can store and retrieve docker images
		- Private repositories
		- Third Party registery
	AWS EC2 Registry
	
OCI - Open container initiative

Stateless: Does not keep any changes or data
Stateful: Keeps changes and data

Docker container Orchestration Products
	- Docker Machine - Provision docker hosts/engines
	- Docker Compoase - multi-container apps
	- Docker Swarm - Schedule containers over multiplr Docker engines.	


========================================================================================================================
========================================================================================================================
========================================================================================================================
========================================================================================================================








