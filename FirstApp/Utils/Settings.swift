import Foundation

class Settings {
    private static let userMailKey = "currentUserEmail"

    public static var userMail: String? {
        get {
            let defaults = UserDefaults.standard
            return defaults.string(forKey: userMailKey)
        }
        set {
            let defaults = UserDefaults.standard
            defaults.set(newValue, forKey: userMailKey)
        }
    }
}
