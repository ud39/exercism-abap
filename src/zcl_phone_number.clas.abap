CLASS zcl_phone_number DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    METHODS correct_phone_number_nanp IMPORTING iv_phone_number        TYPE string
                                      RETURNING VALUE(rv_phone_number) TYPE string
                                      RAISING   cx_parameter_invalid.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PHONE_NUMBER IMPLEMENTATION.


  METHOD correct_phone_number_nanp.
    DATA(lv_phone_number) = replace( val = iv_phone_number pcre = '\W+' with = '' occ = 0 ).
    CONDENSE lv_phone_number NO-GAPS.

    DATA(lv_length_phone_number) = strlen( lv_phone_number ).

    IF lv_length_phone_number > 11 OR lv_length_phone_number <= 9
       AND ( lv_length_phone_number = 1 AND lv_phone_number(1) <> '1' ).
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    IF count( val = lv_phone_number pcre = `[^\d]` ) > 0.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.
ENDCLASS.
