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


INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');
