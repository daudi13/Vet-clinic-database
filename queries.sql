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

/*Create SAVEPOINT*/

SAVEPOINT SP1;

/*Update all animals' weight to be their weight multiplied by -1.
Rollback to the savepoint, Update all animals' weights that are negative to be their weight multiplied by -1. commit */

UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

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

-- what animals belong to Melody Pond

SELECT
  name FROM owners 
  JOIN animals 
  ON owners.id = animals.owner_id 
  WHERE full_name = 'Melody pond';

-- List of all animals that are pokemon (their type is Pokemon)

SELECT
  animals.name 
  FROM species 
  JOIN animals 
  ON species.id = animals.species_id 
  WHERE species.name = 'Pokemon';

-- List of all owners and their animaks, remember to include those that don't own animals

SELECT 
owners.full_name, animals.name 
FROM owners 
LEFT JOIN animals ON owners.id = animals.owner_id;

-- How many animals are there per species?

SELECT 
species.name, COUNT(animals.name)
FROM species 
JOIN animals 
ON species.id = animals.species_id 
GROUP BY species.name;

-- List all Digimon owned by Jenniffer Orwell

SELECT
  animals.name 
  FROM species 
  JOIN animals 
  ON species.id = animals.species_id JOIN owners ON owners.id = animals.owner_id   
  WHERE species.name = 'Digimon' AND owners.full_name = 'Jennifer Ornwell';

-- List all animals owned by Dean Winchester that haven't tried to escape

SELECT 
  animals.name 
  FROM owners 
  JOIN animals 
  ON owners.id = animals.owner_id 
  WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- Who owns the most animals

SELECT
  owners.full_name, 
  COUNT(animals.name) 
  FROM owners 
  JOIN animals 
  ON owners.id = animals.owner_id 
  GROUP BY owners.full_name 
  ORDER BY COUNT DESC LIMIT 1;

-- who was the last animal seen by William Tatcher?

SELECT 
animals.name 
FROM animals 
JOIN visits 
ON animals.id = visits.animal_id 
JOIN vets 
ON vets.id = visits.vet_id 
WHERE vets.name = 'William Tatcher' 
ORDER BY visits.date_of_vist DESC LIMIT 1;

-- How many different animals did stephanie Mendez see

SELECT
COUNT(animals.name) 
FROM animals 
JOIN visits 
ON animals.id = visits.animal_id 
JOIN vets 
ON vets.id = visits.vet_id 
WHERE vets.name = 'Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.

SELECT 
vets.name, species.name 
FROM vets 
LEFT JOIN specialization 
ON vets.id = specialization.vets_id 
LEFT JOIN species 
ON species.id = specialization.species_id 
ORDER BY vets.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.

SELECT animals.name 
FROM animals 
JOIN visits 
ON animals.id = visits.animal_id 
JOIN vets 
ON vets.id = visits.vet_id 
WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_vist >= '2020-04-1' AND visits.date_of_vist <= '2020-08-30';


--What animal has the most visits to vets?

SELECT 
animals.name, 
COUNT(visits.animal_id) 
FROM animals 
JOIN visits 
ON animals.id = visits.animal_id 
GROUP BY animals.name 
ORDER BY COUNT DESC LIMIT 1;


--Who was Maisy Smith's first visit?

SELECT 
animals.name 
FROM animals 
JOIN visits 
ON animals.id = visits.animal_id 
JOIN vets 
ON vets.id = visits.vet_id 
WHERE vets.name = 'Maisy Smith' 
ORDER BY visits.date_of_vist 
DESC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.

SELECT 
animals.*, visits.date_of_vist, vets.* 
FROM animals 
JOIN visits 
ON animals.id = visits.animal_id 
JOIN vets 
ON vets.id = visits.vet_id 
ORDER BY visits.date_of_vist 
DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?

SELECT 
vets.name, COUNT(vets.name) AS num_of_visits 
FROM vets 
LEFT JOIN specialization 
ON vets.id = specialization.vets_id 
JOIN visits 
ON vets.id = visits.vet_id 
WHERE specialization.species_id IS NULL 
GROUP BY vets.name ORDER BY COUNT(vets.name) DESC;

--What specialty should Maisy Smith consider getting? Look for the species she gets the most.

SELECT 
species.name AS expected_specialty 
FROM animals JOIN visits ON animals.id = visits.animal_id 
JOIN vets ON vets.id = visits.vet_id JOIN species ON species.id = animals.species_id 
WHERE vets.name = 'Maisy Smith' GROUP BY species.name 
ORDER BY COUNT(DISTINCT animals.name) DESC LIMIT 1;
