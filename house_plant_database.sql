-- Create Database
-- CREATE DATABASE HousePlantsDB;
-- USE HousePlantsDB;

-- Create Plants Table
-- CREATE TABLE Plants (
--     plant_id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(50) NOT NULL,
--     species VARCHAR(50),
--     difficulty_level ENUM('Beginner', 'Experienced', 'Expert') NOT NULL,
--     watering_frequency VARCHAR(50),
--     sunlight VARCHAR(50)
-- );

-- -- Create CareInstructions Table
-- CREATE TABLE CareInstructions (
--     care_id INT AUTO_INCREMENT PRIMARY KEY,
--     plant_id INT,
--     soil_type VARCHAR(50),
--     fertilizer VARCHAR(50),
--     temperature VARCHAR(50),
--     humidity VARCHAR(50),
--     FOREIGN KEY (plant_id) REFERENCES Plants(plant_id)
-- );

-- -- Create UserPreferences Table
-- CREATE TABLE UserPreferences (
--     user_id INT AUTO_INCREMENT PRIMARY KEY,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     email VARCHAR(100) UNIQUE NOT NULL,
--     preferred_difficulty ENUM('Beginner', 'Experienced', 'Expert') NOT NULL
-- );

-- -- Insert Data into Plants Table
-- INSERT INTO Plants (name, species, difficulty_level, watering_frequency, sunlight) VALUES
-- ('Spider Plant', 'Chlorophytum comosum', 'Beginner', 'Weekly', 'Indirect sunlight'),
-- ('Snake Plant', 'Sansevieria trifasciata', 'Beginner', 'Bi-weekly', 'Low to bright indirect light'),
-- ('Peace Lily', 'Spathiphyllum', 'Beginner', 'Weekly', 'Low to bright indirect light'),
-- ('Fiddle Leaf Fig', 'Ficus lyrata', 'Experienced', 'Weekly', 'Bright indirect light'),
-- ('Monstera', 'Monstera deliciosa', 'Experienced', 'Weekly', 'Bright indirect light'),
-- ('Bonsai', 'Various species', 'Expert', 'Depends on species', 'Direct sunlight'),
-- ('Orchid', 'Orchidaceae', 'Expert', 'Weekly', 'Bright indirect light'),
-- ('Cactus', 'Cactaceae', 'Beginner', 'Monthly', 'Direct sunlight');

-- -- Insert Data into CareInstructions Table
-- INSERT INTO CareInstructions (plant_id, soil_type, fertilizer, temperature, humidity) VALUES
-- (1, 'Well-draining potting mix', 'Balanced liquid fertilizer monthly', '18-23°C', 'Moderate'),
-- (2, 'Cactus potting mix', 'Balanced liquid fertilizer bi-monthly', '15-29°C', 'Low'),
-- (3, 'Peat-based potting mix', 'Balanced liquid fertilizer monthly', '18-26°C', 'High'),
-- (4, 'Well-draining potting mix', 'Balanced liquid fertilizer monthly', '15-23°C', 'High'),
-- (5, 'Well-draining potting mix', 'Balanced liquid fertilizer monthly', '18-26°C', 'Moderate to high'),
-- (6, 'Bonsai soil mix', 'Specialized bonsai fertilizer', 'Varies', 'Varies'),
-- (7, 'Orchid bark mix', 'Orchid-specific fertilizer', '15-26°C', 'High'),
-- (8, 'Cactus potting mix', 'Cactus fertilizer bi-monthly', '21-35°C', 'Low');

-- -- Insert Data into UserPreferences Table
-- INSERT INTO UserPreferences (first_name, last_name, email, preferred_difficulty) VALUES
-- ('Alice', 'Rose', 'alice.rose@example.com', 'Beginner'),
-- ('Bob', 'Smith', 'bob.smith@example.com', 'Experienced'),
-- ('Tolu', 'Oshodi', 'tolu.oshodi@example.com', 'Expert'),
-- ('Diane', 'Ash', 'diane.ash@example.com', 'Beginner'),
-- ('Eve', 'Louis', 'eve.louis@example.com', 'Experienced'),
-- ('John', 'Brown', 'john.brown@example.com', 'Expert'),
-- ('Ebuka', 'Johnson', 'Ebuka.johnson@example.com', 'Beginner'),
-- ('Frank', 'Miller', 'frank.miller@example.com', 'Experienced');

-- Sample Queries
-- 1. Retrieve all beginner-friendly plants
-- SELECT * FROM Plants WHERE difficulty_level = 'Beginner' ORDER BY name;

-- 2. Retrieve all care instructions for a specific plant (e.g., Spider Plant)
-- SELECT p.name, c.soil_type, c.fertilizer, c.temperature, c.humidity
-- FROM Plants p
-- JOIN CareInstructions c ON p.plant_id = c.plant_id
-- WHERE p.name = 'Spider Plant';

-- -- 3. Retrieve all user preferences
-- SELECT * FROM UserPreferences ORDER BY last_name;

-- -- 4. Retrieve all plants that require bright indirect light
-- SELECT * FROM Plants WHERE sunlight = 'Bright indirect light' ORDER BY name;

-- -- 5. Retrieve plants and their care instructions for beginner-friendly plants
-- SELECT p.name, p.species, c.soil_type, c.fertilizer, c.temperature, c.humidity
-- FROM Plants p
-- JOIN CareInstructions c ON p.plant_id = c.plant_id
-- WHERE p.difficulty_level = 'Beginner'
-- ORDER BY p.name;

-- Retrieve plant_id for 'Snake Plant'
-- SELECT plant_id INTO @plant_id FROM Plants WHERE name = 'Snake Plant';

-- -- Update watering frequency using the retrieved plant_id
-- UPDATE Plants SET watering_frequency = 'Monthly' WHERE plant_id = @plant_id;

-- 7. Delete a user preference by user_id
-- DELETE FROM UserPreferences WHERE user_id = 1;

-- Aggregate Functions
-- 1. Calculate the number of plants by difficulty level
-- SELECT difficulty_level, COUNT(*) AS count FROM Plants GROUP BY difficulty_level ORDER BY count DESC;

-- 2. Calculate the average number of plants preferred by users
-- SELECT AVG(preferred_count) AS avg_preferred_count FROM (
--     SELECT COUNT(*) AS preferred_count
--     FROM UserPreferences
--     GROUP BY preferred_difficulty
-- ) AS subquery;

-- Additional In-built Functions
-- 1. Retrieve the length of the longest plant name
-- SELECT MAX(LENGTH(name)) AS max_name_length FROM Plants;

-- -- 2. Retrieve the first user by alphabetical order of last name
-- SELECT * FROM UserPreferences ORDER BY last_name ASC LIMIT 1;

-- -- Stored Procedure
-- DELIMITER //

-- CREATE PROCEDURE GetPlantsByDifficulty(IN diff_level ENUM('Beginner', 'Experienced', 'Expert'))
-- BEGIN
--     SELECT p.name, p.species, p.watering_frequency, p.sunlight, c.soil_type, c.fertilizer, c.temperature, c.humidity
--     FROM Plants p
--     JOIN CareInstructions c ON p.plant_id = c.plant_id
--     WHERE p.difficulty_level = diff_level
--     ORDER BY p.name;
-- END //

-- DELIMITER ;

-- -- Call the stored procedure
-- CALL GetPlantsByDifficulty('Beginner');