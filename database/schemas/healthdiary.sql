DROP DATABASE IF EXISTS healthdiary;
CREATE DATABASE healthdiary;

USE healthdiary;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    user_level VARCHAR(10) DEFAULT 'regular'
);

CREATE TABLE DiaryEntries (
    entry_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    entry_date DATE NOT NULL,
    mood VARCHAR(50),
    weight DECIMAL(5,2),
    sleep_hours INT,
    notes TEXT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Medications (
    medication_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    dosage VARCHAR(50),
    frequency VARCHAR(50),
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Exercises (
    exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    type VARCHAR(100) NOT NULL,
    duration INT NOT NULL,
    intensity VARCHAR(50),
    date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);


INSERT INTO Users (username, password, email, created_at, user_level) VALUES
('johndoe', 'hashed_password', 'johndoe@example.com', '2024-01-01 09:00:00', 'regular'),
('moezy', 'hashed_password', 'muhamed19700@gmail.com', '2024-01-02 10:00:00', 'admin'),
('alice_jones', 'hashed_password', 'alice@example.com', '2024-01-04 08:30:00', 'regular'),
('sarah_wilson', 'hashed_password', 'sarah@example.com', '2024-01-04 14:20:00', 'regular'),
('mike_davis', 'hashed_password', 'mike@example.com', '2024-01-04 16:45:00', 'regular'),
('emma_taylor', 'hashed_password', 'emma@example.com', '2024-01-04 19:30:00', 'regular'),
('chris_moore', 'hashed_password', 'chris@example.com', '2024-01-05 06:15:00', 'regular'),
('bob_brown', 'hashed_password', 'bob@example.com', '2024-01-05 07:45:00', 'regular');

INSERT INTO DiaryEntries (user_id, entry_date, mood, weight, sleep_hours, notes, created_at) VALUES
(1, '2024-01-10', 'Happy', 70.5, 8, 'Had a great workout session', '2024-01-10 20:00:00'),
(2, '2024-01-11', 'Satisfied', 65.0, 7, 'Met with friends, had a good time', '2024-01-11 21:00:00'),
(3, '2024-01-12', 'Tired', 68.0, 6, 'Work was demanding', '2024-01-12 22:00:00'),
(4, '2024-01-13', 'Energetic', 55.0, 9, 'Went for a morning run', '2024-01-13 18:00:00'),
(4, '2024-01-14', 'Relaxed', 75.0, 8, 'Spent the day reading', '2024-01-14 19:00:00');

INSERT INTO Medications (user_id, name, dosage, frequency, start_date, end_date) VALUES
(1, 'Vitamin D', '1000 IU', 'Daily', '2024-01-01', '2024-06-01'),
(2, 'Ibuprofen', '200 mg', 'As needed', '2024-01-05', '2024-01-20'),
(2, 'Amoxicillin', '500 mg', 'Every 8 hours', '2024-01-10', '2024-01-20'),
(4, 'Metformin', '500 mg', 'Twice a day', '2024-01-15', '2024-07-15'),
(2, 'Lisinopril', '10 mg', 'Daily', '2024-01-20', '2024-07-20');

INSERT INTO Exercises (user_id, type, duration, intensity, date) VALUES
(1, 'Running', 30, 'High', '2024-01-10'),
(3, 'Cycling', 45, 'Medium', '2024-01-11'),
(2, 'Swimming', 55, 'Low', '2024-01-12'),
(1, 'Swimming', 30, 'Medium', '2024-01-16'),
(3, 'Swimming', 60, 'Low', '2024-01-18'),
(3, 'Yoga', 50, 'Low', '2024-01-18'),
(1, 'Weight Training', 40, 'High', '2024-01-19');


--
INSERT INTO Users (username, password, email) VALUES
('johndoe2', 'hashed_password2', 'johndoe2@example.com');
