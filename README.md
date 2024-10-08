## House Plant Selector (House plant Database) SQL

### Scenario:

I want to help houseplant enthusiasts find suitable plants based on their skill level and provide detailed care instructions. 

To do this, I will store plants (plant_id, name, species, difficulty_level, watering_frequency, sunlight), care instructions (care_id, plant_id, soil_type, fertilizer, temperature, humidity), and user preferences (user_id, first_name, last_name, email, preferred_difficulty) in separate tables.

I will write queries to add or delete plants and care instructions. For example, when a new plant is introduced, its details will be added to the Plants table, and corresponding care instructions will be added to the CareInstructions table. User preferences will be recorded in the UserPreferences table when a new user signs up.

I will use aggregate functions to show statistics, such as the number of plants by difficulty level and the average number of plants preferred by users. I will connect tables with ID as the primary key and link plants to care instructions and user preferences effectively.

I will use at least 3 different data types while creating tables, including INT, VARCHAR, and ENUM. I will use at least 2 constraints while creating tables, such as NOT NULL and UNIQUE. I will enforce NOT NULL where appropriate and use the date in-built functions to record user sign-up times.

Additionally, I will create a stored procedure to generate plant recommendations based on a user's preferred difficulty level. This will be explained, and I will add a scenario where I run all commands for someone searching for beginner-friendly plants and how that impacts the database. I will also simulate updating plant care instructions and undoing an incorrect update.

This database will help houseplant enthusiasts find suitable plants based on their skill level and provide detailed care instructions for each plant.

### Possible real-life uses

The House Plants database is used to manage information about various house plants, their care requirements, and user preferences. Here’s a scenario demonstrating its use:

#### Adding a New Plant:

When a new plant is introduced to the database, its details are added to the Plants table.

INSERT INTO Plants (name, species, difficulty_level, watering_frequency, sunlight) VALUES ('ZZ Plant', 'Zamioculcas zamiifolia', 'Beginner', 'Monthly', 'Low to bright indirect light');

#### Adding Care Instructions:

Corresponding care instructions for the new plant are added to the CareInstructions table.

INSERT INTO CareInstructions (plant_id, soil_type, fertilizer, temperature, humidity) VALUES (9, 'Well-draining potting mix', 'Balanced liquid fertilizer monthly', '15-23°C', 'Moderate');

#### Adding User Preferences:

INSERT INTO UserPreferences (first_name, last_name, email, preferred_difficulty) VALUES ('Ivy', 'White', 'ivy.white@example.com', 'Experienced');

#### Generating Recommendations:

Based on a user's preferred difficulty level, the stored procedure can be used to generate plant recommendations.

CALL GetPlantsByDifficulty('Experienced');
