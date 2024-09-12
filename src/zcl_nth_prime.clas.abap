CLASS zcl_nth_prime DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC GLOBAL FRIENDS ZCL_PRIME_FACTORS.

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    METHODS get_nth_prime IMPORTING iv_nth_prime_number        TYPE i
                          RETURNING VALUE(rv_nth_prime_number) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS check_prime IMPORTING iv_number          TYPE i
                        RETURNING VALUE(rv_is_prime) TYPE abap_bool.
ENDCLASS.



CLASS ZCL_NTH_PRIME IMPLEMENTATION.


  METHOD get_nth_prime.
    IF iv_nth_prime_number = 1. rv_nth_prime_number = 2. RETURN. ENDIF.
    IF iv_nth_prime_number = 2. rv_nth_prime_number = 3. RETURN. ENDIF.
    DATA(lv_nth_prime_number) = 5.
    DATA(lv_current_iteration) = iv_nth_prime_number - 2.
    WHILE lv_current_iteration <> 0.
      IF check_prime( lv_nth_prime_number ).
        lv_current_iteration = lv_current_iteration - 1.
        IF lv_current_iteration = 0. CONTINUE. ENDIF.
        lv_nth_prime_number = lv_nth_prime_number + 1.
      ELSE.
        lv_nth_prime_number = lv_nth_prime_number + 1.
      ENDIF.
    ENDWHILE.
    rv_nth_prime_number = lv_nth_prime_number.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.


METHOD check_prime.
  DATA: lv_sqrt TYPE i,
        lv_divisor TYPE i.

  " Check divisibility by 2 and 3 first
  IF iv_number MOD 2 = 0 OR iv_number MOD 3 = 0.
    rv_is_prime = ''. " Not prime
    RETURN.
  ENDIF.

  " Check for factors from 5 to sqrt(iv_number)
  lv_sqrt = sqrt( iv_number ).
  lv_divisor = 5.

  WHILE lv_divisor <= lv_sqrt.
    IF iv_number MOD lv_divisor = 0 OR iv_number MOD ( lv_divisor + 2 ) = 0.
      rv_is_prime = ''. " Not prime
      RETURN.
    ENDIF.
    lv_divisor = lv_divisor + 6. " skip 1,2 .. 5 because those are definitely not prime
  ENDWHILE.

  rv_is_prime = 'X'.
ENDMETHOD.
ENDCLASS.
