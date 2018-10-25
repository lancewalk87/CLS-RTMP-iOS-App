//
//  UserDefaults.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 8/29/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

public extension UserDefaults {
    public class storageKeys {
        static let isFirstLaunch:       String = "isFirstLaunch";
        static let userCredentials:     String = "userCredentials";
    }
    
    // MARK: - Getters
    func hasValue(forStorageKey: String) -> Bool {
        return nil != object(forKey: forStorageKey);
    }
    
    // MARK: - Setters
    func number(forKey key: String) -> NSNumber? {
        return object(forKey: key) as? NSNumber
    }

    class Storage {
        private let defaults:       UserDefaults;
        private let storageKey:     String;
        
        init (_ defaults: UserDefaults, _ storageKey: String) {
            self.defaults       = defaults;
            self.storageKey     = storageKey;
        }
        
        // MARK: - Key Storage Types
        var typeOfString: String? {
            return defaults.string(forKey: storageKey);
        }
        
        var typeOfInt: Int? {
            return defaults.integer(forKey: storageKey);
        }
        
        var typeOfBool: Bool {
            return defaults.number(forKey: storageKey)?.boolValue ?? false;
        }
    }
    
    subscript(getterKey: String) -> Storage {
        return Storage(self, getterKey);
    }
}










// =======================
//    static let userHasLoggedIn = DefaultsKey<String?>("isInitialLoad");
//    static let username = DefaultsKey<String?>("loggedUserData");

//public let Defaults = UserDefaults.standard
//
//public extension UserDefaults {
//    func hasKey<T>(_ key: DefaultsKey<T>) -> Bool {
//        return object(forKey: key._key) != nil
//    }
//    
//    func remove<T>(_ key: DefaultsKey<T>) {
//        removeObject(forKey: key._key)
//    }
//    
//    public func removeAll() {
//        for (key, _) in dictionaryRepresentation() {
//            removeObject(forKey: key)
//        }
//    }
//}
//
//internal extension UserDefaults {
//    func number(forKey key: String) -> NSNumber? {
//        return object(forKey: key) as? NSNumber
//    }
//    
//    func decodable<T: Decodable>(forKey key: String) -> T? {
//        guard let decodableData = data(forKey: key) else { return nil }
//        
//        return try? JSONDecoder().decode(T.self, from: decodableData)
//    }
//    
//    func set<T: Encodable>(encodable: T, forKey key: String) {
//        let encoder = JSONEncoder()
//        if let data = try? encoder.encode(encodable) {
//            set(data, forKey: key)
//        } else {
//            assertionFailure("Encodable \(T.self) is not _actually_ encodable to any data...Please fix 😭")
//        }
//    }
//}
//
//public extension UserDefaults {
//    
//    subscript<T: DefaultsSerializable>(key: DefaultsKey<T?>) -> T? {
//        get {
//            return T.get(key: key._key, userDefaults: self) ?? key.defaultValue as? T
//        }
//        set {
//            T.save(key: key._key, value: newValue, userDefaults: self)
//        }
//    }
//    
//    subscript<T: DefaultsSerializable>(key: DefaultsKey<T?>) -> T? where T: DefaultsDefaultValueType {
//        get {
//            return T.get(key: key._key, userDefaults: self) ?? key.defaultValue ?? T.defaultValue
//        }
//        set {
//            T.save(key: key._key, value: newValue, userDefaults: self)
//        }
//    }
//    
//    subscript<T: DefaultsSerializable>(key: DefaultsKey<T?>) -> T? where T: Collection, T.Element: DefaultsDefaultArrayValueType {
//        get {
//            return T.get(key: key._key, userDefaults: self) ?? key.defaultValue ?? T.Element.defaultArrayValue as? T
//        }
//        set {
//            T.save(key: key._key, value: newValue, userDefaults: self)
//        }
//    }
//    
//    subscript<T: DefaultsSerializable>(key: DefaultsKey<T>) -> T where T: DefaultsDefaultValueType {
//        get {
//            return T.get(key: key._key, userDefaults: self) ?? key.defaultValue ?? T.defaultValue
//        }
//        set {
//            T.save(key: key._key, value: newValue, userDefaults: self)
//        }
//    }
//    
//    subscript<T: DefaultsSerializable>(key: DefaultsKey<T>) -> T where T: Collection, T.Element: DefaultsDefaultArrayValueType {
//        get {
//            // There _must_ be a value: you can't create a key without a default value in type or in the key itself
//            return T.get(key: key._key, userDefaults: self) ?? key.defaultValue ?? T.Element.defaultArrayValue as! T // swiftlint:disable:this force_cast
//        }
//        set {
//            T.save(key: key._key, value: newValue, userDefaults: self)
//        }
//    }
//    
//    subscript<T: DefaultsSerializable>(key: DefaultsKey<T>) -> T {
//        get {
//            if let value = T.get(key: key._key, userDefaults: self) {
//                return value
//            } else if let defaultValue = key.defaultValue {
//                return defaultValue
//            } else {
//                fatalError("Shouldn't really happen, `DefaultsKey` can be initialized only with defaultValue or with a type that conforms to `DefaultsDefaultValueType`.")
//            }
//        }
//        set {
//            T.save(key: key._key, value: newValue, userDefaults: self)
//        }
//    }
//}
