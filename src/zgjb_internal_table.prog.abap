*&--------------------------------------------------------------------*
*& Report zgjb_internal_table
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zgjb_internal_table.

TYPES group TYPE c LENGTH 1.
TYPES: BEGIN OF initial_type,
         group       TYPE group,
         number      TYPE i,
         description TYPE string,
       END OF initial_type,
       initial_data TYPE STANDARD TABLE OF initial_type WITH EMPTY KEY.

*DATA lt_initial_data TYPE initial_data.
*
*FIELD-SYMBOLS <fs_group> TYPE initial_type.
*APPEND INITIAL LINE TO lt_initial_data ASSIGNING <fs_group>.
*
*<fs_group>-group       = 'A'.
*<fs_group>-number      = 10.
*<fs_group>-description = 'Group A-2'.
*
*APPEND INITIAL LINE TO lt_initial_data ASSIGNING <fs_group>.
*
*<fs_group>-group       = 'B'.
*<fs_group>-number      = 5.
*<fs_group>-description = 'Group B'.

DATA gs_initial_type TYPE initial_type.
ASSIGN gs_initial_type TO FIELD-SYMBOL(<fs_group>).

<fs_group>-group       = 'Z'.
<fs_group>-description = 'ZGJB'.
<fs_group>-number      = '1337'.

DATA(go_zcl_itab_basic) = NEW zcl_itab_basic( ).
DATA(go_zcl_aggregated_itab) = NEW zcl_itab_aggregation( ).
DATA(go_zcl_combine_string_itab) = NEW zcl_itab_combine_string( ).
DATA(go_zcl_itab_nested) = NEW zcl_itab_nested( ).
DATA(go_zcl_twofer) = NEW zcl_twofer( ).
DATA gt_initial_data TYPE initial_data.

gt_initial_data = go_zcl_itab_basic->fill_itab( ).

gt_initial_data = go_zcl_itab_basic->add_to_itab( EXPORTING is_itab = <fs_group>
                                                  CHANGING  ct_itab = gt_initial_data ).

DATA(gv_reverse_string) = ZCL_STRING_REVERSE=>reverse_string( iv_string = '123' ).
DATA(gt_aggregated) = go_zcl_aggregated_itab->fill_aggregated_itab( it_itab = go_zcl_aggregated_itab->fill_itab( ) ).
DATA(gt_combined) = go_zcl_combine_string_itab->combine_items( ).
DATA(gt_nested) = go_zcl_itab_nested->create_nest_table( ).
DATA(gv_twofer) = go_zcl_twofer->twoforone( iv_name = 'Alice'  ).


BREAK-POINT.
