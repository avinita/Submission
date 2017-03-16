name "appserver"
description "AppServer"
run_list "recipe[tomcat]"
default_attributes({
	"owner" => "Avinita_Mohanty"
})