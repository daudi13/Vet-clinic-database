/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  date_of_birth DATE, 
  escape_attempts INT, 
  neutered BOOLEAN,
  weight_kg REAL
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