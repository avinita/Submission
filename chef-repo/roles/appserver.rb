# AVINITA MOHANTY
# CARNEGIE MELLON UNIVERSITY
# 5 MARCH 2017

name "appserver"
description "AppServer"
run_list "recipe[tomcat]"
default_attributes({
	"owner" => "Avinita_Mohanty"
})
