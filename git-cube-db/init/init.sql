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


CREATE TABLE cubes(
    cube_id INT PRIMARY KEY,
    cube_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX IDX_CUBES ON cubes(cube_id);

INSERT
    cubes
VALUES
    (1, "aioueo", default);

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