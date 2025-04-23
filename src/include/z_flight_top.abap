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

*-------------------------------------------------------------*
* ALV Grid Related Declarations
*-------------------------------------------------------------*
DATA: gt_fcat1    TYPE lvc_t_fcat,          " ALV Field catalog table
      gs_fcat1    LIKE LINE OF gt_fcat1,    " Field catalog work area
      gs_layout1  TYPE lvc_s_layo,          " ALV layout settings
      gs_variant1 TYPE disvariant.          " ALV display variant

DATA: custom1     TYPE REF TO cl_gui_custom_container, " ALV container (custom control)
      grid1       TYPE REF TO cl_gui_alv_grid.         " ALV grid instance

*-------------------------------------------------------------*
* Selection and Interaction Handling
*-------------------------------------------------------------*
DATA: gv_selindex TYPE i,              " Selected index from ALV
      gs_selrow   TYPE ty_flight.      " Data of selected row

DATA: gt_fcode    TYPE TABLE OF sy-ucomm, " Table of function codes (e.g. buttons)
      gs_fcode    LIKE LINE OF gt_fcode.  " Work area for single function code
