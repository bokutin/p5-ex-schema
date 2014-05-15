CREATE TABLE room (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name
);

CREATE TABLE desk (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    room_id INTEGER,
    name
);
CREATE INDEX idx_desk_room_id ON desk(room_id);
