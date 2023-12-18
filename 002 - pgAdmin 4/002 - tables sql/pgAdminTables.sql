CREATE TABLE Users (
    UserID SERIAL PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    created_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_date TIMESTAMPTZ
);

CREATE TABLE Director (
    DirectorID SERIAL PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    created_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_date TIMESTAMPTZ
);

CREATE TABLE Actor (
    ActorID SERIAL PRIMARY KEY,
    firstname VARCHAR(50) NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    created_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_date TIMESTAMPTZ
);

CREATE TABLE Movie (
    MovieID SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    duration INT,
    release_year INT,
    FK_DirectorID INT,
    created_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_date TIMESTAMPTZ,
    CONSTRAINT FK_Movie_Director FOREIGN KEY (FK_DirectorID) REFERENCES Director (DirectorID)
);

CREATE TABLE Favorite (
    FK_UserID INT,
    FK_MovieID INT,
    created_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_date TIMESTAMPTZ,
    -- CONSTRAINT DF_Favorite_created_date DEFAULT CURRENT_TIMESTAMP FOR created_date,
    CONSTRAINT FK_Favorite_User FOREIGN KEY (FK_UserID) REFERENCES Users (UserID),
    CONSTRAINT FK_Favorite_Movie FOREIGN KEY (FK_MovieID) REFERENCES Movie (MovieID)
);

CREATE TABLE Movie_Actor (
    Movie_ActorID SERIAL PRIMARY KEY,
    FK_MovieID INT NOT NULL,
    FK_ActorID INT NOT NULL,
    role VARCHAR(50),
    is_lead_role BOOLEAN,
    created_date TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_date TIMESTAMPTZ,
    -- CONSTRAINT DF_Movie_Actor_created_date DEFAULT CURRENT_TIMESTAMP FOR created_date,
    CONSTRAINT FK_ActorID FOREIGN KEY (FK_ActorID) REFERENCES Actor (ActorID),
    CONSTRAINT FK_MovieID FOREIGN KEY (FK_MovieID) REFERENCES Movie (MovieID)
);