# taytaybot
A bot which draws on Taylor Swift concepts and lyrics to have deep and meaningful conversations with you

## Song catalog

`data/songs.json` (and `data/songs.csv`) list every released Taylor Swift song with its first album, year and a few short signature phrases, so replies can name the song and album a phrase came from. Full lyrics are intentionally not stored.

- `first_album`: album the song first appeared on, with deluxe, bonus and reissue editions grouped under it (null for non-album songs); re-recordings keep their original album.
- `counts_toward_album_total`: `meta.album_song_total` (248 as of 2026-11-26) counts only these.
- `meta.phrases_pending`: songs still missing phrases.

Source: Wikipedia "List of songs by Taylor Swift".
