# 🔐 신탁 기반 정산 시스템

<p align="center">
<img src="https://media.discordapp.net/attachments/1457598301292466433/1463184990685892703/1st_flow_settle_up.001.jpeg?ex=6970e8b6&is=696f9736&hm=4caf11afcebf1b15b1b7fc3e76002b2f26d793451a135f161d582e0ecfba5a07&=&format=webp&width=738&height=554" />
</p>

---

# 👥 flow 팀원 소개

<table>
  
  <tr>
    <th>김진혁</th>
    <th>박하얀</th>
    <th>양준석</th>
    <th>이진</th>
    <th>한규진</th>
    <th>황희수
  </tr>
  
  <tr>
    <td align="center"><img width="120" alt="김진혁" src="introduce/kimjinhyuk.png" /></td>
    <td align="center"><img width="120" alt="박하얀" src="introduce/hayan.png" /></td>   
    <td align="center"><img width="120" alt="양준석" src="introduce/yangjunseok.webp" /></td>   
    <td align="center"><img width="120" alt="이진" src="introduce/leejin.png" /></td>  
    <td align="center"><img width="120" alt="한규진" src="introduce/hankyujin.png" /></td>   
    <td align="center"><img width="120" alt="황희수" src="introduce/hwangheesu.png" /></td>  
  </tr>

  <tr>
    <td align="center">
      <a href="https://github.com/jin605"><img src="https://img.shields.io/badge/github-181717.svg?style=for-the-badge&logoColor=white" /></a>
    </td> 
    <td align="center">
      <a href="https://github.com/P-HAYAN"><img src="https://img.shields.io/badge/github-181717.svg?style=for-the-badge&logoColor=white" /></a>
    </td>
    <td align="center">
      <a href="https://github.com/YJunSuk"><img src="https://img.shields.io/badge/github-181717.svg?style=for-the-badge&logoColor=white" /></a>
    </td>
    <td align="center">
      <a href="https://github.com/LeeJin0801"><img src="https://img.shields.io/badge/github-181717.svg?style=for-the-badge&logoColor=white" /></a>
    </td>
    <td align="center">
      <a href="https://github.com/softworldqjin"><img src="https://img.shields.io/badge/github-181717.svg?style=for-the-badge&logoColor=white" /></a>
    </td>
    <td align="center">
      <a href="https://github.com/huisu73"><img src="https://img.shields.io/badge/github-181717.svg?style=for-the-badge&logoColor=white" /></a>
    </td>
  </tr>
</table>
    
---


# 🧭 목차

1. [📚 프로젝트 개요](#1--프로젝트-개요)
2. [🛠️ 주요 기능](#2-%EF%B8%8F-주요-기능)
3. [📅 WBS](#3--wbs)
4. [🧾 요구사항 명세서](#4--요구사항-명세서)
5. [🧵 유스케이스](#5--유스케이스)
6. [🧩 ERD](#6--erd)
7. [🗃 테이블 명세서](#7--테이블-명세서)
8. [🗄️ SQL](#8-%EF%B8%8F-sql)
9. [📰 시나리오](#9--시나리오)
10. [💬 팀회고](#10--팀회고)
---


# 1. 📚 프로젝트 개요

### 💡 개발 배경 및 필요성
국내 이커머스 시장은 급속한 성장을 이루었으나, 정산 인프라는 여전히 구조적 취약성을 내포하고 있습니다. 2024년에 발생한 <b>'티몬·위메프(티메프) 사태'는 플랫폼이 판매자에게 지급해야 할 정산 대금을 별도 분리 없이 회사 운영</br>자금으로 사용하며 발생했습니다. 이로 인해 약 4만 8천 개의 판매업체가 1조 원이 넘는 미정산 피해를 입었으며, 이는 곧 소비자의 상품 배송 중단 및 환불 거부로 이어져 막대한 사회적 비용을 발생시켰습니다.</br></br>
<p align="center">
  <img src="img/image1.png" /><br>
  <img src="img/image2.png" />
</p>
티메프 사태 이후 정부는 일정 규모 이상의 플랫폼에 대해 정산 대금의 50% 이상을 금융기관에 별도 예치(신탁)하도록 법 개정을 완료함에 따라, 기업들은 자금 운영의 유동성을 확보하면서도, 보다 엄격해진 정산·보관 기준을 함께 충족해야 하는 상황에 놓이게 되었습니다. 하지만 실제 현장에서는 여전히 파편화된 결제 수단과 복잡한 수수료 구조를 수기나 불투명한 내부 시스템에 의존하고 있어, 자금 흐름의 투명성이 확보가 되지 못하고 있습니다. 이러한 구조는 본사와 가맹점 간의 신뢰를 저해하고, 소상공인의 경영 안정성을 위협하는 원인이 되고 있습니다.

---

# 2. 🛠️ 주요 기능

### 🎯 서비스 목표
본 서비스는 판매자 정산 대금이 플랫폼 운영 자금과 분리되어 안전하게 관리될 수 있도록 자금 격리 기반 정산 아키텍처를 구축하고, 결제부터 입금까지의 전 과정을 데이터로 투명하게 기록·검증할 수 있는 B2B 정산 관리 환경을 제공하는 것을 목표로 합니다.</br></br>
<p align="center">
  <img src="img/image3.png" />
</p></br>

**🔒 가변적 자금 격리 및 법적 컴플라이언스 준수**

법에서 요구하는 최소 예치비율을 자동으로 산출·모니터링하고, 해당 금액을 제3의 금융기관(신탁계좌)에 별도로 관리합니다.
이를 통해 플랫폼은 운영자의 유동성을 유지하면서도, 판매자 정산 대금이 일반 운영 자금과 혼재되지 않도록 구조적으로 분리된 관리 체계를 구축할 수 있습니다.</br></br>

**⚙️ 다채널 통합 및 기업형 정산 자동화**

카드, 간편결제, 후불결제 등 상이한 정산 주기와 수수료 체계를 가진 결제 데이터를 하나의 표준 규격으로 통합합니다. 가맹점 계약 조건에 따른 수수료, 공제액, 로열티 등을 자동 산출하고, 정산은 업계 표준 계약서에서 일반적으로 사용하는 정산 기한 기준에 맞춰 정산 자동화를 설계합니다.</br></br>

**🤝 투명한 데이터 대조 및 상생 생태계 조성**

시스템 내 정산 결과와 실제 은행·카드사 입금 데이터를 실시간으로 대조하여 오차 여부를 투명하게 공개합니다. 가맹점주에게는 '보호 중인 금액', ‘정산 예정 금액’, ‘입금 일정’ 등을 직접 확인할 수 있습니다. 이를 통 본사와 가맹점 간의 정보 비대칭을 해소하고, 정산 신뢰를 기반으로 한 안정적인 파트너십 구조를 형성에 기여합니다.

---

# 3. 📅 WBS
![](img/WBS.PNG)<br/>
🔗[ WBS (프로젝트 진행 일정)](https://docs.google.com/spreadsheets/d/1XrcdHR66LJBE2SWYMY66MDVdNAcpkelMdxSjatsnTk0/edit?gid=0#gid=0)

---

# 4. 🧾 요구사항 명세서
![](img/requirements.PNG)<br/>
🔗[ 요구사항 명세서 ](https://docs.google.com/spreadsheets/d/1t-3yzFlvFUKhRYMtjQxSj4t5rjAZPjR0/edit?gid=1080029165#gid=1080029165)

---

# 5. 🧵 유스케이스
<p align="center">
  <img src="img/usecase.png" />
</p>

---

# 6. 🧩 ERD
![](img/flow_erd.png)
🔗[ ERD ](https://www.erdcloud.com/d/uzGd5MBTRGSqNebu2)

---

# 7. 🗃 테이블 명세서
![](img/table.PNG)<br/>
🔗[ 테이블 명세서 ](https://docs.google.com/spreadsheets/d/1HM-mU0-lc_Kd9HSFikO5GXxtWctQNYoIqnbgs6Q8_N0/edit?gid=993473287#gid=993473287)

---

# 8. 🗄️ SQL

<details>
    <summary>DDL</summary>

#### PG사 테이블
```sql
CREATE TABLE IF NOT EXISTS pg_provider ( 
    pg_provider_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    bank_code VARCHAR(20) NOT NULL
);
```

#### 은행 테이블
```sql
CREATE TABLE IF NOT EXISTS bank (
    bank_id INT AUTO_INCREMENT PRIMARY KEY,
    bank_name VARCHAR(10) NOT NULL,
    bank_code VARCHAR(5) NOT NULL
);
```

#### 가맹점 테이블
```sql
CREATE TABLE IF NOT EXISTS merchant (
    merchant_id INT AUTO_INCREMENT PRIMARY KEY,
    business_name VARCHAR(50) NOT NULL,
    business_no VARCHAR(12) NOT NULL UNIQUE,
    status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE' CHECK (status IN ('ACTIVE', 'INACTIVE', 'DISABLED'))
);
```

#### 정산 규칙 테이블
```sql
CREATE TABLE IF NOT EXISTS settlement_rule ( 
    settlement_rule_id INT AUTO_INCREMENT PRIMARY KEY,
    pg_provider_id INT NOT NULL,
    name VARCHAR(20) NOT NULL,
    delay_days INT,
    FOREIGN KEY (pg_provider_id) REFERENCES pg_provider(pg_provider_id)
);
```

#### 정산대금 분배 규칙 테이블
```sql
CREATE TABLE IF NOT EXISTS distribution_rule (
    distribution_rule_id INT AUTO_INCREMENT PRIMARY KEY,
    entrusted_ratio DECIMAL(10, 2) NOT NULL,
    hq_ratio DECIMAL(10, 2) NOT NULL
);
```

#### 원천/내역 데이터 테이블
```sql
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
```

#### 정산 주기 테이블
```sql
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
```

#### 정산 명세 테이블
```sql
CREATE TABLE IF NOT EXISTS settlement_statement (
    settlement_statement_id INT AUTO_INCREMENT PRIMARY KEY,
    settlement_cycle_id INT NOT NULL,
    settlement_state VARCHAR(20) NOT NULL,
    settlement_amount DECIMAL(18, 2) NOT NULL CHECK (settlement_amount >= 0),
    occurred_at DATETIME,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (settlement_cycle_id) REFERENCES settlement_cycle(settlement_cycle_id)
);
```

#### 본사 테이블
```sql
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
    bank_id INT NOT NULL,
    FOREIGN KEY (settlement_statement_id) REFERENCES settlement_statement(settlement_statement_id),
    FOREIGN KEY (distribution_rule_id) REFERENCES distribution_rule(distribution_rule_id),
    FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id),
    FOREIGN KEY (trust_account_id) REFERENCES trust_account(trust_account_id),
    FOREIGN KEY (bank_id) REFERENCES bank(bank_id) 
);
```

#### 위탁 계좌 테이블
```sql
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
```

#### 회원 테이블
```sql
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
```

#### 가맹점 사용자 권한 테이블
```sql
CREATE TABLE IF NOT EXISTS merchant_user_role (
    merchant_user_id INT AUTO_INCREMENT PRIMARY KEY,
    merchant_id INT DEFAULT NULL,
    user_id INT NOT NULL,
    user_role VARCHAR(10) NOT NULL DEFAULT 'VIEWER' CHECK (user_role IN ('OWNER', 'ADMIN', 'VIEWER', 'WITHDRAWN')),
    FOREIGN KEY (user_id) REFERENCES service_user(user_id),
    FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id) 
);
```

#### 가맹점 계좌
```sql
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
```

#### PG-본사 간 원장 테이블
```sql
CREATE TABLE IF NOT EXISTS pg_headquarter_ledger (
    ledger_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    pg_provider_id INT NOT NULL,
    hq_id INT NOT NULL,
    amount DECIMAL(18, 2) NOT NULL CHECK (amount <> 0),
    deposited_at DATETIME NOT NULL,
    FOREIGN KEY (pg_provider_id) REFERENCES pg_provider(pg_provider_id),
    FOREIGN KEY (hq_id) REFERENCES headquarter(hq_id)
);
```

#### 본사-가맹점,회원 간 원장 테이블
```sql
CREATE TABLE IF NOT EXISTS headquarter_merchant_member_ledger (
    ledger_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hq_id INT NOT NULL,
    merchant_id INT NOT NULL,
    amount DECIMAL(18, 2) NOT NULL CHECK (amount <> 0),
    deposited_at DATETIME NOT NULL,
    FOREIGN KEY (hq_id) REFERENCES headquarter(hq_id),
    FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id)
);

```

#### 본사-위탁 간 원장 테이블
```sql
CREATE TABLE IF NOT EXISTS headquarter_trust_ledger (
    ledger_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hq_id INT NOT NULL,
    trust_account_id INT NOT NULL,
    amount DECIMAL(18, 2) NOT NULL CHECK (amount <> 0),
    deposited_at DATETIME NOT NULL,
    FOREIGN KEY (hq_id) REFERENCES headquarter(hq_id),
    FOREIGN KEY (trust_account_id) REFERENCES trust_account(trust_account_id)
);
```

#### 위탁-가맹점,회원 간 원장 테이블
```sql
CREATE TABLE IF NOT EXISTS trust_partner_ledger (
    ledger_id BIGINT AUTO_INCREMENT PRIMARY KEY,
    trust_account_id INT NOT NULL,
    merchant_id INT NOT NULL,
    amount DECIMAL(18, 2) NOT NULL CHECK (amount <> 0),
    deposited_at DATETIME NOT NULL,
    FOREIGN KEY (trust_account_id) REFERENCES trust_account(trust_account_id),
    FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id)
);
```

</details>


<details>
    <summary>DML</summary>
  
</details>

<details>
  <summary>Test Case</summary>
  <details>
      <summary>FR-01-01 : 결제 원천 데이터 저장 </summary>
       <img src="img/테스트케이스/FR-01-01.png" />
    
  </details>
  <details>
      <summary>FR-02-01 : 정산 규칙 생성 </summary>
       <img src="img/테스트케이스/FR-02-01.png" />
    
  </details>
  
  <details>
      <summary>FR-02-02 : 정산 주기 생성 </summary>
       <img src="img/테스트케이스/FR-02-02.png" />
    
  </details>  
  
  <details>
      <summary>FR-02-03 : 정산 주기 규칙 적용 </summary>
       <img src="img/테스트케이스/FR-02-03.png" />
    
  </details>  

  <details>
      <summary>FR-02-04 : 정산 명세 생성 </summary>
       <img src="img/테스트케이스/FR-02-04.png" />
    
  </details>

  <details>
      <summary>FR-02-05 : 정산 완료 예정일 계산 및 갱신 </summary>
       <img src="img/테스트케이스/FR-02-05.png" />
       <img src="img/테스트케이스/FR-02-05-01.png" />
    
  </details>
  
  <details>
      <summary>FR-03-01 : 정산 총액 입금 후 본사 계좌 갱신 </summary>
       <h3>지급해야 할 PG사별 정산 총액 집계</h3>
       <img src="img/테스트케이스/FR-03-01-01.png" />
       <h3>PG→본사 입금 원장 기록 저장</h3>  
       <img src="img/테스트케이스/FR-03-01-02.png" />
       <img src="img/테스트케이스/FR-03-01-03.png" />
       <h3>본사 계좌 갱신</h3>
       <img src="img/테스트케이스/FR-03-01-04.png" />
       <img src="img/테스트케이스/FR-03-01-05.png" />
       <h3>정산 명세 지급 완료 처리</h3>
       <img src="img/테스트케이스/FR-03-01-06.png" />
       <img src="img/테스트케이스/FR-03-01-07.png" />
       <h3>정산 주기 지급 완료 처리</h3>
       <img src="img/테스트케이스/FR-03-01-08.png" />
       <img src="img/테스트케이스/FR-03-01-09.png" />
  </details>  
  
  <details>
      <summary>FR-04-01 : 본사계좌 데이터 저장 </summary>
       <img src="img/테스트케이스/요구사항 FR-04-01.png" />
    
  </details>
  <details>
      <summary>FR-04-02 : 위탁계좌 데이터 저장 </summary>
       <img src="img/테스트케이스/요구사항 FR-04-02.png" />
    
  </details>
  <details>
      <summary>FR-04-03 : 가맹점계좌 데이터 저장 </summary>
       <img src="img/테스트케이스/요구사항 FR-04-03.png" />
    
  </details>
  <details>
      <summary>FR-05-01 : 본사 수수료 계산 및 순정산금 저장 </summary>
       <img src="img/테스트케이스/FR-05-00a.png" />
       <img src="img/테스트케이스/FR-05-00b.png" />
       <img src="img/테스트케이스/FR-05-01a.png" />
       <img src="img/테스트케이스/FR-05-01b.png" />
  </details>
  
  <details>
      <summary>FR-05-02 : 순정산금 분배 규칙 적용 </summary>
       <img src="img/테스트케이스/FR-05-02a.png" />
       <img src="img/테스트케이스/FR-05-02b.png" />
  </details>  
  
  <details>
      <summary>FR-05-03 :  본사 계좌 자금 갱신 </summary>
       <img src="img/테스트케이스/FR-05-03b.png" />
       <img src="img/테스트케이스/FR-05-03c.png" />
  </details>

  <details>
      <summary>FR-06-01 :  본사 계좌 자금 갱신 </summary>
       <img src="img/테스트케이스/FR-06-01a.png" />
       <img src="img/테스트케이스/FR-06-01b.png" />
       <img src="img/테스트케이스/FR-06-01c.png" />
  </details>  

  <details>
      <summary>FR-06-02 :  위탁 계좌 자금 갱신 </summary>
       <img src="img/테스트케이스/FR-06-02a.PNG" /><br>
       <img src="img/테스트케이스/FR-06-02b.PNG" /><br>
       <img src="img/테스트케이스/FR-06-02c.PNG" /><br>
       <img src="img/테스트케이스/FR-06-02d.PNG" /><br>
       <img src="img/테스트케이스/FR-06-02e.PNG" /><br>
       <img src="img/테스트케이스/FR-06-02f.PNG" /><br>
       <img src="img/테스트케이스/FR-06-02g.PNG" />
  </details> 

  <details>
      <summary>FR-07-01 : 가맹점 계좌 자금 갱신 </summary>
       <img src="img/테스트케이스/FR-07-01-01.png" />
       <img src="img/테스트케이스/FR-07-01-02.png" />
       <img src="img/테스트케이스/FR-07-01-03.png" />
       <img src="img/테스트케이스/FR-07-01-04.png" />
       <img src="img/테스트케이스/FR-07-01-05.png" />
       <img src="img/테스트케이스/FR-07-01-06 .png" />
       <img src="img/테스트케이스/FR-07-01-07 .png" />
       <img src="img/테스트케이스/FR-07-01-08.png" />
       <img src="img/테스트케이스/FR-07-01-09.png"/>
  </details>
  
  <details>
      <summary>FR-08-01 : PG사 -> 본사 원장 데이터 저장 </summary>
       <img src="img/테스트케이스/FR-08-01.png" />
    
  </details>
  <details>
      <summary>FR-08-02 : 본사 - 위탁계좌 원장 데이터 저장 </summary>
       <img src="img/테스트케이스/FR-08-02.png" />
    
  </details>
  <details>
      <summary>FR-08-03 : 본사 - 가맹점 원장 데이터 저장 </summary>
       <img src="img/테스트케이스/FR-08-03.png" />
    
  </details>
  <details>
      <summary>FR-08-04 : 위탁계좌 - 가맹점 원장 데이터 저장 </summary>
       <img src="img/테스트케이스/FR-08-04.png" />
    
  </details>
  <details>
      <summary>FR-08-05 : 자금흐름 원장 감사</summary>
       <h3>가맹점 기준 전체 자금 흐름 타임라인 감사</h3>
       <img src="img/테스트케이스/FR-08-05-1.png" />
       <h3>본사 기준 들어온 돈 vs 나간 돈 감사</h3>
       <img src="img/테스트케이스/FR-08-05-2.png" />
       <h3>위탁계좌 기준 감사</h3>
       <img src="img/테스트케이스/FR-08-05-3.png" />
       <h3>정산 1건(hq_id) 단위 정합성 감사</h3>
       <img src="img/테스트케이스/FR-08-05-4.png" />
    
  </details>
  
  <details>
      <summary>FR-09-01 : 카드사/PG 등록 </summary>
       <img src="img/테스트케이스/FR-09-01.png" />
  </details>  
  
  <details>
      <summary>FR-09-02 : 정산 규칙 관리 </summary>
       <img src="img/테스트케이스/FR-09-02a.png" />
       <img src="img/테스트케이스/FR-09-02b.png" />
  </details>  

  <details>
      <summary>FR-10-01 : 회원 관리 </summary>
       <img src="img/테스트케이스/FR-10-01 이메일 중복 체크.png" />
       <img src="img/테스트케이스/FR-10-01 회원가입_사용자 권한 등록VIEWER.png" />
       <img src="img/테스트케이스/FR-10-01 회원가입.png" />
  </details>  

  <details>
      <summary>FR-10-02 : 로그인 </summary>
       <img src="img/테스트케이스/FR-10-02 로그인_@user_id 설정.png" />
  </details>  
  

  <details>
      <summary>FR-10-03 : 로그아웃 </summary>
       <img src="img/테스트케이스/FR-10-03 로그 아웃.png" />
  </details> 

  <details>
      <summary>FR-10-04 : 회원 탈퇴 </summary>
       <img src="img/테스트케이스/FR-10-04 회원탈퇴 회원 선택_불가능.png" />
       <img src="img/테스트케이스/FR-10-04 탈퇴 가능 여부_불가능.png" />
       <img src="img/테스트케이스/FR-10-04 회원탈퇴 회원 선택_가능.png" />
       <img src="img/테스트케이스/FR-10-04 탈퇴 가능 여부_가능.png" />
       <img src="img/테스트케이스/FR-10-04 회원탈퇴 가맹점 계좌 상태 변경_1.png" />
       <img src="img/테스트케이스/FR-10-04 회원탈퇴 가맹점 계좌 상태 변경_2.png" />
       <img src="img/테스트케이스/FR-10-04 회원탈퇴 가맹점 상태 변경_1.png" />
       <img src="img/테스트케이스/FR-10-04 회원탈퇴 가맹점 상태 변경_2.png" />
       <img src="img/테스트케이스/FR-10-04 회원탈퇴 위탁 계좌 상태 변경_1.png" />
       <img src="img/테스트케이스/FR-10-04 회원탈퇴 위탁 계좌 상태 변경_2.png" />
  </details> 

  <details>
      <summary>FR-10-05 : 가맹점 등록 </summary>
       <img src="img/테스트케이스/FR-10-05 가맹점 중복체크.png" />
       <img src="img/테스트케이스/FR-10-05 가맹점 등록.png" />
       <img src="img/테스트케이스/FR-10-05 가맹점 사용자 권한 설정.png" />
  </details> 

  <details>
      <summary>FR-10-06 : 가맹점 등록 해제 </summary>
       <img src="img/테스트케이스/FR-10-06 가맹점 등록 해제 가맹점 선택.png" />
       <img src="img/테스트케이스/FR-10-06 가맹점 해제 가맹점 계좌 상태 변경_1.png" />
       <img src="img/테스트케이스/FR-10-06 가맹점 해제 가맹점 계좌 상태 변경_2.png" />
       <img src="img/테스트케이스/FR-10-06 가맹점 해제 위탁 계좌 상태 변경_1.png" />
       <img src="img/테스트케이스/FR-10-06 가맹점 해제 위탁 계좌 상태 변경_2.png" />
       <img src="img/테스트케이스/FR-10-06 가맹점 해제 가맹점 등록 상태 변경_1.png" />
       <img src="img/테스트케이스/FR-10-06 가맹점 해제 가맹점 등록 상태 변경_2.png" />
       <img src="img/테스트케이스/FR-10-06 가맹점 해제 사업자 유효성 검증.png" />
  </details> 

  <details>
      <summary>FR-11-01 : 사업자 정보 등록 및 조회 </summary>
       <img src="img/테스트케이스/FR-11-01 대표자 조회.png" />
       <img src="img/테스트케이스/FR-11-01 대표자명 조회.png" />
       <img src="img/테스트케이스/FR-11-01 사업자 번호 중복 체크.png" />
  </details> 
  
  <details>
      <summary>FR-11-02 : 가맹점 계좌 정보 등록 </summary>
       <img src="img/테스트케이스/FR-11-02 예금주명 대표자명 일치 여부.png" />
       <img src="img/테스트케이스/FR-11-02 가맹점 계좌 등록.png" />
  </details> 

  <details>
      <summary>FR-11-03 : 결제 대행사 선택 </summary>
       <img src="img/테스트케이스/FR-11-03 PG사 선택_PG사 조회.png" />
       <img src="img/테스트케이스/FR-11-03 PG사 선택_새로운 정산 주기 생성.png" />
       <img src="img/테스트케이스/FR-11-03 PG사 선택_정산 주기 코드 형식화.png" />
  </details> 

  <details>
      <summary>FR-11-04 : 사업자 유효성 검증 </summary>
       <img src="img/테스트케이스/FR-11-04 사업자 유효성 검증.png" />
  </details> 

  <details>
      <summary>FR-12-01 : 정산 내역서 조회 </summary>
       <img src="img/테스트케이스/FR-12-01 정산 내역서 조회 @merchant_id 설정.png" />
       <img src="img/테스트케이스/FR-12-01 정산 내역서 조회_대표자명 조회.png" />
       <img src="img/테스트케이스/FR-12-01 정산 내역서 조회.png" />
  </details>

  <details>
      <summary>FR-12-02 : 지급 내역서 조회 </summary>
       <img src="img/테스트케이스/FR-12-02 지급 내역 데이터 @merchant_id 설정.png" />
       <img src="img/테스트케이스/FR-12-02 지급 내역 데이터_사업자 번호 조회.png" />
       <img src="img/테스트케이스/FR-12-02 지급 내역 데이터_위탁 계좌 조회.png" />
       <img src="img/테스트케이스/FR-12-02 지급 내역 데이터_정산 주기 데이터 조회.png" />
       <img src="img/테스트케이스/FR-12-02 지급 내역 데이터_지급 계좌 조회.png" />
       <img src="img/테스트케이스/FR-12-02 지급 내역서 조회.png" />    
  </details>

  <details>
      <summary>FR-12-03 : 정산 내역서 이의제기 </summary>
       <img src="img/테스트케이스/FR-12-03 정산 내역서 이의 제기 @merchant_id 설정.png
" />
       <img src="img/테스트케이스/FR-12-03 정산 내역서 이의 제기_정산 주기 상태 변경1.png
" />
       <img src="img/테스트케이스/FR-12-03 정산 내역서 이의 제기_정산 주기 상태 변경2.png" />
  </details>

</details> 

---

# 9. 📰 시나리오
확정X)<br/>
![](img/flo.png)

---

# 10. 💬 팀회고

#### 🦊김진혁
> 시도하였던 것

그동안 많은 협업 경험이 있었지만, SW 프로젝트의 팀장을 맡은 것은 이번이 처음이었습니다. 리더로서 프로젝트 전반을 깊이 이해해야 한다는 책임감에 모든 과정에 적극적으로 참여하여, 크고 작은 사안마다 팀원들과 소통하며 의견을 조율했습니다. 특히 금융이라는 복잡한 주제에 도전하며 도메인 지식을 확장하기 위해 노력했습니다.

> 좋았던 점

열정적인 팀원들 덕분에 까다로운 주제를 성공적으로 풀어낼 수 있었습니다. 모든 팀원이 각자 맡은 역할을 끝까지 책임지고, 최선의 결과물을 위해 끊임없이 논의하며 수정해 나갔던 과정이 팀 전체에 큰 시너지를 만들어냈습니다.


> 아쉬웠던 점

첫 SW 프로젝트 리딩이다 보니, 전체적인 로드맵을 그리기보다 당면한 문제에 치중하여 다소 근시안적으로 팀을 이끈 점이 아쉽습니다. 또한 경험 부족으로 인해 결과물에 대한 확신이 부족했고, 이로 인해 신속한 의사결정을 내리지 못했던 점이 보완해야 할 과제로 남았습니다. 이를 해결하기 위해 다음 프로젝트 전까지 이전 기수의 우수 사례들을 분석하며 부족한 경험치를 채워 나갈 계획입니다.

#### 🐹박하얀
> 시도하였던 것


> 좋았던 점


> 아쉬웠던 점

#### 🐑양준석
> 시도하였던 것


> 좋았던 점


> 아쉬웠던 점

#### 🥔이진
> 시도하였던 것


> 좋았던 점


> 아쉬웠던 점

#### 👨‍🚒한규진
> 시도하였던 것


> 좋았던 점


> 아쉬웠던 점

#### 🐻황희수
> 시도하였던 것

정산이라는 낯설고 복잡한 금융 데이터 흐름에 도전했습니다. 단순히 기능을 구현하는 것이 아닌, 실제 서비스라면 어떻게 동작해야 할지를 상상하며 돈의 흐름을 논리적으로 설계하려 했습니다. 이를 통해 정산 도메인에 대한 이해를 넓히고, 비즈니스 관점에서 데이터를 바라보는 시각을 기르기 위해 학습했습니다.

> 좋았던 점

초기에는 정산 용어와 로직이 어렵게만 느껴졌습니다. 하지만 팀원들과 이야기를 나누며 복잡한 흐름을 하나씩 이해해 갈 때 큰 성취감을 느꼈습니다. 특히 SQL이 단순 조회 도구가 아니라, 실제 비즈니스 로직을 담는 구현 언어라는 점이 깊이 이해하게 되었고, 데이터 중심 사고의 중요성을 깨닫는 계기가 되었습니다.

> 아쉬웠던 점

정산 흐름을 코드로만 바라보고 전체 프로세스로 연결하지 못해, 중간에 구조를 다시 이해해야 하는 시간이 필요했습니다. 기능이 돌아가는 결과에 집중하는 것이 아닌, 설계 의도와 흐름을 먼저 이해한 후 어떤 구조로 설계해야 하는지 충분히 고민하는 시간이 필요하다는 것을 체감했습니다.
