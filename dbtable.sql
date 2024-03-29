# To set up your database
# Hit space key + ctrl key
# on each line 

#
#	Creating Schema
#
CREATE SCHEMA SlayTheSpire;

use SlayTheSpire;

#
# run table
#
CREATE TABLE run (
	id INT AUTO_INCREMENT PRIMARY KEY,
    floor_reached INT NOT NULL DEFAULT 0,
    playtime INT NOT NULL DEFAULT 0,
    score INT CHECK (score >= -1 AND score <= 6000),
    play_id VARCHAR(100) NOT NULL,
    local_time VARCHAR(32),
    is_ascension_mode bool DEFAULT false,
    neow_cost enum('NONE') NOT NULL DEFAULT 'NONE',
    seed_source_timestamp varchar(50) NOT NULL DEFAULT '-1',
    circlet_count varchar(50) NOT NULL DEFAULT '0',
    special_seed varchar(50) NOT NULL DEFAULT '0',
    potions_floor_usage JSON,
    damage_taken_total INT NOT NULL DEFAULT 0,
    seed_played VARCHAR(50) NOT NULL,
    is_trial bool DEFAULT false,
    path_per_floor JSON,
    character_chosen ENUM('IRONCLAD','SILENT','DEFACT','WATCHER','MODE'),
    items_purchased JSON,
    campfire_rested INT NOT NULL DEFAULT 0,
    item_purchase_floors JSON,
    gold INT NOT NULL DEFAULT 0,
    neow_bonus ENUM('THREE_ENEMY_KILL') DEFAULT NULL,
    is_prod bool DEFAULT false,
    is_daily bool DEFAULT FALSE,
    chose_seed bool default false,
    campfire_upgraded INT NOt NULL DEFAULT 0,
    win_rate INT NOT NULL DEFAULT 0,
    timestamp VARCHAR(50) NOT NULL DEFAULT '-1',
    path_taken JSON,
    build_version DATE,
    purchased_purges INT NOT NULL DEFAULT 0,
    victory bool default false,
    relics_obtained JSON,
    event_choices JSON,
    items_purged_floors JSON,
    is_endless bool default false,
    ascension_level INT NOT NULL DEFAULT 0
);

#
#	To see your run table
#
SELECT * FROM RUN;

