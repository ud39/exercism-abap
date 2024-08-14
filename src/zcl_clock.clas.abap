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

  ENDMETHOD.


  METHOD constructor.
    mv_hours = iv_hours.
    mv_minutes = iv_minutes.
  ENDMETHOD.


  METHOD substract_minutes.

  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.
ENDCLASS.
