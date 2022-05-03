/*Queries that provide answers to the questions from all projects.*/

/* Find all animals whose name end in "mon" */
SELECT * FROM animals WHERE name LIKE '%mon';

/* List the nam of all animals born between 2016 and 2019 */

SELECT * FROM animals WHERE date_of_birth BETWEEN 'January 1, 2016' AND 'December 31, 2019';

/* List the name of all animals that are neutered and have less that 3 escape attemps*/

SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;