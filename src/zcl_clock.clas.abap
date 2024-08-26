class ZCL_CLOCK definition
  public
  final
  create public .

public section.
  INTERFACES: zif_gjb_display.
  METHODS constructor IMPORTING iv_hours TYPE i
                                iv_minutes TYPE i.
  METHODS add_minutes IMPORTING iv_minutes TYPE i.
  METHODS substract_minutes IMPORTING iv_minutes TYPE i.
protected section.
private section.
  DATA mv_hours TYPE i.
  DATA mv_minutes TYPE i.
ENDCLASS.



CLASS ZCL_CLOCK IMPLEMENTATION.


  METHOD add_minutes.
    DATA(lv_temp_minutes) = mv_minutes.
    mv_minutes = ( mv_minutes + iv_minutes ) mod 60.
    IF mv_minutes <= lv_temp_minutes.
      mv_hours = ( mv_hours + 1 ) mod 24.
    ENDIF.
  ENDMETHOD.


  METHOD constructor.
    mv_hours = iv_hours.
    mv_minutes = iv_minutes.
  ENDMETHOD.


  METHOD substract_minutes.
    DATA(lv_temp_minutes) = mv_minutes.
    mv_minutes = ( mv_minutes + iv_minutes ) mod 60.
    IF mv_minutes >= lv_temp_minutes.
      mv_hours = ( mv_hours - 1 ) mod 24.
    ENDIF.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
    WRITE: | '{ mv_hours } { mv_minutes }' |.
  ENDMETHOD.
ENDCLASS.
