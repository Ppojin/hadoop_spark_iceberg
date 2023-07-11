create schema testuser;

CREATE PUBLICATION my_publication FOR ALL TABLES WITH (
    publish_via_partition_root = true
);

CREATE TABLE testuser.games (
    app_id integer NOT NULL,
    title varchar NOT NULL,
    date_release date NOT NULL,
    win boolean NOT NULL,
    mac boolean NOT NULL,
    linux boolean NOT NULL,
    steam_deck boolean NOT NULL,
    rating varchar NOT NULL,
    positive_ratio numeric(3, 0) NOT NULL,
    user_reviews integer NOT NULL,
    price_final numeric(5, 2) NOT NULL,
    price_original numeric(5, 2) NOT NULL,
    discount numeric(5, 2) NOT NULL,
	CONSTRAINT pk_games PRIMARY KEY (app_id)
);
alter table testuser.games replica identity full;
