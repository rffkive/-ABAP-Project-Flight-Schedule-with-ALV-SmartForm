# ✈️ SAP GUI Project: Flight Schedule Status with SmartForm, Subroutine, and ALV Interaction

## 📌 Project Overview

This SAP GUI mini-project demonstrates core ABAP functionalities including **subroutines**, **custom screens**, **ALV Grid Display**, and **SmartForms**. It allows users to monitor airline flight status in real-time and perform actions based on flight timing.

---

## 🧱 Fields Used

| Field       | Description                         |
|-------------|-------------------------------------|
| STATUS      | Icon indicating flight status       |
| CURRCODE    | Local currency of airline           |
| CITYTO      | Arrival city                        |
| AIRPTO      | Destination airport                 |
| FLTIME      | Flight time                         |
| TIME        | Current system time (`SY-UZEIT`)    |
| DEPTIME     | Departure time                      |
| ARRTIME     | Arrival time                        |

---

## 🔁 Logic for STATUS Icon

The system processes each flight entry and assigns a `STATUS` icon using the following logic:
IF (DEPTIME - TIME) > 2 hours → Green Icon
IF (DEPTIME - TIME) < 0 hours → Red Icon 
IF 0 < (DEPTIME - TIME) < 2 hours → Yellow Icon

**Displayed Icons:**
- 🟢 Green = Flight Available
- 🟡 Yellow = Flight Waiting
- 🔴 Red = Flight Late

---

## 🖱️ User Commands

### 🎯 Button 1: Check Flight Status

- When the user selects a row and clicks **Button 1**:
  - If **Green** → `"Flight CARRID - CARRNAME is available"`
  - If **Yellow** → `"Flight CARRID - CARRNAME is waiting"`
  - If **Red** → `"Flight CARRID - CARRNAME is late"`
- Uses ALV `USER_COMMAND` event and `READ TABLE` to fetch row status.

### 💾 Button 2: Save Selected Flights

- When the user selects one or more rows using checkboxes and clicks **Button 2**:
  - The selected data is saved into a custom table: `ZTB_[YOURNAME]_EX2`.

#### 📥 Table Structure: `ZTB_[YOURNAME]_EX2`

| Field     | Description                    |
|-----------|--------------------------------|
| CARRID    | Airline Code                   |
| CARRNAME  | Airline Name                   |
| CURRCODE  | Local currency of airline      |
| CITYTO    | Arrival city                   |
| AIRPTO    | Destination airport            |
| FLTIME    | Flight time                    |
| TIME      | Current time                   |
| DEPTIME   | Departure time                 |
| ARRTIME   | Arrival time                   |

---

## 📄 SmartForm Integration

This project includes a SmartForm that prints selected flight information in a well-formatted layout.

The report includes:
- Airline Name & Code
- Route (From → To)
- Flight Time
- Departure & Arrival Time
- Current Status

---

## 🧮 Subroutines

ABAP subroutines (`FORM/ENDFORM`) are used to:
- Determine `STATUS`
- Populate the ALV grid
- Handle button click logic
- Format and pass data to SmartForm

---

## 🛠️ Tech Stack

- SAP GUI
- ABAP Programming
- ALV Grid Display (CL_GUI_ALV_GRID)
- SmartForms
- Subroutines
- Custom Table (Z-table)

---

## 📝 License

This project is for educational purposes. Feel free to fork and contribute!

