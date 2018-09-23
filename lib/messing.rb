song = "Thundercat - For Love I Come.mp3"
song_name_arr = song.split(" - ")
artist_name = song_name_arr[0]
song_name = song_name_arr[1].split(".mp3").join("")
p song_name
p artist_name
