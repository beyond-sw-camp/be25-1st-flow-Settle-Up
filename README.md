# 🔐 신탁 기반 정산 시스템



# 👥 flow - 팀원 소개

<table>
  <tr> 
    <th colspan = "6" align = "center"> flow </th> 
  </tr>
  
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
7. [📋 테이블 명세서](#7--테이블-명세서)
8. [🗄️ SQL](#8-%EF%B8%8F-sql)
9. [⚙️ 프로시저](#9-%EF%B8%8F-프로시저)
10. [📰 시나리오](#10--시나리오)
11. [💬 팀회고](#11--팀회고)
---


# 1. 📚 프로젝트 개요

### 💡 개발 배경 및 필요성
국내 이커머스 시장은 급속한 성장을 이루었으나, 정산 인프라는 여전히 구조적 취약성을 내포하고 있습니다.</br>
2024년에 발생한 <b>'티몬·위메프(티메프) 사태'</b>는 플랫폼이 판매자에게 지급해야 할 정산 대금을 별도 분리 없이 회사 운영 자금으로 사용하며 발생했습니다.</br> 
이로 인해 약 4만 8천 개의 판매업체가 1조 원이 넘는 미정산 피해를 입었으며, 이는 곧 소비자의 상품 배송 중단 및 환불 거부로 이어져 막대한 사회적 비용을 발생시켰습니다.
![](img/image1.png)
![](img/image2.png)
티메프 사태 이후 정부는 일정 규모 이상의 플랫폼에 대해 정산 대금의 50% 이상을 금융기관에 별도 예치(신탁)하도록 법 개정을 완료함에 따라, 기업들은 자금 운영의 유동성을 확보하면서도, 보다 엄격해진 정산·보관 기준을 함께 충족해야 하는 상황에 놓이게 되었습니다.
하지만 실제 현장에서는 여전히 파편화된 결제 수단과 복잡한 수수료 구조를 수기나 불투명한 내부 시스템에 의존하고 있어, 자금 흐름의 투명성이 확보되지 못하고 있습니다. 이러한 구조는 본사와 가맹점 간의 신뢰를 저해하고, 소상공인의 경영 안정성을 위협하는 원인이 되고 있습니다.

---

# 2. 🛠️ 주요 기능

### 🎯 서비스 목표

---

# 3. 📅 WBS
이미지<br/>
[ WBS (프로젝트 진행 일정)](https://docs.google.com/spreadsheets/d/15r640vRfC-G8uQ3YBSAxLdvZtq2MuxxO7RWO78nD-6M/edit?gid=0#gid=0)

---

# 4. 🧾 요구사항 명세서
![](img/requirements.PNG)<br/>
[ 요구사항 명세서 ](https://docs.google.com/spreadsheets/d/1t-3yzFlvFUKhRYMtjQxSj4t5rjAZPjR0/edit?gid=1080029165#gid=1080029165)

---

# 5. 🧵 유스케이스
확정X)<br/>
![](img/usecase.png)

---

# 6. 🧩 ERD
![](img/ERD.PNG)

---

# 7. 📋 테이블 명세서
![](img/table.PNG)<br/>
[ 테이블 명세서 ](https://docs.google.com/spreadsheets/d/1GI8Nhlo6Zvqm3CNvxjKK17xeaG-IVI5IMGtB0OgICOE/edit?gid=993473287#gid=993473287)

---

# 8. 🗄️ SQL

---

# 9. ⚙️ 프로시저

---

# 10. 📰 시나리오
확정X)<br/>
![](img/flo.png)

---

# 11. 💬 팀회고

#### 🦊김진혁
> 시도하였던 것


> 좋았던 점


> 아쉬웠던 점

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


> 좋았던 점


> 아쉬웠던 점
