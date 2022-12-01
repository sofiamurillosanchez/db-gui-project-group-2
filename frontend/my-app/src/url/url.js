 // ENTER YOUR EC2 PUBLIC IP/URL HERE
 const ec2_url = 'ec2-52-205-137-65.compute-1.amazonaws.com'
 // CHANGE THIS TO TRUE IF HOSTING ON EC2, MAKE SURE TO ADD IP/URL ABOVE
 const ec2 = true;
 // USE localhost OR ec2_url ACCORDING TO ENVIRONMENT
 const url = ec2 ? ec2_url : 'localhost'