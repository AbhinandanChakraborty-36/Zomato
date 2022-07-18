# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@user=User.create(username:"Admin",email:"admin@gmail.com",password:"Admin",password_confirmation:"Admin", isadmin: true)
@user.update(isadmin: true, password:"Admin",password_confirmation:"Admin")
Restaurant.create(name:"Restaurant1",category:"Fast-Food",resturant_type:"Dine In", latitude:22.5596,longitude:88.35046)
Restaurant.create(name:"Restaurant2",category:"Chinese",resturant_type:"Dine In",latitude:22.5014,longitude:88.3616)
Restaurant.create(name:"Restaurant3",category:"Luxary",resturant_type:"Dine In",latitude:22.5481,longitude:88.3992)
Restaurant.create(name:"Restaurant4",category:"North-Indian",resturant_type:"Dine In",latitude:22.7013711863,longitude:88.3747081393)
Restaurant.create(name:"Restaurant5",category:"Continental",resturant_type:"Dine In",latitude:22.51704,longitude:88.36709)
Restaurant.create(name:"Restaurant6",category:"South-Indian",resturant_type:"Dine In",latitude:22.7008,longitude:88.37783)

@rest1= Restaurant.find_by(name:"Restaurant1")
@rest2= Restaurant.find_by(name:"Restaurant2")
@rest3= Restaurant.find_by(name:"Restaurant3")
@rest4= Restaurant.find_by(name:"Restaurant4")
@rest5= Restaurant.find_by(name:"Restaurant5")
@rest6= Restaurant.find_by(name:"Restaurant6")

@rest1.menus.create(name:"Menu 1", cost:"120")
@rest1.menus.create(name:"Menu 2", cost:"240")
@rest1.menus.create(name:"Menu 3", cost:"120")
@rest1.menus.create(name:"Menu 4", cost:"10")
@rest1.menus.create(name:"Menu 5", cost:"12")

@rest2.menus.create(name:"Menu 1", cost:"120")
@rest2.menus.create(name:"Menu 2", cost:"240")
@rest2.menus.create(name:"Menu 3", cost:"120")
@rest2.menus.create(name:"Menu 4", cost:"10")
@rest2.menus.create(name:"Menu 5", cost:"12")

@rest3.menus.create(name:"Menu 1", cost:"120")
@rest3.menus.create(name:"Menu 2", cost:"240")
@rest3.menus.create(name:"Menu 3", cost:"120")
@rest3.menus.create(name:"Menu 4", cost:"10")
@rest3.menus.create(name:"Menu 5", cost:"12")

@rest4.menus.create(name:"Menu 1", cost:"120")
@rest4.menus.create(name:"Menu 2", cost:"240")
@rest4.menus.create(name:"Menu 3", cost:"120")
@rest4.menus.create(name:"Menu 4", cost:"10")
@rest4.menus.create(name:"Menu 5", cost:"12")

@rest5.menus.create(name:"Menu 1", cost:"120")
@rest5.menus.create(name:"Menu 2", cost:"240")
@rest5.menus.create(name:"Menu 3", cost:"120")
@rest5.menus.create(name:"Menu 4", cost:"10")
@rest5.menus.create(name:"Menu 5", cost:"12")

@rest6.menus.create(name:"Menu 1", cost:"120")
@rest6.menus.create(name:"Menu 2", cost:"240")
@rest6.menus.create(name:"Menu 3", cost:"120")
@rest6.menus.create(name:"Menu 4", cost:"10")
@rest6.menus.create(name:"Menu 5", cost:"12")
