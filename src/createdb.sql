CREATE TABLE Restaurant
(
	Name VARCHAR(256) NOT NULL PRIMARY KEY,
	Location VARCHAR(256) NOT NULL,
	Is_food_truck BOOLEAN NOT NULL
);

--Monday counts as day_of_the_week 1--
CREATE TABLE IsOpen
(
	Restaurant_name VARCHAR(256) NOT NULL REFERENCES Restaurant(Name),
	Day_of_the_week INTEGER NOT NULL,
	Open_Time FLOAT NOT NULL,
	Close_Time FLOAT NOT NULL,
	CHECK(Open_Time >= 0 AND Open_Time <= 24),
	CHECK(Close_Time >= 0 AND Close_Time <= 27),
	CHECK(Day_of_the_week >= 1 AND Day_of_the_week <= 7),
	PRIMARY KEY(Restaurant_name, Day_of_the_week)
);


CREATE TABLE Merchant
(
	Restaurant_name VARCHAR(256) NOT NULL PRIMARY KEY REFERENCES Restaurant(Name),
	Phonenumber INTEGER NOT NULL,
	CHECK(Phonenumber >= 0000000000 AND Phonenumber <= 9999999999)
);

CREATE TABLE Food
(
	Name VARCHAR(256) NOT NULL,
	Calories INTEGER NOT NULL,
  PRIMARY KEY (Name)
);

CREATE TABLE Serves
(
	Restaurant_name VARCHAR(256) NOT NULL REFERENCES Restaurant(Name),
	Food_name VARCHAR(256) NOT NULL,
	Price FLOAT NOT NULL,
  CHECK(Price >= 0.0),
  PRIMARY KEY(Restaurant_name, Food_name)
);

CREATE TABLE Student
(
	Netid VARCHAR(256) NOT NULL PRIMARY KEY,
	Name VARCHAR(256) NOT NULL,
	FoodPoint_Plan VARCHAR(1),
	CHECK((FoodPoint_Plan IS NULL) or (FoodPoint_Plan >= 'a' AND FoodPoint_Plan <= 'i'))
);

CREATE TABLE EatsAt
(
	Student_netid VARCHAR(256) NOT NULL REFERENCES Student(Netid),
	Restaurant_name VARCHAR(256) NOT NULL REFERENCES Restaurant(Name),
  PRIMARY KEY (Student_netid, Restaurant_name)
);

CREATE TABLE Eats
(
	Student_netid VARCHAR(256) NOT NULL REFERENCES Student(Netid),
	Food_name VARCHAR(256) NOT NULL REFERENCES Food(Name),
  PRIMARY KEY (Student_netid, Food_name)
);

CREATE TABLE Allergens
(
	Type VARCHAR(256) NOT NULL PRIMARY KEY,
	Medication VARCHAR(256) NOT NULL
);

CREATE TABLE HasAllergen
(
	Allergen_Type VARCHAR(256) NOT NULL REFERENCES Allergens(Type),
	Food_name VARCHAR(256) NOT NULL REFERENCES Food(name),
  PRIMARY KEY (Allergen_Type, Food_name)
);

CREATE TABLE IsAllergicTo
(
	Allergen_Type VARCHAR(256) NOT NULL REFERENCES Allergens(Type),
	Student_netid VARCHAR(256) NOT NULL REFERENCES Student(netid),
  PRIMARY KEY (Allergen_Type, Student_netid)
);