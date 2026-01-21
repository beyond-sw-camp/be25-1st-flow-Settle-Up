CREATE DATABASE IF NOT EXISTS `정산시스템_프로젝트B` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `정산시스템_프로젝트B`;

-- 1. 기초 관리 테이블
CREATE TABLE IF NOT EXISTS bank (
    bank_id INT AUTO_INCREMENT PRIMARY KEY,
    bank_name VARCHAR(10) NOT NULL,
    bank_code VARCHAR(5) NOT NULL
);

CREATE TABLE IF NOT EXISTS pg_provider ( 
    pg_provider_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    bank_code VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS merchant (
    merchant_id INT AUTO_INCREMENT PRIMARY KEY,
    business_name VARCHAR(50) NOT NULL,
    business_no VARCHAR(12) NOT NULL UNIQUE,
    status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE' CHECK (status IN ('ACTIVE', 'INACTIVE', 'DISABLED'))
);

CREATE TABLE IF NOT EXISTS distribution_rule (
    distribution_rule_id INT AUTO_INCREMENT PRIMARY KEY,
    entrusted_ratio DECIMAL(10, 2) NOT NULL,
    hq_ratio DECIMAL(10, 2) NOT NULL
);

-- 2. 규칙 및 사용자 관련 테이블
CREATE TABLE IF NOT EXISTS settlement_rule ( 
    settlement_rule_id INT AUTO_INCREMENT PRIMARY KEY,
    pg_provider_id INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    delay_days INT,
    FOREIGN KEY (pg_provider_id) REFERENCES pg_provider(pg_provider_id)
);

CREATE TABLE IF NOT EXISTS service_user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    phone_num VARCHAR(20) NOT NULL,
    password_hash VARCHAR(200) NOT NULL,
    user_status VARCHAR(10) NOT NULL DEFAULT 'ACTIVE',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME

);

CREATE TABLE IF NOT EXISTS merchant_user_role (
    merchant_user_id INT AUTO_INCREMENT PRIMARY KEY,
    merchant_id INT DEFAULT NULL,
    user_id INT NOT NULL,
    user_role VARCHAR(10) NOT NULL DEFAULT 'VIEWER' CHECK (user_role IN ('OWNER', 'ADMIN', 'VIEWER', 'WITHDRAWN')),
    FOREIGN KEY (user_id) REFERENCES service_user(user_id),
    FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id)
    
);

-- 3. 금융 및 결제 관련 테이블
CREATE TABLE IF NOT EXISTS trust_account (
    trust_account_id INT AUTO_INCREMENT PRIMARY KEY,
    merchant_id INT NOT NULL,
    bank_id INT NOT NULL,
    account_no_en VARCHAR(20) NOT NULL,
    account_holder VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL,
    balance_amount DECIMAL(18, 2) NOT NULL CHECK (balance_amount >= 0),
    last_synced_at DATETIME NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id),
    FOREIGN KEY (bank_id) REFERENCES bank(bank_id)
);

CREATE TABLE IF NOT EXISTS merchant_bank_account (
    bank_account_id INT AUTO_INCREMENT PRIMARY KEY,
    merchant_id INT NOT NULL,
    bank_id INT NOT NULL,
    account_no_en VARCHAR(20) NOT NULL,
    balance_amount DECIMAL(18, 2) NOT NULL,
    account_holder_name VARCHAR(20) NOT NULL,
    verified_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    account_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE' CHECK (account_status IN ('ACTIVE', 'INACTIVE')),
    FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id),
    FOREIGN KEY (bank_id) REFERENCES bank(bank_id)
);

CREATE TABLE IF NOT EXISTS payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    merchant_id INT NOT NULL,
    pg_provider_id INT NOT NULL,
    pg_tx_id VARCHAR(20) NOT NULL,
    approved_at DATETIME NOT NULL,
    amount DECIMAL(18, 2) NOT NULL CHECK (amount >= 0),
    created_at DATETIME NOT NULL,
    updated_at DATETIME,
    FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id),
    FOREIGN KEY (pg_provider_id) REFERENCES pg_provider(pg_provider_id)
);

-- 4. 정산 주기 및 명세 테이블
CREATE TABLE IF NOT EXISTS settlement_cycle (
    settlement_cycle_id INT AUTO_INCREMENT PRIMARY KEY,
    settlement_cycle_code VARCHAR(20) NOT NULL,
    merchant_id INT NOT NULL,
    pg_provider_id INT NOT NULL,
    period_start_date DATE DEFAULT NULL,
    period_end_date DATE DEFAULT NULL,
    `status` VARCHAR(20) NOT NULL DEFAULT 'PENDING' CHECK (status IN ('PENDING', 'CALCULATED', 'REQUESTED', 'SETTLED', 'FAILED')),
    created_at DATETIME NOT NULL,
    updated_at DATETIME DEFAULT NULL,
    expected_settlement_date DATE DEFAULT NULL,
    FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id),
    FOREIGN KEY (pg_provider_id) REFERENCES pg_provider(pg_provider_id)
    
);

CREATE TABLE IF NOT EXISTS settlement_statement (
    settlement_statement_id INT AUTO_INCREMENT PRIMARY KEY,
    settlement_cycle_id INT NOT NULL,
    settlement_state VARCHAR(20) NOT NULL,
    settlement_amount DECIMAL(18, 2) NOT NULL CHECK (settlement_amount >= 0),
    occurred_at DATETIME,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (settlement_cycle_id) REFERENCES settlement_cycle(settlement_cycle_id)
);

-- 5. 본사 정산 및 원장 테이블
CREATE TABLE IF NOT EXISTS headquarter (
    hq_id INT AUTO_INCREMENT PRIMARY KEY,
    settlement_statement_id INT NOT NULL,
    distribution_rule_id INT NOT NULL,
    merchant_id INT NOT NULL,
    trust_account_id INT NOT NULL,
    total_fee DECIMAL(18, 2) NOT NULL CHECK (total_fee >= 0),
    total_net_amount DECIMAL(18, 2) NOT NULL CHECK (total_net_amount >= 0),
    head_office_account_amount DECIMAL(18, 2) NOT NULL CHECK (head_office_account_amount >= 0),
    total_payout_amount DECIMAL(18, 2) NOT NULL CHECK (total_payout_amount >= 0),
    paid_at DATE NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    hq_office_account_number VARCHAR(20) NOT NULL,
    bank_id INT NOT NULL, -- VARCHAR(5)에서 INT로 변경 (bank 테이블과 일치)
    FOREIGN KEY (settlement_statement_id) REFERENCES settlement_statement(settlement_statement_id),
    FOREIGN KEY (distribution_rule_id) REFERENCES distribution_rule(distribution_rule_id),
    FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id),
    FOREIGN KEY (trust_account_id) REFERENCES trust_account(trust_account_id),
    FOREIGN KEY (bank_id) REFERENCES bank(bank_id) -- 외래 키 관계 명시적 추가
);

CREATE TABLE IF NOT EXISTS pg_headquarter_ledger (
    ledger_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    pg_provider_id INT NOT NULL,
    hq_id INT NOT NULL,
    amount DECIMAL(18, 2) NOT NULL CHECK (amount <> 0),
    deposited_at DATETIME NOT NULL,
    FOREIGN KEY (pg_provider_id) REFERENCES pg_provider(pg_provider_id),
    FOREIGN KEY (hq_id) REFERENCES headquarter(hq_id)
);

CREATE TABLE IF NOT EXISTS headquarter_merchant_member_ledger (
    ledger_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hq_id INT NOT NULL,
    merchant_id INT NOT NULL,
    amount DECIMAL(18, 2) NOT NULL CHECK (amount <> 0),
    deposited_at DATETIME NOT NULL,
    FOREIGN KEY (hq_id) REFERENCES headquarter(hq_id),
    FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id)
);

CREATE TABLE IF NOT EXISTS headquarter_trust_ledger (
    ledger_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hq_id INT NOT NULL,
    trust_account_id INT NOT NULL,
    amount DECIMAL(18, 2) NOT NULL CHECK (amount <> 0),
    deposited_at DATETIME NOT NULL,
    FOREIGN KEY (hq_id) REFERENCES headquarter(hq_id),
    FOREIGN KEY (trust_account_id) REFERENCES trust_account(trust_account_id)
);

CREATE TABLE IF NOT EXISTS trust_partner_ledger (
    ledger_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    trust_account_id INT NOT NULL,
    merchant_id INT NOT NULL,
    amount DECIMAL(18, 2) NOT NULL CHECK (amount <> 0),
    deposited_at DATETIME NOT NULL,
    FOREIGN KEY (trust_account_id) REFERENCES trust_account(trust_account_id),
    FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id)
);
