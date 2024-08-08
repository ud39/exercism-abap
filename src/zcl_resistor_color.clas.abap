CLASS zcl_resistor_color DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: get_resist_value IMPORTING iv_color               TYPE string
                              RETURNING VALUE(rv_resist_value) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RESISTOR_COLOR IMPLEMENTATION.


  METHOD get_resist_value.
    CASE iv_color.
      WHEN 'BLACK'.
        rv_resist_value = 0.
      WHEN 'BRAUN'.
        rv_resist_value = 1.
      WHEN 'ROT'.
        rv_resist_value = 2.
      WHEN 'ORANGE'.
        rv_resist_value = 3.
      WHEN 'GELP'.
        rv_resist_value = 4.
      WHEN 'GRÜN'.
        rv_resist_value = 5.
      WHEN 'BLAU'.
        rv_resist_value = 6.
      WHEN 'VIOLETT'.
        rv_resist_value = 7.
      WHEN 'GRAU'.
        rv_resist_value = 8.
      WHEN 'WEIß'.
        rv_resist_value = 9.
      WHEN OTHERS.
        rv_resist_value = 42.
    ENDCASE.
  ENDMETHOD.
ENDCLASS.
