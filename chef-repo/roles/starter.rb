# AVINITA MOHANTY
# CARNEGIE MELLON UNIVERSITY
# 5 MARCH 2017

name "starter"
description "An example Chef role"
run_list "recipe[starter]"
override_attributes({
  "starter_name" => "Avinita Mohanty",
})
