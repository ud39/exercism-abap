CLASS zcl_twofer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: twoforone IMPORTING iv_name            TYPE string
                       RETURNING VALUE(rv_sentence) TYPE string.
    INTERFACES: if_oo_adt_classrun,
      zif_gjb_display.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TWOFER IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write( twoforone( iv_name = 'Bob' ) ).
  ENDMETHOD.


  METHOD twoforone.
    DATA lv_one TYPE string VALUE 'you'.
    IF iv_name IS NOT INITIAL. lv_one = iv_name. ENDIF.
    rv_sentence = | 'One for { lv_one }, one for me' |.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
    DATA i_solution TYPE string.
    IF iv_input IS INITIAL.
      i_solution = twoforone( '' ).
    ELSE.
      i_solution = twoforone( iv_name = iv_input  ).
    ENDIF.

    WRITE i_solution.
  ENDMETHOD.
ENDCLASS.
