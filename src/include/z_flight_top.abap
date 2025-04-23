*&---------------------------------------------------------------------*
*& Include           Z_FLIGHT_TOP
*& Purpose           Global data and type declarations for Z_FLIGHT
*&---------------------------------------------------------------------*

*-------------------------------------------------------------*
* Tables declaration: Access to airline and flight schedule data
*-------------------------------------------------------------*
TABLES: scarr,    " Airline master data
        spfli.    " Flight schedule data

*-------------------------------------------------------------*
* Structure Definition for Flight Display Data
*-------------------------------------------------------------*
TYPES: BEGIN OF ty_flight,
         carrid   TYPE s_carr_id,     " Airline ID
         carrname TYPE s_carrname,    " Airline name
         status   TYPE icon_d,        " Icon for flight status
         currcode TYPE s_currcode,    " Currency
         cityto   TYPE s_to_city,     " Arrival city
         airpto   TYPE s_toairp,      " Destination airport
         fltime   TYPE s_fltime,      " Flight time (minutes)
         time     TYPE sy-uzeit,      " Current system time
         deptime  TYPE s_dep_time,    " Scheduled departure time
         arrtime  TYPE s_arr_time,    " Scheduled arrival time
       END OF ty_flight.

*-------------------------------------------------------------*
* Global Data Declarations
*-------------------------------------------------------------*
DATA: gt_flight TYPE TABLE OF ty_flight, " Internal table for flight list
      gs_flight TYPE ty_flight.          " Work area for single flight
