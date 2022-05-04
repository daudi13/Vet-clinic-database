/*Queries that provide answers to the questions from all projects.*/

/* Find all animals whose name end in "mon" */
SELECT * FROM animals WHERE name LIKE '%mon';

/* List the nam of all animals born between 2016 and 2019 */

SELECT * FROM animals WHERE date_of_birth BETWEEN 'January 1, 2016' AND 'December 31, 2019';

/* List the name of all animals that are neutered and have less that 3 escape attemps*/

SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;

/*List date of birth of all animals named either "Agumon" or "Pikachu".*/

SELECT date_of_birth FROM animals WHERE NAME IN ('Agumon', 'Gabumon');

/*List name and escape attempts of animals that weigh more than  10.5kg*/

SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;

/*Find all animals that are neutered*/

SELECT * FROM animals WHERE neutered = TRUE;

/* Find all animals not named Gabumon*/

SELECT * FROM animals WHERE name != 'Gabumon';

/* Find all animals with a weight between 10.4kg and 17.3 kg */

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

/*update animals table  by setting the species to unspecified*/

BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;

/*Update the animals table by setting the species column to pokemon for all animals that don't have species already set.*/

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

/*delete all records in the animals table, then roll back the transaction*/

BEGIN;
DELETE from animals;
ROLLBACK;
SELECT * FROM animals;

/*Delete animals born after Jan 1st, 2022*/

DELETE FROM animals 
WHERE date_of_birth > 'January 1, 2022';

/*How many animals are there*/

SELECT COUNT(*) FROM animals;

/*How many animals have never tried to escape?*/

SELECT COUNT(*) FROM animals WHERE escape_attempts = 0

/*What is the average weight of animals?*/

SELECT AVG(weight_kg) FROM animals;

/*Who escapes the most, neutered or not neutered animals*/

SELECT neutered, COUNT(escape_attempts) FROM animals GROUP BY neutered ORDER BY COUNT DESC LIMIT 1;

/*what is the minimum and maximum weight of each type of animals*/

SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

/*What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/

SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN 'January 1, 1990' AND 'December 31, 2000' GROUP BY species;