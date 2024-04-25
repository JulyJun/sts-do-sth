# To set up your database
# Hit space key + ctrl key
# on each line 

#
#	Creating Schema
#
CREATE SCHEMA SlayTheSpire;

use SlayTheSpire;

#
# creating "result table"
#
CREATE TABLE result (
	result_id INT NOT NULL,
	floor_reached INT NOT NULL DEFAULT 0,
    playtime INT NOT NULL DEFAULT 0,
    score INT CHECK (score >= -1 AND score <= 6000),
    damage_taken_total INT NOT NULL DEFAULT 0,
    character_chosen ENUM('IRONCLAD','SILENT','DEFACT','WATCHER','MODE'),
    gold INT NOT NULL DEFAULT 0,
    victory bool NOT NULL,
    relics_obtained JSON,
    PRIMARY KEY(result_id)
);

#
# creating "map table"
# ref: https://github.com/alexdriedger/SlayTheSpireFightPredictor/blob/master/main.py
#
CREATE TABLE map (
	map_id INT NOT NULL,
	path_per_floor JSON,
	campfire_upgraded INT NOt NULL DEFAULT 0,
    item_purchase_floors JSON,
    neow_bonus ENUM(
					'ONE_RARE_RELIC', 'RANDOM_COMMON_RELIC', 'BOSS_RELIC', 'UPGRADE_CARD', 
                    'THREE_ENEMY_KILL', 'REMOVE_CARD', 'REMOVE_TWO', 'TRANSFORM_CARD', 'THREE_CARDS', 
                    'THREE_RARE_CARDS', 'ONE_RANDOM_RARE_CARD'
                    ) DEFAULT NULL,
	path_taken JSON,
    purchased_purges INT NOT NULL DEFAULT 0,
    event_choices JSON,
    items_purged_floors JSON,
    PRIMARY KEY(map_id)
);

#
# creating "misc table"
#
CREATE TABLE misc (
	misc_id INT NOT NULL,
	local_time VARCHAR(32),
    circlet_count varchar(50) NOT NULL DEFAULT '0',
    potions_floor_usage JSON,
    items_purchased JSON,
    win_rate INT NOT NULL DEFAULT 0,
    timestamp VARCHAR(50) NOT NULL DEFAULT '-1',
    PRIMARY KEY(misc_id)
);

#
# creating "mode info table"
#
CREATE TABLE mode_info (
	mode_info_id INT NOT NULL,
    is_ascension_mode bool DEFAULT false,
    seed_source_timestamp varchar(50) NOT NULL DEFAULT '-1',
    special_seed varchar(50) NOT NULL DEFAULT '0',
    is_trial bool DEFAULT false,
    is_prod bool DEFAULT false,
    is_daily bool DEFAULT FALSE,
    chose_seed bool default false,
    build_version DATE,
    is_endless bool default false,
    ascension_level INT NOT NULL DEFAULT 0,
    PRIMARY KEY(mode_info_id)
);

#
# creating "run table"
#
CREATE TABLE run (
	idx INT AUTO_INCREMENT,
    result_id INT NOT NULL,
    misc_id INT NOT NULL,
    mode_info_id INT NOT NULL,
    map_id INt NOT NULL,
	PRIMARY KEY(idx),
    FOREIGN KEY(result_id) REFERENCES result(result_id),
    FOREIGN KEY(misc_id) REFERENCES misc(misc_id),
    FOREIGN KEY(mode_info_id) REFERENCES mode_info(mode_info_id),
    FOREIGN KEY(map_id) REFERENCES map(map_id)
);


#
#	To see your run table
#
SELECT * FROM RUN;
SELECT * FROM map;
SELECT * FROM misc;
SELECT * FROM mode_info;
SELECT * FROM result;
