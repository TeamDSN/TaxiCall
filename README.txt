# TaxiCall
Development depositories for out cross-platformed taxi app

This is the basic structure of this app:


-- For implementation ------------------------------------------------------------------------------------

main.lua - responsible to handle app's initial state, first page to display and UI setup.
view1.lua - default creation, can be a template, can be modified to be a new view
list.lua - currently Son is working on to create a graphical list view of all items listed in data.xml

data.xml - contain taxi brand data

--- Library provided by Corona ----------------------------------------------------------------------------

xml.lua - for xml parsing operations
tableView.lua - for table operations
