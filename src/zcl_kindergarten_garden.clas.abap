CLASS zcl_kindergarten_garden DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    TYPES: BEGIN OF windows,
             first_row  TYPE char1,
             second_row TYPE char1,
           END OF windows.
    TYPES: windows_internal_table TYPE STANDARD TABLE OF windows WITH DEFAULT KEY.
    METHODS: fill_up_table IMPORTING iv_first_row      TYPE string
                                     iv_second_row     TYPE string
                           RETURNING VALUE(rt_flowers) TYPE windows_internal_table,
      whos_flowers IMPORTING iv_name            TYPE string
                             it_flowers_windows TYPE windows_internal_table
                   RETURNING VALUE(rt_flower_name)     TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_KINDERGARTEN_GARDEN IMPLEMENTATION.


  METHOD fill_up_table.
    FIELD-SYMBOLS <is_window_row> TYPE windows.
    DATA temp_window_row TYPE windows.
    ASSIGN temp_window_row TO <is_window_row>.
    DO strlen( iv_first_row ) TIMES.
      <is_window_row>-first_row = substring( val = iv_first_row len = 1 off = 0 ).
      <is_window_row>-second_row = substring( val = iv_second_row len = 1 off = 0 ).
      APPEND <is_window_row> TO rt_flowers.
      BREAK-POINT.
    ENDDO.
  ENDMETHOD.


  METHOD whos_flowers.
    "TODO Kinda horrendouse solution
    DATA(lv_pos) = find( val = sy-abcde sub = iv_name(1) ) * 2 + 1.
    DO 2 TIMES.
      DATA(lv_plant_first_row) = it_flowers_windows[ lv_pos ]-first_row.
      DATA(lv_plant_second_row) = it_flowers_windows[ lv_pos ]-second_row.
      CASE lv_plant_first_row.
        WHEN 'V'.
          APPEND 'violets' TO rt_flower_name.
        WHEN 'R'.
          APPEND 'radishes' TO rt_flower_name.
        WHEN 'G'.
          APPEND 'grass' TO rt_flower_name.
        WHEN 'C'.
          APPEND 'clover' TO rt_flower_name.
      ENDCASE.

      CASE lv_plant_second_row.
        WHEN 'V'.
          APPEND 'violets' TO rt_flower_name.
        WHEN 'R'.
          APPEND 'radishes' TO rt_flower_name.
        WHEN 'G'.
          APPEND 'grass' TO rt_flower_name.
        WHEN 'C'.
          APPEND 'clover' TO rt_flower_name.
      ENDCASE.
      lv_pos = lv_pos + 1.
    ENDDO.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.
ENDCLASS.
