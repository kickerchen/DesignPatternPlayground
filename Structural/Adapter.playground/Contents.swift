
/// Adapter
///  It allows the interface of an existing class to be used as another interface.
///  It is often used to make existing classes work with others without modifying their source code.
///
///  The adapter design pattern solves problems like:
///  - How can a class be reused that does not have an interface that a client requires?
///  - How can classes that have incompatible interfaces work together?
///  - How can an alternative interface be provided for a class?
///
///  An adapter allows two incompatible interfaces to work together.
///  This is the real-world definition for an adapter.
///  Interfaces may be incompatible, but the inner functionality should suit the need.
///  The adapter design pattern allows otherwise incompatible classes to work together by
///  converting the interface of one class into an interface expected by the clients.

enum MediaType {
    case mp3
    case mp4
    case VR
}

protocol Player {
    func play(mediaType: MediaType)
}

class Mp3Player: Player {
    func play(mediaType: MediaType) {
        if mediaType == .mp3 {
            print("Playing mp3 file")
        } else {
            // adapter
            PlayerAdapter().play(mediaType: mediaType)
        }
    }
}

class VRPlayer: Player {
    func play(mediaType: MediaType) {
        print("Playing VR file")
    }
}

class Mp4Player: Player {
    func play(mediaType: MediaType) {
        print("Playing mp4 file")
    }
}

class PlayerAdapter: Player {
    func play(mediaType: MediaType) {
        switch mediaType {
        case .mp4:
            Mp4Player().play(mediaType: mediaType)
        case .VR:
            VRPlayer().play(mediaType: mediaType)
        default:
            print("play nothing")
        }
    }
}

Mp3Player().play(mediaType: .VR)
