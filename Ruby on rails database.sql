create database rubyonrail;
use rubyonrail;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    address TEXT,
    password_digest VARCHAR(255) NOT NULL,
    role VARCHAR(20) CHECK (role IN ('admin', 'normal_user', 'store_owner')) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE stores (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    address TEXT NOT NULL,
    store_owner_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ratings (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    store_id INTEGER REFERENCES stores(id) ON DELETE CASCADE,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, store_id) -- Ensure a user can only rate a store once
);

CREATE INDEX idx_user_id ON ratings(user_id);
CREATE INDEX idx_store_id ON ratings(store_id);

-- Insert Admin User
INSERT INTO users (name, email, address, role, password_digest, created_at, updated_at) 
VALUES 
('Admin User', 'admin1@example.com', '123 Admin St, City', 'admin', 'password_hash_1', NOW(), NOW());

-- Inserting Users
INSERT INTO users (name, email, address, role, password_digest, created_at, updated_at) 
VALUES 
('John Doe', 'john1@example.com', '456 User Ave, City', 'normal_user', 'password_hash_2', NOW(), NOW()),
('Jane Smith', 'jane1@example.com', '789 User Blvd, City', 'normal_user', 'password_hash_3', NOW(), NOW()),
('Mark Johnson', 'mark1@example.com', '101 User Rd, City', 'normal_user', 'password_hash_4', NOW(), NOW()),
('Emily Davis', 'emily1@example.com', '202 User Ln, City', 'normal_user', 'password_hash_5', NOW(), NOW()),
('Michael Brown', 'michael1@example.com', '303 User Way, City', 'normal_user', 'password_hash_6', NOW(), NOW()),
('Sarah Wilson', 'sarah1@example.com', '404 User St, City', 'normal_user', 'password_hash_7', NOW(), NOW()),
('David Lee', 'david1@example.com', '505 User Rd, City', 'normal_user', 'password_hash_8', NOW(), NOW()),
('Mary Miller', 'mary1@example.com', '606 User Blvd, City', 'normal_user', 'password_hash_9', NOW(), NOW()),
('William Moore', 'william1@example.com', '707 User St, City', 'normal_user', 'password_hash_10', NOW(), NOW()),
('Olivia Taylor', 'olivia1@example.com', '808 User Ave, City', 'normal_user', 'password_hash_11', NOW(), NOW()),
('Liam Anderson', 'liam1@example.com', '909 User Ln, City', 'normal_user', 'password_hash_12', NOW(), NOW()),
('Sophia Thomas', 'sophia1@example.com', '1011 User Rd, City', 'normal_user', 'password_hash_13', NOW(), NOW()),
('James Harris', 'james1@example.com', '1112 User Blvd, City', 'normal_user', 'password_hash_14', NOW(), NOW()),
('Charlotte Clark', 'charlotte1@example.com', '1213 User Way, City', 'normal_user', 'password_hash_15', NOW(), NOW()),
('Benjamin Lewis', 'benjamin1@example.com', '1314 User St, City', 'normal_user', 'password_hash_16', NOW(), NOW()),
('Amelia Young', 'amelia1@example.com', '1415 User Rd, City', 'normal_user', 'password_hash_17', NOW(), NOW()),
('Lucas Walker', 'lucas1@example.com', '1516 User Ln, City', 'normal_user', 'password_hash_18', NOW(), NOW()),
('Mia Allen', 'mia1@example.com', '1617 User Blvd, City', 'normal_user', 'password_hash_19', NOW(), NOW()),
('Aiden King', 'aiden1@example.com', '1718 User St, City', 'normal_user', 'password_hash_20', NOW(), NOW());
INSERT INTO users (name, email, address, role, password_digest, created_at, updated_at) 
VALUES 
('Store Owner 1', 'owner1@example.com', '123 Store Owner Ave, City', 'store_owner', 'password_hash_21', NOW(), NOW()),
('Store Owner 2', 'owner2@example.com', '124 Store Owner Ave, City', 'store_owner', 'password_hash_22', NOW(), NOW()),
('Store Owner 3', 'owner3@example.com', '125 Store Owner Ave, City', 'store_owner', 'password_hash_23', NOW(), NOW()),
('Store Owner 4', 'owner4@example.com', '126 Store Owner Ave, City', 'store_owner', 'password_hash_24', NOW(), NOW()),
('Store Owner 5', 'owner5@example.com', '127 Store Owner Ave, City', 'store_owner', 'password_hash_25', NOW(), NOW()),
('Store Owner 6', 'owner6@example.com', '128 Store Owner Ave, City', 'store_owner', 'password_hash_26', NOW(), NOW()),
('Store Owner 7', 'owner7@example.com', '129 Store Owner Ave, City', 'store_owner', 'password_hash_27', NOW(), NOW()),
('Store Owner 8', 'owner8@example.com', '130 Store Owner Ave, City', 'store_owner', 'password_hash_28', NOW(), NOW()),
('Store Owner 9', 'owner9@example.com', '131 Store Owner Ave, City', 'store_owner', 'password_hash_29', NOW(), NOW()),
('Store Owner 10', 'owner10@example.com', '132 Store Owner Ave, City', 'store_owner', 'password_hash_30', NOW(), NOW()),
('Store Owner 11', 'owner11@example.com', '133 Store Owner Ave, City', 'store_owner', 'password_hash_31', NOW(), NOW()),
('Store Owner 12', 'owner12@example.com', '134 Store Owner Ave, City', 'store_owner', 'password_hash_32', NOW(), NOW()),
('Store Owner 13', 'owner13@example.com', '135 Store Owner Ave, City', 'store_owner', 'password_hash_33', NOW(), NOW()),
('Store Owner 14', 'owner14@example.com', '136 Store Owner Ave, City', 'store_owner', 'password_hash_34', NOW(), NOW()),
('Store Owner 15', 'owner15@example.com', '137 Store Owner Ave, City', 'store_owner', 'password_hash_35', NOW(), NOW()),
('Store Owner 16', 'owner16@example.com', '138 Store Owner Ave, City', 'store_owner', 'password_hash_36', NOW(), NOW()),
('Store Owner 17', 'owner17@example.com', '139 Store Owner Ave, City', 'store_owner', 'password_hash_37', NOW(), NOW()),
('Store Owner 18', 'owner18@example.com', '140 Store Owner Ave, City', 'store_owner', 'password_hash_38', NOW(), NOW()),
('Store Owner 19', 'owner19@example.com', '141 Store Owner Ave, City', 'store_owner', 'password_hash_39', NOW(), NOW()),
('Store Owner 20', 'owner20@example.com', '142 Store Owner Ave, City', 'store_owner', 'password_hash_40', NOW(), NOW()),
('Store Owner 21', 'owner21@example.com', '143 Store Owner Ave, City', 'store_owner', 'password_hash_41', NOW(), NOW()),
('Store Owner 22', 'owner22@example.com', '144 Store Owner Ave, City', 'store_owner', 'password_hash_42', NOW(), NOW()),
('Store Owner 23', 'owner23@example.com', '145 Store Owner Ave, City', 'store_owner', 'password_hash_43', NOW(), NOW()),
('Store Owner 24', 'owner24@example.com', '146 Store Owner Ave, City', 'store_owner', 'password_hash_44', NOW(), NOW()),
('Store Owner 25', 'owner25@example.com', '147 Store Owner Ave, City', 'store_owner', 'password_hash_45', NOW(), NOW());

-- Insert Store Data
INSERT INTO stores (name, email, address, store_owner_id, created_at, updated_at) 
VALUES
('Store 1', 'store1@example.com', '100 Main St, City', 3, NOW(), NOW()),
('Store 2', 'store2@example.com', '101 Main St, City', 4, NOW(), NOW()),
('Store 3', 'store3@example.com', '102 Main St, City', 5, NOW(), NOW()),
('Store 4', 'store4@example.com', '103 Main St, City', 6, NOW(), NOW()),
('Store 5', 'store5@example.com', '104 Main St, City', 7, NOW(), NOW()),
('Store 6', 'store6@example.com', '105 Main St, City', 8, NOW(), NOW()),
('Store 7', 'store7@example.com', '106 Main St, City', 9, NOW(), NOW()),
('Store 8', 'store8@example.com', '107 Main St, City', 10, NOW(), NOW()),
('Store 9', 'store9@example.com', '108 Main St, City', 11, NOW(), NOW()),
('Store 10', 'store10@example.com', '109 Main St, City', 12, NOW(), NOW()),
('Store 11', 'store11@example.com', '110 Main St, City', 13, NOW(), NOW()),
('Store 12', 'store12@example.com', '111 Main St, City', 14, NOW(), NOW()),
('Store 13', 'store13@example.com', '112 Main St, City', 15, NOW(), NOW()),
('Store 14', 'store14@example.com', '113 Main St, City', 16, NOW(), NOW()),
('Store 15', 'store15@example.com', '114 Main St, City', 17, NOW(), NOW()),
('Store 16', 'store16@example.com', '115 Main St, City', 18, NOW(), NOW()),
('Store 17', 'store17@example.com', '116 Main St, City', 19, NOW(), NOW()),
('Store 18', 'store18@example.com', '117 Main St, City', 20, NOW(), NOW()),
('Store 19', 'store19@example.com', '118 Main St, City', 21, NOW(), NOW()),
('Store 20', 'store20@example.com', '119 Main St, City', 22, NOW(), NOW()),
('Store 21', 'store21@example.com', '120 Main St, City', 23, NOW(), NOW()),
('Store 22', 'store22@example.com', '121 Main St, City', 24, NOW(), NOW()),
('Store 23', 'store23@example.com', '122 Main St, City', 25, NOW(), NOW()),
('Store 24', 'store24@example.com', '123 Main St, City', 3, NOW(), NOW()),
('Store 25', 'store25@example.com', '124 Main St, City', 4, NOW(), NOW()),
('Store 26', 'store26@example.com', '125 Main St, City', 5, NOW(), NOW()),
('Store 27', 'store27@example.com', '126 Main St, City', 6, NOW(), NOW()),
('Store 28', 'store28@example.com', '127 Main St, City', 7, NOW(), NOW()),
('Store 29', 'store29@example.com', '128 Main St, City', 8, NOW(), NOW()),
('Store 30', 'store30@example.com', '129 Main St, City', 9, NOW(), NOW()),
('Store 31', 'store31@example.com', '130 Main St, City', 10, NOW(), NOW()),
('Store 32', 'store32@example.com', '131 Main St, City', 11, NOW(), NOW()),
('Store 33', 'store33@example.com', '132 Main St, City', 12, NOW(), NOW()),
('Store 34', 'store34@example.com', '133 Main St, City', 13, NOW(), NOW()),
('Store 35', 'store35@example.com', '134 Main St, City', 14, NOW(), NOW()),
('Store 36', 'store36@example.com', '135 Main St, City', 15, NOW(), NOW()),
('Store 37', 'store37@example.com', '136 Main St, City', 16, NOW(), NOW()),
('Store 38', 'store38@example.com', '137 Main St, City', 17, NOW(), NOW()),
('Store 39', 'store39@example.com', '138 Main St, City', 18, NOW(), NOW()),
('Store 40', 'store40@example.com', '139 Main St, City', 19, NOW(), NOW()),
('Store 41', 'store41@example.com', '140 Main St, City', 20, NOW(), NOW()),
('Store 42', 'store42@example.com', '141 Main St, City', 21, NOW(), NOW()),
('Store 43', 'store43@example.com', '142 Main St, City', 22, NOW(), NOW()),
('Store 44', 'store44@example.com', '143 Main St, City', 23, NOW(), NOW()),
('Store 45', 'store45@example.com', '144 Main St, City', 24, NOW(), NOW()),
('Store 46', 'store46@example.com', '145 Main St, City', 25, NOW(), NOW()),
('Store 47', 'store47@example.com', '146 Main St, City', 3, NOW(), NOW()),
('Store 48', 'store48@example.com', '147 Main St, City', 4, NOW(), NOW()),
('Store 49', 'store49@example.com', '148 Main St, City', 5, NOW(), NOW()),
('Store 50', 'store50@example.com', '149 Main St, City', 6, NOW(), NOW());

-- Insert Ratings Data
INSERT INTO ratings (user_id, store_id, rating, created_at, updated_at)
VALUES
(2, 1, 4, NOW(), NOW()),
(2, 2, 5, NOW(), NOW()),
(3, 3, 3, NOW(), NOW()),
(3, 4, 2, NOW(), NOW()),
(4, 5, 5, NOW(), NOW()),
(4, 6, 4, NOW(), NOW()),
(5, 7, 3, NOW(), NOW()),
(5, 8, 4, NOW(), NOW()),
(6, 9, 2, NOW(), NOW()),
(6, 10, 5, NOW(), NOW()),
(7, 11, 3, NOW(), NOW()),
(7, 12, 3, NOW(), NOW()),
(8, 13, 5, NOW(), NOW()),
(8, 14, 4, NOW(), NOW()),
(9, 15, 2, NOW(), NOW()),
(9, 16, 1, NOW(), NOW()),
(10, 17, 4, NOW(), NOW()),
(10, 18, 5, NOW(), NOW()),
(11, 19, 3, NOW(), NOW()),
(11, 20, 2, NOW(), NOW()),
(12, 21, 4, NOW(), NOW()),
(12, 22, 5, NOW(), NOW()),
(13, 23, 4, NOW(), NOW()),
(13, 24, 3, NOW(), NOW()),
(14, 25, 1, NOW(), NOW()),
(14, 26, 4, NOW(), NOW()),
(15, 27, 5, NOW(), NOW()),
(15, 28, 2, NOW(), NOW()),
(16, 29, 3, NOW(), NOW()),
(16, 30, 4, NOW(), NOW()),
(17, 31, 5, NOW(), NOW()),
(17, 32, 1, NOW(), NOW()),
(18, 33, 4, NOW(), NOW()),
(18, 34, 3, NOW(), NOW()),
(19, 35, 2, NOW(), NOW()),
(19, 36, 5, NOW(), NOW()),
(20, 37, 4, NOW(), NOW()),
(20, 38, 5, NOW(), NOW()),
(21, 39, 3, NOW(), NOW()),
(21, 40, 4, NOW(), NOW()),
(22, 41, 1, NOW(), NOW()),
(22, 42, 5, NOW(), NOW()),
(23, 43, 4, NOW(), NOW()),
(23, 44, 3, NOW(), NOW()),
(24, 45, 2, NOW(), NOW()),
(24, 46, 5, NOW(), NOW()),
(25, 47, 3, NOW(), NOW());

select * from users;