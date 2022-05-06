/* Populate database with sample data. */

INSERT INTO
  animals(
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, weight_kg
    )
VALUES('Agumon', 'February 3, 2020', 0, TRUE, 10.23);

INSERT INTO
  animals(
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, weight_kg
    ) 
VALUES('Gabumon', 'November 15, 2018', 2, TRUE, 8);


INSERT INTO
  animals(
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, weight_kg
    )
VALUES('Pikachu', 'January 7, 2021', 1, FALSE, 15.04);

INSERT INTO 
  animals(
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, weight_kg
    )
VALUES('Devimon', 'May 12, 2017', 5, TRUE, 11);


/*insert data for Charmander*/

INSERT INTO
  animals(
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, weight_kg
    ) VALUES('Charmander', 'February 8, 2020', 0, FALSE, -11);

/*Insert data  Plantmon*/

INSERT INTO
  animals(
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, weight_kg
    ) VALUES('Plantmon', 'November 15, 2021', 2, TRUE, -5.7);

/*Insert data for Squirtle*/

INSERT INTO
  animals(
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, weight_kg
    ) VALUES('Squirtle', 'April 2, 1993', 3, FALSE, -12.13);

/*Insert data for Angemon*/

INSERT INTO
  animals(
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, weight_kg
    ) VALUES('Angemon', 'June 12, 2005', 1, TRUE, -45);


/*Insert data for Boarmon*/

INSERT INTO
  animals(
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, weight_kg
    ) VALUES('Boarmon', 'June 7, 2005', 7, TRUE, 20.4);

/*Insert data for Blossom*/

INSERT INTO
  animals(
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, weight_kg
    ) VALUES('Blossom', 'October 13, 1998', 3, TRUE, 17);

/*Inserr data for Ditto*/

INSERT INTO
  animals(
    name, 
    date_of_birth, 
    escape_attempts, 
    neutered, weight_kg
    ) VALUES('Ditto', 'May 14, 2022', 4, TRUE, 22);

-- insert data for sam smith;

INSERT INTO 
owners(
  full_name,
  age
  ) VALUES('Sam Smith', 34);

--insert data for the rest of the owners

INSERT INTO 
  owners
    (full_name, age) 
    VALUES
    ('Jennifer Ornwell', 19), 
    ('Bob', 45), 
    ('Melody pond', 77), 
    ('Dean Winchester', 14), 
    ('Jodie Whittaker', 38);

-- insert data in the species table

INSERT INTO 
  species
    (name) 
    VALUES
    ('Pokemon'), 
    ('Digimon');

-- Modify your Inserted data into the species table
-- If the name ends in "mon" it will be Digimon

UPDATE
  animals SET species_id = 2  
  WHERE name LIKE '%mon';

-- All other animals are Pokemon

UPDATE 
  animals SET species_id = 1  
  WHERE name NOT LIKE '%mon';

-- Modify your inserted animals to include owner information (owner_id);

UPDATE 
  animals 
  SET owner_id = 1 
  WHERE name = 'Agumon';

-- Jennifer Orwell owns Gabumon and Pikachu.

UPDATE 
  animals 
  SET owner_id = 2 
  WHERE name IN('Gabumon', 'Pikachu');

-- Bob owns Devimon and Plantmon

UPDATE 
  animals 
  SET owner_id = 3 
  WHERE name IN('Devimon', 'Plantmon');

-- Melody Pond owns Charmander, Squirtle, and Blossom

UPDATE 
  animals 
  SET owner_id = 4 
  WHERE name IN('Charmander', 'Squirtle', 'Blossom');

-- Dean Winchester owna Angermon and Boarmon

UPDATE 
  animals 
  SET owner_id = 5 
  WHERE name IN('Angemon', 'Boarmon');


--insert data for vets 

INSERT INTO vets(
  name, 
  age, 
  date_of_graduation
  )
  VALUES
  ('William Tatcher', 45, 'April 23, 2000'), 
  ('Maisy Smith', 26, 'January 17, 2019'), 
  ('Stephanie Mendez', 64, 'May 4, 1981'), 
  ('Jack Harkness', 38, 'June 8, 2008');