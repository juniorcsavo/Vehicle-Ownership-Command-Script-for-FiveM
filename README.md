Description:
This script streamlines the process of assigning ownership to a vehicle via a custom command. Players can utilize the command to declare ownership of a vehicle, prompting the script to update the server's database. The script is designed to work seamlessly with the ESX framework and leverages the oxmysql library for efficient database interactions.

Features:
Command Usage:

Players can use the /givevehicle command to specify ownership of a vehicle.
The command format is /givevehicle [playerId] [model].
Database Interaction:

Utilizes ESX functions to identify the target player and generate a random vehicle plate.
Defines default customization data for the spawned vehicle, including elements such as the hood modification, horns, and primary color.
Serializes the customization data into JSON format for storage in the owned_vehicles table.
Ownership Marking:

Marks the vehicle as owned in the server's database, associating it with the specified player.
The vehicle type is set to 'car,' and relevant details such as the plate, owner identifier, and customization data are stored.
Spawned Vehicle:

The script triggers the creation of the marked vehicle for the designated player, incorporating the specified customization attributes and plate.
Dependencies:
ESX Framework:

Ensure the ESX framework is properly configured on your server.
Adjust the script to align with your ESX setup.
oxmysql Library:

Requires the oxmysql library for database interactions.
Ensure the library is correctly installed and configured in your server resources.
Usage:
Players execute the /givevehicle [playerId] [model] command to assert ownership of a vehicle.
The script processes the command, generating a unique vehicle plate and storing ownership details in the database.
The designated vehicle is spawned for the targeted player, featuring the specified customization attributes.
Note:
Customize the default vehicle model, color, and additional customization parameters according to server preferences.
Adapt the script to align with specific server setups, database schemas, and any additional customization requirements.
