import 'package:dart_exercise_6/Music.dart';

// Crie uma classe e insira nela, no mínimo, dois atributos, os quais devem ter um método acessor (get) e um método modificador (set) para cada.

// Defina um objeto para cada atributo e elabore um construtor para criar alguma regra.


void main() {

  Music title1 = Music(
    145,
    'Frida',
    artist: 'Mike M.',
    albumName: 'Shadow',
    relaeseDate: '22/02/22',
    musicName: 'Oh My',
  );

  title1.newTime = 160;
  title1.newComposer = 'Alanis';

  print('\nArtist: ${title1.artist}\nAlbum: ${title1.albumName}\nDate Release: ${title1.relaeseDate}\nMusic: ${title1.musicName}\nSeconds: ${title1.timeOfMusic} sec\nComposer: ${title1.composer}');
}
