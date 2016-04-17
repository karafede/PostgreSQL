
library(RPostgreSQL)

# create a connection
# save the password that we can "hide" it as best as we can by collapsing it
pw <- {
  "Password07"
}

# loads the PostgreSQL driver
drv <- dbDriver("PostgreSQL")
# creates a connection to the postgres database
# note that "con" will be used later in each connection to the database

con <- dbConnect(drv, dbname = "stuarts_sandbox",
                 host = "172.31.113.9", port = 5432,       
                 user = "federicok", password = pw)
# rm(pw) # removes the password
dbListTables(con)


# check for the public
dbExistsTable(con, "hysplit_data")
# TRUE

rs <- dbSendQuery(con, "SELECT * FROM hysplit_data limit 100")  
AAA <- fetch(rs,n=-1)
str(AAA)
AAA


dbDisconnect(con)
