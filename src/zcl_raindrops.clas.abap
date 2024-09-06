CLASS zcl_raindrops DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    METHODS: check_raindrop IMPORTING iv_raindrop        TYPE i
                            RETURNING VALUE(rv_raindrop) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RAINDROPS IMPLEMENTATION.


  METHOD check_raindrop.
    IF iv_raindrop MOD 3 = 0. rv_raindrop = rv_raindrop && 'Pling'. ENDIF.
    IF iv_raindrop MOD 5 = 0. rv_raindrop = rv_raindrop && 'Plang'. ENDIF.
    IF iv_raindrop MOD 3 = 0. rv_raindrop = rv_raindrop && 'Plong'. ENDIF.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
    IF iv_input IS INITIAL.
      WRITE: | No raindrop |.
      RETURN.
    ENDIF.
      WRITE: | Raindrop: { check_raindrop( iv_raindrop = iv_input  ) } |.

  ENDMETHOD.
ENDCLASS.
