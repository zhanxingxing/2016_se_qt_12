import VPlay 2.0
import QtQuick 2.0

Item {
    id: audio
    property int idMUSIC: 11
    property int idSTOP: 22
    function play(clipID) {
        switch (clipID) {
        case idMUSIC:
            music.play()
            break
        case idSTOP:
            stop.play()
            break
        }
    }
    SoundEffectVPlay {
        id: music
        source: "../../assets/audio/sfx_die.wav"
    }
}
