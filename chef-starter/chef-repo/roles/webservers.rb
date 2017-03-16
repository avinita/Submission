

name "webservers"
description "WebServers"
run_list "recipe[apache]"
default_attributes({
	"owner" => "Avinita_Mohanty"
})