CLASS zcl_prime_factors DEFINITION
  public
  final
  create public.

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    METHODS: get_prime_factors IMPORTING iv_number               TYPE i
                               RETURNING VALUE(rv_prime_factors) TYPE string.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PRIME_FACTORS IMPLEMENTATION.


  METHOD get_prime_factors.
    DATA(lv_current_number) = iv_number.
    DATA(lv_current_divisor) = 2.
    WHILE lv_current_number <> 1.
      IF lv_current_number MOD lv_current_divisor = 0.
        rv_prime_factors = rv_prime_factors && ` ` && lv_current_divisor.
        lv_current_number = lv_current_number div lv_current_divisor.
      ELSE.
        lv_current_divisor = lv_current_divisor + 1.
      ENDIF.
    ENDWHILE.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
    IF iv_input IS INITIAL.
      WRITE | Input was empty |.
      RETURN.
    ENDIF.

    WRITE | The prime factors of { iv_input } are { get_prime_factors( iv_number = iv_input ) } |.

  ENDMETHOD.
ENDCLASS.
