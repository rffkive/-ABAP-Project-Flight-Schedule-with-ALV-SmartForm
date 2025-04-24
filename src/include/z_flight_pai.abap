FORM get_data.
  DATA: lv_where TYPE string.

  IF p_carrid IS NOT INITIAL.
   lv_where = 'AND a~carrid = @p_carrid'.
  ENDIF.

  SELECT a~carrid, b~carrname, b~currcode,
         a~cityto, a~airpto, a~fltime,
         a~deptime, a~arrtime
      FROM spfli as a  
      INNER JOIN scarr as b
      ON a~carrid = b~carrid
      WHERE (lv_where)
      INTO CORRESPONDING FIELD OF TABLE @gt_flight.

  IF sy-subrc <> 0.
    MESSAGE 'NO FLIGHT DATA FOUND' TYPE 'S'
  ENDIF.
PERFORM.

