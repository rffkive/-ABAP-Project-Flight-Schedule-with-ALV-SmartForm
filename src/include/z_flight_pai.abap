FORM get_data.
  DATA: lv_where TYPE string.

  IF p_carrid IS NOT INITIAL.
   lv_where = 'a~carrid = @p_carrid'.
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

FORM display_data.
  TRY.
      DATA: lr_alv TYPE REF TO cl_salv_table.

      " Create ALV instance
      cl_salv_table=>factory(
        IMPORTING
          r_salv_table = lr_alv
        CHANGING
          t_table      = gt_flight ).

      " Basic settings
      lr_alv->get_functions( )->set_all( abap_true ).
      lr_alv->get_display_settings( )->set_striped_pattern( abap_true ).
      lr_alv->get_columns( )->set_optimize( abap_true ).

      " Set column titles if needed
      DATA(lr_columns) = lr_alv->get_columns( ).
      DATA(lr_column) = lr_columns->get_column( 'CARRID' ).
      lr_column->set_short_text( 'Airline' ).

      " Display the ALV
      lr_alv->display( ).

    CATCH cx_salv_msg INTO DATA(lx_error).
      MESSAGE lx_error->get_text( ) TYPE 'E'.
  ENDTRY.
ENDFORM.


