# To set up your database
# Hit space key + ctrl key
# on each line 

#
#	Creating Schema
#
CREATE SCHEMA SlayTheSpire;

use SlayTheSpire;

CREATE TABLE run (
	play_id INT AUTO_INCREMENT PRIMARY KEY,
    floor_reached INT NOT NULL DEFAULT 0,
    playtime INT NOT NULL DEFAULT 0,
    score INT CHECK (score >= -1 AND score <= 6000),
    play_id VARCHAR(100) NOT NULL,
    local_time VARCHAR(32),
    is_ascension_mode enum {"true", "false"}
);