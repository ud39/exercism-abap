CLASS zcl_clock DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    METHODS constructor IMPORTING iv_hours   TYPE i
                                  iv_minutes TYPE i.
    METHODS add_minutes IMPORTING iv_minutes TYPE i.
    METHODS substract_minutes IMPORTING iv_minutes TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA mv_hours TYPE i.
    DATA mv_minutes TYPE i.
    METHODS calc_hours IMPORTING iv_minutes      TYPE i
                       RETURNING VALUE(rv_hours) TYPE i.
ENDCLASS.



CLASS ZCL_CLOCK IMPLEMENTATION.


  METHOD add_minutes.
    DATA(lv_temp_minutes) = mv_minutes.
    mv_minutes = ( mv_minutes + iv_minutes ) MOD 60.
    mv_hours = ( mv_hours + calc_hours( iv_minutes = iv_minutes ) ) MOD 24.
  ENDMETHOD.


  METHOD constructor.
    mv_hours = iv_hours MOD 24.
    mv_minutes = iv_minutes MOD 60.
  ENDMETHOD.


  METHOD substract_minutes.
    DATA(lv_temp_minutes) = mv_minutes.
    mv_minutes = ( mv_minutes + iv_minutes ) MOD 60.
    mv_hours = ( mv_hours - calc_hours( iv_minutes = iv_minutes ) ) MOD 24.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
    WRITE: | '{ mv_hours } { mv_minutes }' |.
  ENDMETHOD.


  METHOD calc_hours.
    DATA(lv_temp_minutes) = mv_minutes MOD 60.
    IF lv_temp_minutes <> 0. lv_temp_minutes = 60 - lv_temp_minutes. ENDIF.
    rv_hours = ( lv_temp_minutes + iv_minutes ) DIV 60.
  ENDMETHOD.
ENDCLASS.
