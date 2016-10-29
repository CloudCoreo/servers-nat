cloudcoreo-nat
==============

Highly Available NAT instance configuration

In addition, it will create and maintain a <b>mostly-available</b> NAT instance in the public subnets.

* <b>Mostly-Available</b> refers to the fact that the HA will go down in the event of its AZ outage, but auto scaling will relaunch in a different AZ ensuring minimum downtime of the NAT

This repo is designed to work with the [CloudCoreo](http://www.cloudcoreo.com) engine. Adding this repository as a sub-module will ensure a High-uptime NAT is configured to work even in the event of a loss of availability zone.
