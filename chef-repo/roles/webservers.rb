# AVINITA MOHANTY
# CARNEGIE MELLON UNIVERSITY
# 5 MARCH 2017

name "webservers"
description "WebServers"
run_list "recipe[apache]"
default_attributes({
	"owner" => "Avinita_Mohanty"
})
