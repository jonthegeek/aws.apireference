
<!-- README.md is generated from README.Rmd. Please edit that file -->

# aws.apireference

<!-- badges: start -->

[![R build
status](https://github.com/jonthegeek/aws.apireference/workflows/R-CMD-check/badge.svg)](https://github.com/jonthegeek/aws.apireference/actions)
[![Codecov test
coverage](https://codecov.io/gh/jonthegeek/aws.apireference/branch/master/graph/badge.svg)](https://codecov.io/gh/jonthegeek/aws.apireference?branch=master)
<!-- badges: end -->

The goal of aws.apireference is to help us validate our aws.\* packages
vs the API documentation.

## Installation

This package is unlikely to ever have a CRAN version.

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("jonthegeek/aws.apireference")
```

## Examples

### Actions and Functions

AWS APIs contain a number of actions in `CamelCase`. `aws.*` packages
tend to have `snake_case` functions to invoke those actions. This
package has three functions to deal with that relationship.

``` r
# Get the list of available actions for the EC2 API.
ec2_actions <- get_actions("ec2")
head(ec2_actions)
#> [1] "AcceptReservedInstancesExchangeQuote" 
#> [2] "AcceptTransitGatewayPeeringAttachment"
#> [3] "AcceptTransitGatewayVpcAttachment"    
#> [4] "AcceptVpcEndpointConnections"         
#> [5] "AcceptVpcPeeringConnection"           
#> [6] "AdvertiseByoipCidr"
```

``` r
# Convert those actions to function names.
expected_functions <- get_expected_functions(ec2_actions)
head(expected_functions)
#> [1] "accept_reserved_instances_exchange_quote" 
#> [2] "accept_transit_gateway_peering_attachment"
#> [3] "accept_transit_gateway_vpc_attachment"    
#> [4] "accept_vpc_endpoint_connections"          
#> [5] "accept_vpc_peering_connection"            
#> [6] "advertise_byoip_cidr"
```

``` r
# check_package_functions uses those functions to figure out what a package has
# and what it theoretically should have. Note: You must have the aws.ec2 package
# installed for this example.
ec2_check <- check_package_functions("ec2")

# For simplicity I'm cutting out a few hundred missing functions.
ec2_check$missing_functions <- head(ec2_check$missing_functions)
ec2_check
#> $missing_functions
#> [1] "accept_reserved_instances_exchange_quote" 
#> [2] "accept_transit_gateway_peering_attachment"
#> [3] "accept_transit_gateway_vpc_attachment"    
#> [4] "accept_vpc_endpoint_connections"          
#> [5] "accept_vpc_peering_connection"            
#> [6] "advertise_byoip_cidr"                     
#> 
#> $unmatched_functions
#> [1] "ec2HTTP"
#> 
#> $matched_functions
#> [1] "describe_account_attributes"
```

## Code of Conduct

Please note that the aws.apireference project is released with a
[Contributor Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
