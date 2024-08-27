class ZCL_HAMMING definition
  public
  final
  create public .

public section.
  INTERFACES: zif_gjb_display.
  METHODS: calc_hamming_distance IMPORTING it_vaues TYPE REF TO string_table
                                 RETURNING VALUE(rv_distance) TYPE i.
protected section.
private section.
ENDCLASS.



CLASS ZCL_HAMMING IMPLEMENTATION.


  METHOD calc_hamming_distance.
  ENDMETHOD.


  METHOD zif_gjb_display~display.
  ENDMETHOD.
ENDCLASS.
