CLASS zcl_itab_nested DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF artists_type,
             artist_id    TYPE string,
             artists_name TYPE string,
           END OF artists_type.
    TYPES artists TYPE STANDARD TABLE OF artists_type WITH KEY artist_id.

    TYPES: BEGIN OF album_type,
             artist_id  TYPE string,
             album_id   TYPE string,
             album_name TYPE string,
           END OF album_type.
    TYPES albums TYPE STANDARD TABLE OF album_type WITH KEY artist_id album_id.

    TYPES: BEGIN OF songs_type,
             artist_id TYPE string,
             album_id  TYPE string,
             song_id   TYPE string,
             song_name TYPE string,
           END OF songs_type.
    TYPES songs TYPE STANDARD TABLE OF songs_type WITH KEY artist_id album_id song_id.

    TYPES: BEGIN OF song_nested_type,
             song_id   TYPE string,
             song_name TYPE string,
           END OF song_nested_type.
    TYPES: BEGIN OF album_song_nested_type,
             album_id   TYPE string,
             album_name TYPE string,
             songs      TYPE STANDARD TABLE OF song_nested_type WITH KEY song_Id,
           END OF album_song_nested_type.
    TYPES: BEGIN OF artist_album_nested_type,
             artist_id   TYPE string,
             artist_name TYPE string,
             albums      TYPE STANDARD TABLE OF album_song_nested_type WITH KEY album_id,
           END OF artist_album_nested_type.
    TYPES nested_data TYPE STANDARD TABLE OF artist_album_nested_type WITH KEY artist_id.

    METHODS fill_table
      EXPORTING et_artist TYPE artists
                et_album  TYPE albums
                et_songs  TYPE songs.

    METHODS create_nest_table
      CHANGING  it_artist             TYPE artists OPTIONAL
                it_album              TYPE albums OPTIONAL
                it_songs              TYPE songs OPTIONAL
      RETURNING VALUE(rt_nested_data) TYPE nested_data.
ENDCLASS.



CLASS ZCL_ITAB_NESTED IMPLEMENTATION.


  METHOD fill_table.
    et_artist = VALUE #(
        (  artist_id = 1 artists_name = 'Godsmack' )
        (  artist_id = 2 artists_name = 'Shinedown' )
     ).

    et_album = VALUE #(
        (  artist_id = 1 album_id = 1 album_name = 'Faceless')
        (  artist_id = 1 album_id = 2 album_name = 'When legends Rise')
        (  artist_id = 2 album_id = 1 album_name = 'The Sound of Madness')
        (  artist_id = 1 album_id = 1 album_name = 'Planet Zero')
     ).

    et_songs = VALUE #(
        (  artist_id = 1 album_id = 1 song_id = 1 song_name = 'Straight Out of Line')
        (  artist_id = 1 album_id = 1 song_id = 2 song_name = 'Changes')
        (  artist_id = 1 album_id = 2 song_id = 1 song_name = 'Bullet proof')
        (  artist_id = 1 album_id = 2 song_id = 2 song_name = 'Under your Scars')
        (  artist_id = 2 album_id = 1 song_id = 1 song_name = 'Second Chance')
        (  artist_id = 2 album_id = 1 song_id = 2 song_name = 'Breaking Inside')
        (  artist_id = 2 album_id = 2 song_id = 1 song_name = 'Dysfunctional You')
        (  artist_id = 2 album_id = 2 song_id = 2 song_name = 'Daylight')
     ).
  ENDMETHOD.


  METHOD create_nest_table.

    fill_table(
      IMPORTING
        et_artist = it_artist
        et_album  = it_album
        et_songs  = it_songs
    ).

    DATA lt_nested_data TYPE nested_data.
    DATA lt_albums TYPE STANDARD TABLE OF album_song_nested_type WITH EMPTY KEY.
    DATA lt_songs TYPE STANDARD TABLE OF song_nested_type WITH EMPTY KEY.

    LOOP AT it_artist INTO DATA(ls_artist).
      CLEAR lt_albums.

      LOOP AT it_album INTO DATA(ls_album) WHERE artist_id = ls_artist-artist_id.
        CLEAR lt_songs.

        LOOP AT it_songs INTO DATA(ls_song) WHERE album_id = ls_album-album_id.
          APPEND VALUE #( song_id = ls_song-song_id song_name = ls_song-song_name ) TO lt_songs.
        ENDLOOP.

        APPEND VALUE #( album_id = ls_album-album_id
                        album_name = ls_album-album_name
                        songs      = lt_songs ) TO lt_albums.
      ENDLOOP.

      APPEND VALUE #( artist_id   = ls_artist-artist_id
                      artist_name = ls_artist-artists_name
                      albums      = lt_albums ) TO lt_nested_data.
    ENDLOOP.

    rt_nested_data = lt_nested_data.
    BREAK DEVELOPER.
  ENDMETHOD.
ENDCLASS.
