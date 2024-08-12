class ZCL_GRAINS definition
  public
  final
  create public .

public section.

  interfaces ZIF_GJB_DISPLAY .

  methods GET_NUMBER_OF_GRAINS
    importing
      !IV_TILE TYPE I DEFAULT 63
    returning
      value(RV_NUMBER_OF_GRAINS) type I .
protected section.
private section.
ENDCLASS.



CLASS ZCL_GRAINS IMPLEMENTATION.


  METHOD get_number_of_grains.
    IF iv_tile < 1 OR iv_tile > 64.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.
    rv_number_of_grains = 2 ** ( iv_tile - 1 ).
  ENDMETHOD.


  METHOD ZIF_GJB_DISPLAY~display.
    BREAK-POINT.

    IF iv_input IS INITIAL.
      WRITE | 'Input was empty' |.
      RETURN.
    ENDIF.
      WRITE | 'Number of grains on tile: { iv_input } is { GET_NUMBER_OF_GRAINS( iv_tile = iv_input ) } ' |.
  ENDMETHOD.
ENDCLASS.
