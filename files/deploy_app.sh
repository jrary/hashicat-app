#!/bin/bash
# Copyright (c) HashiCorp, Inc.

# Script to deploy a very simple web application.
# The web app has a customizable image and some text.

cat << EOM > /var/www/html/index.html
<html>
  <head><title>Meow!</title></head>
  <body>
  <div style="width:800px;margin: 0 auto">

  <!-- BEGIN -->
  <center><img src="http://${PLACEHOLDER}/${WIDTH}/${HEIGHT}"></img></center>
  <center><h2>Meow World!</h2></center>
  Welcome to ${PREFIX}'s app. 나는 정말정말 집에 가고 싶습니다.
  <form>
        <input type="checkbox" id="homeCheckbox" name="homeCheckbox">
        <label for="homeCheckbox">집에 가고 싶다</label>
        <input type="checkbox" id="goHomeCheckbox" name="homeCheckbox">
        <label for="goHomeCheckbox">집에 너무너무 가고 싶다</label>
    </form>
  <!-- END -->

  </div>
  </body>
</html>
EOM

echo "Script complete."

module "s3-bucket" {
  source              = "cloudposse/s3-bucket/aws"
  version             = "3.1.0"
  s3_object_ownership = "BucketOwnerEnforced"
}