DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS user_sessions;
DROP TABLE IF EXISTS memos;
DROP TABLE IF EXISTS todos;
DROP TABLE IF EXISTS cubes;
DROP TABLE IF EXISTS collect_cubes;


CREATE TABLE users(
    user_id INT PRIMARY KEY,
    github_id VARCHAR(30) NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP,
    deleted_at TIMESTAMP,
    contributes INT NOT NULL
);
CREATE INDEX IDX_USERS ON users(user_id);

INSERT
    users
VALUES
    (1, "thirdlf03", default, default, default, 10);
    (2, "kenta-afk", default, default, default, 8);
    (3, "naoid", default, default, default, 9);
    (4, "dokki", default, default, default, 5);
    (5, "umeno", default, default, default, 17);

CREATE TABLE user_sessions(
    session_id VARCHAR(30) PRIMARY KEY,
    user_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN kEY user_sessions(user_id) REFERENCES users(user_id)
                            ON DELETE CASCADE
);
CREATE INDEX IDX_USER_SESSIONS ON user_sessions(session_id);


CREATE TABLE memos(
    memo_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    context TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IDX_MEMOS ON memos(memo_id);

INSERT
    memos
VALUES
    (1, 1, "あいうえお", default);
    (2, 2, "厳しいって", default);
    (3, 5, "眠い", default);
    (4, 4, "あああああ", default);

CREATE TABLE todos(
    todo_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    context TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    is_success BOOLEAN NOT NULL,
    FOREIGN KEY todos(user_id) REFERENCES users(user_id)
                            ON DELETE CASCADE
);
CREATE INDEX IDX_TODOS ON todos(todo_id);


INSERT
    todos
VALUES
    (1, 1, "hogehge", default, 1),
    (2, 1,"今日の夜ご飯", default, 0);
    (3, 3, "print", default, 1);
    (4, 2, "while", default, 0);


CREATE TABLE cubes(
    cube_id INT PRIMARY KEY,
    cube_model_id VARCHAR(100),
    cube_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IDX_CUBES ON cubes(cube_id);

INSERT
    cubes
VALUES
    (1, "58ed1f88-9440-7f22-b3f8-c210dec56fbb", "basket-sarface.glb", default);
    (2, "e02d23c9-562c-ec31-bcd2-0a0fdc191703", "basket-side.glb", default);
    (3, "1ea1d209-8f3a-0b24-e8c3-1aeb980dff71", "cherryblossom-side.glb", default);
    (4, "8f769177-7b0a-9400-d9ea-5653e2b8cf04", "cherryblossom-surface.glb", default);
    (5, "90df4a6c-04f5-501a-a93a-5900200a234b", "dodecahedron-side.glb", default);
    (6, "53f4cdf3-1d58-bda9-787d-a21d0f42d954", "dodecahedron-side-surface.glb", default);
    (7, "cb2e8322-f839-792d-baa5-a4728467cf41", "dodecahedron-surface.glb", default);
    (8, "fbbc0c79-c7e7-9923-f0c0-0ef3ed6a483b", "GARERIA001.glb", default);
    (9, "622fd55b-cb11-4f0a-41a9-72a7121b9dfd", "golfball-side.glb", default);
    (10, "9b20a286-a4a6-dc19-9e3d-e201079102f9", "golfball-surface.glb", default);
    (11, "938311d3-f1ef-ba60-96e3-9f9145f0b348", "hydrangea.glb", default);
    (12, "1b120604-4e83-8c84-1e30-bbc29ae7d152", "normalcube.glb", default);
    (13, "261bb6b2-5abc-8f0b-0bd9-7d87ea4b4152", "pentahedrons-side.glb", default);
    (14, "f8b67a4a-1b8c-ea3c-7600-2e742901d79e", "pentahedrons-side-surface.glb", default);
    (15, "754970d9-9816-d050-97a6-886d9fc3c927", "pentahedrons-surface.glb", default);
    (16, "8e7594fc-fe58-bfd7-b9ee-f3a0adf18612", "pineapple-side.glb", default);
    (17, "75a6e9ed-273e-f954-0d79-27efdcaa4b10", "pineapple-side-surface.glb", default);
    (18, "8f18cb23-3f2f-a53f-22b1-ff3313c3d502", "pineapple-surface.glb", default);
    (19, "11815563-8338-7dac-2f24-4b36317339c1", "spaceship-side-surface.glb", default);
    (20, "3a230277-bc91-a3c5-cabf-52f2cff8500b", "starfish.glb", default);
    (21, "a3c16996-8cc1-d5dd-1be4-9ddd15dcc432", "star-side.glb", default);
    (22, "7e5a37a1-6371-1e1b-5dc8-25d0aa62ef27", "starstarfish.glb", default);
    (23, "449f7a21-2ab1-6f50-690d-53845a94a9fa", "star-surface.glb", default);
    (24, "f0f89b91-07e1-ab25-25eb-b62af9a095bd", "stone-side.glb", default);
    (25, "f59d3f41-9511-23b8-3341-33488009cdd4", "stone-side-surface.glb", default);
    (26, "3365fcbc-f310-abdc-b660-87918041e4c1", "stone-surface.glb", default);
    (27, "fdd6d9ff-eb25-74df-7ea8-9802d36700d1", "sun-side.glb", default);
    (28, "195967c0-387b-551e-2319-5828efaea2c0", "sun-surface.glb", default);
    (29, "1d391156-22f2-cb5d-d07e-9288bced6d57", "triangles-side.glb", default);
    (30, "0fc44225-fb72-799f-d079-1fc715419ea4", "turtle-side.glb", default);
    (31, "b162565f-96d9-eb55-753a-8c1f0f8513aa", "turtle-side-surface.glb", default);
    (32, "5d7017f1-aba5-bb2a-dcc4-0bd649664035", "turtle-surface.glb", default);
CREATE TABLE collect_cubes(
    id INT PRIMARY KEY,
    cube_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cube_id) REFERENCES cubes(cube_id)
                         ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
                         ON DELETE CASCADE
);

INSERT
    collect_cubes
VALUES
    (1, 1, 1, default);
    (2, 1, 1, default);
    (3, 30, 3, default);
    (4, 20, 5, default);