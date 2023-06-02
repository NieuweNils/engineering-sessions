# Setup:

1. Start the database: `make up`
2. Run `/src/main/java/com/eneco/teaching/jpa/Application` to start up the API. 

# Exploration of the app:
1. Open a new terminal window and check out the database: `make psql`
2. Then curl the application with a command in `curl_commands.sh`
3. See the data persist in the database

# Clean up after your done:
1. Stop the API
2. Delete the db:  `make clean`