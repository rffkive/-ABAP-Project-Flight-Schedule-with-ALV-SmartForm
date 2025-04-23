*&---------------------------------------------------------------------*
*& Report Z_FLIGHT
*&---------------------------------------------------------------------*
*& Description:
*&   This SAP ABAP report displays a list of flights using ALV Grid.
*&   It shows the current STATUS of flights (Green, Yellow, Red)
*&   based on the departure time and current time.
*&
*&   Users can:
*&   - View flight data along with a status icon
*&   - Click a button to check flight availability
*&   - Save selected flights to a custom table ZTB_[NAME]_EX2
*&
*&   The report uses modularization with includes:
*&     INCLUDE z_flight_top.  => Global Data Declarations
*&     INCLUDE z_flight_pai.  => User Command Logic (PAI)
*&     INCLUDE z_flight_pbo.  => Screen Setup Logic (PBO)
*&     INCLUDE z_flight_m01.  => Subroutines (Data Retrieval, Processing)
*&
*& Author: rffkive
*& Created On: 2025-04-21
*& Last Updated: 2025-04-21
*&---------------------------------------------------------------------*

REPORT z_flight.

INCLUDE z_flight_top.
INCLUDE z_flight_pai.
INCLUDE z_flight_pbo.
INCLUDE z_flight_m01.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_carrid TYPE s_carr_id.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.
  PERFORM get_data.
  PERFORM process_data.
  IF gt_flight IS NOT INITIAL.
    CALL SCREEN 0100.
  ELSE.
    MESSAGE 'NO RECORDS FOUND' TYPE i.
    LEAVE PROGRAM.
  ENDIF.
END-OF-SELECTION.
