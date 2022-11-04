PRAGMA foreign_KEYs=ON;
BEGIN TRANSACTION;

CREATE TABLE games (
    gamesid INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(25) NOT NULL,
    answerid INTEGER,
    gameid INTEGER,
    -- FOREIGN KEY(username) REFERENCES user(username),
    -- From my research I found that FOREIGN KEYS cannot be across databases,
    -- so maybe we have to manually select games using the username from the user database.
    -- We can also try server triggers but I'm still looking into that.
    FOREIGN KEY (answerid) REFERENCES answer(answerid),
    FOREIGN KEY(gameid) REFERENCES game(gameid)
);

CREATE TABLE game(
    gameid INTEGER PRIMARY KEY AUTOINCREMENT,
    guesses INTEGER,
    gstate VARCHAR(12)
);

CREATE TABLE guess(
    guessid INTEGER PRIMARY KEY AUTOINCREMENT,
    gameid INTEGER,
    guessedword VARCHAR(5),
    accuracy VARCHAR(5),
    FOREIGN KEY(gameid) REFERENCES game(gameid)
);

CREATE TABLE answer(
    answerid INTEGER PRIMARY KEY AUTOINCREMENT,
    answord VARCHAR(5)
);

CREATE TABLE valid_word(
    valid_id INTEGER PRIMARY KEY AUTOINCREMENT,
    valword VARCHAR(5)
);
COMMIT;
