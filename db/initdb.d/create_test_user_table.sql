CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Alarms (
    alarm_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    scheduled_time DATETIME NOT NULL,
    -- 他のアラームに関する情報を追加
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE IF NOT EXISTS AlarmShares (
    share_id INT AUTO_INCREMENT PRIMARY KEY,
    alarm_id INT,
    shared_with_user_id INT,
    -- 他のアクセス権に関する情報を追加
    FOREIGN KEY (alarm_id) REFERENCES Alarms(alarm_id),
    FOREIGN KEY (shared_with_user_id) REFERENCES Users(user_id)
);
