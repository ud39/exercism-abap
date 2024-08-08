CLASS zcl_resistor_color DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES: zif_gjb_display.
    METHODS: get_resist_value IMPORTING iv_color               TYPE string
                              RETURNING VALUE(rv_resist_value) TYPE i,

             get_resist_value_switch IMPORTING iv_color        TYPE string
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


  METHOD get_resist_value_switch.
    rv_resist_value = SWITCH #( iv_color
                                WHEN 'BLACK'  THEN 0
                                WHEN 'BRAUN'  THEN 1
                                WHEN 'RED'    THEN 2
                                WHEN 'ORANGE' THEN 3
                                WHEN 'YELLOW' THEN 4
                                WHEN 'GREEN'  THEN 5
                                WHEN 'BLUE'   THEN 6
                                WHEN 'VIOLET' THEN 7
                                WHEN 'GREY'   THEN 8
                                WHEN 'WHITE'  THEN 9
                               ).
  ENDMETHOD.


  METHOD zif_gjb_display~display.
    IF iv_input IS INITIAL.
      WRITE: | 'No Input was given { iv_input } '  |.
    ENDIF.
    DATA(lv_resist_value) = get_resist_value_switch( iv_color = iv_input ).
    WRITE lv_resist_value.
  ENDMETHOD.
ENDCLASS.
