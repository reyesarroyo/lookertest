# Define the database connection to be used for this model.
#Comment to save
connection: "thelook"
include: "/pdts/**/*.view"
# include all the views

include: "/views/**/*.view.lkml"
include: "/Dashboards/*.dashboard.lookml"
#include: "/explores/**/*.explore"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: testMTY_default_datagroup {
  #sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "5 minutes"
  interval_trigger: "5 minutes"
  description: "Trigger every 5 minutes to persist data for 5 minutes at a time"
}


datagroup: test_datagroup_vega{
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "5 minutes"
  interval_trigger: "5 minutes"
  description: "Trigger every 5 minutes to persist data for 5 minutes at a time"
}

datagroup: test_datagroup_jose{
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "5 minutes"
  interval_trigger: "5 minutes"
  description: "Trigger every 5 minutes to persist data for 5 minutes at a time"
}




persist_with: testMTY_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "TestMTY"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.


explore: countries {}

explore: customer {}

explore: dept {}

explore: dummy {}

explore: employees {}

explore: events {
  from: events
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  join:orders {
    type: left_outer
    sql_on: ${events.user_id} = ${orders.user_id} ;;
    relationship: many_to_one
  }
}
explore: flights {}

explore: foo {}

explore: human {}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: orders {

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  join: contorderperuser {
    sql_on: ${orders.user_id} = ${contorderperuser.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: order_items_vijaya {
  join: orders {
    type: left_outer
    sql_on: ${order_items_vijaya.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items_vijaya.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_status_vijaya {}

explore: pegdates {}

explore: person {}

explore: persons {}

explore: products {}

explore: salary {}

explore: test {}

explore: users {

}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}
