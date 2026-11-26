# taytaybot
A bot which draws on Taylor Swift concepts and lyrics to have deep and meaningful conversations with you

## Song catalog

`data/songs.json` (and `data/songs.csv`) list every released Taylor Swift song with its first album edition, year and a few short signature phrases, so replies can name the song and album a phrase came from. Full lyrics are intentionally not stored.

- `album_edition_first`: earliest album edition containing the song (deluxe editions count; Taylor's Version re-recordings are not counted again).
- `counts_toward_album_total`: `meta.album_song_total` (248 as of 2026-11-26) counts only these.
- `meta.phrases_pending`: songs still missing phrases.

Source: Wikipedia "List of songs by Taylor Swift".
