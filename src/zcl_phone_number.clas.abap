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

    IF lv_length_phone_number = 10.
      DATA(lv_plan_code) = lv_phone_number(3).
      DATA(lv_exchange_code) = lv_phone_number+3(7).
    ELSEIF lv_length_phone_number = 11.
      lv_plan_code = lv_phone_number+1(3).
      lv_exchange_code = lv_phone_number+4(7).
    ENDIF.

    IF lv_plan_code CO '01' OR lv_exchange_code CO '01'.
      RAISE EXCEPTION TYPE cx_parameter_invalid.
    ENDIF.

    IF lv_length_phone_number = 11 AND lv_phone_number(1) = '1'.
      lv_length_phone_number = lv_length_phone_number - 1.
      lv_phone_number = lv_phone_number+1(lv_length_phone_number).
    ENDIF.
    rv_phone_number = lv_phone_number.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.
ENDCLASS.
