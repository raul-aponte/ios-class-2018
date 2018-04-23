import Foundation

class Settings {
    private static let currentUserKey = "currentUser"

    public static var currentUser: String? {
        get {
            let defaults = UserDefaults.standard
            return defaults.string(forKey: currentUserKey)
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: currentUserKey)
        }
    }
}
