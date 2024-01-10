INSERT INTO Users (username, email, password) VALUES
('user1', 'user1@example.com', 'password123'),
('user2', 'user2@example.com', 'password456'),
('user3', 'user3@example.com', 'password789');

INSERT INTO Alarms (user_id, title, description, scheduled_time) VALUES
(1, 'Meeting', 'Team meeting at 10 AM', '2024-01-10 10:00:00'),
(2, 'Reminder', 'Submit report by noon', '2024-01-11 12:00:00'),
(3, 'Task', 'Complete project tasks', '2024-01-12 15:30:00');

INSERT INTO AlarmShares (alarm_id, shared_with_user_id) VALUES
(1, 2), -- Share the first alarm with user2
(2, 3); -- Share the second alarm with user3