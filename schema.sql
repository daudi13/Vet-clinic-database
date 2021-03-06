/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  date_of_birth DATE, 
  escape_attempts INT, 
  neutered BOOLEAN,
  weight_kg REAL,
  PRIMARY KEY(id)
  );

/*Add a column species of type string to the animal table*/

ALTER TABLE animals
ADD COLUMN species VARCHAR(100);

-- Create a table named owners with the following columns

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(255),
  age INT,
  PRIMARY KEY(id)
  );

  -- Create a table named species with the following columns

  CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    PRIMARY KEY(id)
    );

  --Remove column species;

  ALTER TABLE animals 
  DROP COLUMN species;

  --Add columm species_id which is a foreign key referencing species table;

  ALTER TABLE animals 
  ADD COLUMN species_id INT, 
  ADD FOREIGN KEY (species_id)
  REFERENCES species(id)
  ON DELETE CASCADE;

  -- Add colum owner_id which is a foreign key refencing owner table;

  ALTER TABLE animals 
  ADD COLUMN owner_id INT, 
  ADD FOREIGN KEY (owner_id) 
  REFERENCES owners (id) 
  ON DELETE CASCADE;

-- Create table named vets 

CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY, 
  name VARCHAR(255), 
  age INT, 
  date_of_graduation DATE,
  PRIMARY KEY(id)
  );

-- create specialization table joining table

CREATE TABLE specialization(
  vets_id INT, 
  species_id INT);

-- Add vets_id foreign key refrencing vets table

ALTER TABLE specialization
ADD FOREIGN KEY (vets_id) 
REFERENCES vets (id) 
ON DELETE CASCADE;

-- Add species_id foreign key refrencing species table

ALTER TABLE specialization 
ADD FOREIGN KEY (species_id) 
REFERENCES species (id) 
ON DELETE CASCADE;

--create a visit table joining vets and animals

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT, 
  vet_id INT, 
  date_of_vist DATE
  );

-- Add animal_id foreign refering animals table

ALTER TABLE visits 
ADD FOREIGN KEY (animal_id) 
REFERENCES animals (id) 
ON DELETE CASCADE;

--Add vet_id foreign key referencing vet table

ALTER TABLE visits 
ADD FOREIGN KEY (vet_id) 
REFERENCES vets (id) 
ON DELETE CASCADE;