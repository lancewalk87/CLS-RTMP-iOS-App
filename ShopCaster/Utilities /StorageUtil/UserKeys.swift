//
//  UserKeys.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 9/10/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//




// MARK: - Storage Keys
//open class DefaultsKeys {
//    fileprivate init() {
//
//    }
//}
//
//extension DefaultsKeys {
//    static let userHasLoggedIn = DefaultsKey<String?>("isInitialLoad");
//    static let username = DefaultsKey<String?>("loggedUserData");
//}
//
//// MARK: - Dynamic Storage Keys
//open class DefaultsKey<ValueType: DefaultsSerializable>: DefaultsKeys {
//
//    public let _key: String
//    internal let defaultValue: ValueType?
//
//    public init(_ key: String, defaultValue: ValueType) {
//        self._key = key
//        self.defaultValue = defaultValue
//    }
//
//    // Couldn't figure out a way of how to pass a nil/none value from extension, thus this initializer.
//    // Used for creating an optional key (without defaultValue)
//    private init(key: String) {
//        self._key = key
//        self.defaultValue = nil
//    }
//
//    @available(*, unavailable, message: "This key needs a default value, either using an argument or a type with implemented `defaultValue`. If this type does not have a default value, consider using an optional key.")
//    public init(_ key: String) {
//        fatalError()
//    }
//}
//
//extension DefaultsKey where ValueType: Collection, ValueType.Element: DefaultsSerializable {
//
//    @available(*, unavailable, message: "Even though element of this array has a default value, the whole array doesnt and so you need to either pass it via argument or in extension.")
//    public convenience init(_ key: String) {
//        fatalError()
//    }
//}
//
//public extension DefaultsKey where ValueType: DefaultsSerializable, ValueType: OptionalType, ValueType.Wrapped: DefaultsSerializable {
//
//    convenience init(_ key: String) {
//        self.init(key);
//    }
//}
//
//public extension DefaultsKey where ValueType: DefaultsDefaultValueType {
//
//    convenience init(_ key: String) {
//        self.init(key);
//    }
//}
//
//public extension DefaultsKey where ValueType: Collection, ValueType.Element: DefaultsDefaultArrayValueType, ValueType.Element: DefaultsSerializable {
//
//    convenience init(_ key: String) {
//        self.init(key);
//    }
//}
//
//extension Optional: DefaultsSerializable where Wrapped: DefaultsSerializable {
//
//    public static func get(key: String, userDefaults: UserDefaults) -> Wrapped?? {
//        return Wrapped.get(key: key, userDefaults: userDefaults)
//    }
//
//    public static func getArray(key: String, userDefaults: UserDefaults) -> [Wrapped?]? {
//        return Wrapped.getArray(key: key, userDefaults: userDefaults)
//    }
//
//    public static func save(key: String, value: Wrapped??, userDefaults: UserDefaults) {
//        if let _value = value, let value = _value {
//            Wrapped.save(key: key, value: value, userDefaults: userDefaults)
//        } else {
//            Wrapped.save(key: key, value: nil, userDefaults: userDefaults)
//        }
//    }
//
//    public static func saveArray(key: String, value: [Wrapped?], userDefaults: UserDefaults) {
//        Wrapped.saveArray(key: key, value: value.compactMap { $0 }, userDefaults: userDefaults)
//    }
//}
//
//
//// MARK: - Storage Protocols
//public typealias DefaultsSerializable = DefaultsStoreable & DefaultsGettable
//
//public protocol DefaultsStoreable {
//    static func save(key: String, value: Self?, userDefaults: UserDefaults)
//    static func saveArray(key: String, value: [Self], userDefaults: UserDefaults)
//}
//
//public protocol DefaultsGettable {
//    static func get(key: String, userDefaults: UserDefaults) -> Self?
//    static func getArray(key: String, userDefaults: UserDefaults) -> [Self]?
//}
//
//public protocol DefaultsDefaultValueType {
//    static var defaultValue: Self { get }
//}
//
//public protocol DefaultsDefaultArrayValueType {
//    static var defaultArrayValue: [Self] { get }
//}
//
//// MARK: - Optional
//public protocol OptionalType {
//    associatedtype Wrapped
//    var wrapped: Wrapped? { get }
//}
//
//extension Optional: OptionalType {
//
//    public var wrapped: Wrapped? {
//        return self
//    }
//}
//
//// MARK: - User Storage Data Formats
//extension String: DefaultsSerializable, DefaultsDefaultArrayValueType, DefaultsDefaultValueType {
//
//    public static var defaultValue: String = ""
//    public static var defaultArrayValue: [String] = []
//
//    public static func get(key: String, userDefaults: UserDefaults) -> String? {
//        return userDefaults.string(forKey: key)
//    }
//
//    public static func getArray(key: String, userDefaults: UserDefaults) -> [String]? {
//        return userDefaults.array(forKey: key) as? [String]
//    }
//
//    public static func save(key: String, value: String?, userDefaults: UserDefaults) {
//        userDefaults.set(value, forKey: key)
//    }
//
//    public static func saveArray(key: String, value: [String], userDefaults: UserDefaults) {
//        userDefaults.set(value, forKey: key)
//    }
//}
//
//extension Int: DefaultsSerializable, DefaultsDefaultArrayValueType, DefaultsDefaultValueType {
//
//    public static var defaultValue: Int = 0
//    public static var defaultArrayValue: [Int] = []
//
//    public static func get(key: String, userDefaults: UserDefaults) -> Int? {
//        return userDefaults.number(forKey: key)?.intValue
//    }
//
//    public static func getArray(key: String, userDefaults: UserDefaults) -> [Int]? {
//        return userDefaults.array(forKey: key) as? [Int]
//    }
//
//    public static func save(key: String, value: Int?, userDefaults: UserDefaults) {
//        userDefaults.set(value, forKey: key)
//    }
//
//    public static func saveArray(key: String, value: [Int], userDefaults: UserDefaults) {
//        userDefaults.set(value, forKey: key)
//    }
//}
//
//extension Double: DefaultsSerializable, DefaultsDefaultArrayValueType, DefaultsDefaultValueType {
//
//    public static var defaultValue: Double = 0.0
//    public static var defaultArrayValue: [Double] = []
//
//    public static func get(key: String, userDefaults: UserDefaults) -> Double? {
//        return userDefaults.number(forKey: key)?.doubleValue
//    }
//
//    public static func getArray(key: String, userDefaults: UserDefaults) -> [Double]? {
//        return userDefaults.array(forKey: key) as? [Double]
//    }
//
//    public static func save(key: String, value: Double?, userDefaults: UserDefaults) {
//        userDefaults.set(value, forKey: key)
//    }
//
//    public static func saveArray(key: String, value: [Double], userDefaults: UserDefaults) {
//        userDefaults.set(value, forKey: key)
//    }
//}
//
//extension Bool: DefaultsSerializable, DefaultsDefaultArrayValueType, DefaultsDefaultValueType {
//
//    public static var defaultValue: Bool = false
//    public static var defaultArrayValue: [Bool] = []
//
//    public static func get(key: String, userDefaults: UserDefaults) -> Bool? {
//        return userDefaults.number(forKey: key)?.boolValue
//    }
//
//    public static func getArray(key: String, userDefaults: UserDefaults) -> [Bool]? {
//        return userDefaults.array(forKey: key) as? [Bool]
//    }
//
//    public static func save(key: String, value: Bool?, userDefaults: UserDefaults) {
//        userDefaults.set(value, forKey: key)
//    }
//
//    public static func saveArray(key: String, value: [Bool], userDefaults: UserDefaults) {
//        userDefaults.set(value, forKey: key)
//    }
//}
//
//extension Data: DefaultsSerializable, DefaultsDefaultArrayValueType, DefaultsDefaultValueType {
//
//    public static var defaultValue: Data = Data()
//    public static var defaultArrayValue: [Data] = []
//
//    public static func get(key: String, userDefaults: UserDefaults) -> Data? {
//        return userDefaults.data(forKey: key)
//    }
//
//    public static func getArray(key: String, userDefaults: UserDefaults) -> [Data]? {
//        return userDefaults.array(forKey: key) as? [Data]
//    }
//
//    public static func save(key: String, value: Data?, userDefaults: UserDefaults) {
//        userDefaults.set(value, forKey: key)
//    }
//
//    public static func saveArray(key: String, value: [Data], userDefaults: UserDefaults) {
//        userDefaults.set(value, forKey: key)
//    }
//}
//
//extension Date: DefaultsSerializable {
//
//    public static func get(key: String, userDefaults: UserDefaults) -> Date? {
//        return userDefaults.object(forKey: key) as? Date
//    }
//
//    public static func getArray(key: String, userDefaults: UserDefaults) -> [Date]? {
//        return userDefaults.array(forKey: key) as? [Date]
//    }
//
//    public static func save(key: String, value: Date?, userDefaults: UserDefaults) {
//        userDefaults.set(value, forKey: key)
//    }
//
//    public static func saveArray(key: String, value: [Date], userDefaults: UserDefaults) {
//        userDefaults.set(value, forKey: key)
//    }
//}
//extension URL: DefaultsSerializable {
//
//    public static func get(key: String, userDefaults: UserDefaults) -> URL? {
//        return userDefaults.url(forKey: key)
//    }
//
//    public static func getArray(key: String, userDefaults: UserDefaults) -> [URL]? {
//        return userDefaults.data(forKey: key).flatMap(NSKeyedUnarchiver.unarchiveObject) as? [URL]
//    }
//
//    public static func save(key: String, value: URL?, userDefaults: UserDefaults) {
//        userDefaults.set(value, forKey: key)
//    }
//
//    public static func saveArray(key: String, value: [URL], userDefaults: UserDefaults) {
//        userDefaults.set(NSKeyedArchiver.archivedData(withRootObject: value), forKey: key)
//    }
//}
//
//extension Array: DefaultsSerializable where Element: DefaultsSerializable {
//
//    public static func get(key: String, userDefaults: UserDefaults) -> [Element]? {
//        return Element.getArray(key: key, userDefaults: userDefaults)
//    }
//
//    public static func getArray(key: String, userDefaults: UserDefaults) -> [[Element]]? {
//        return [Element].getArray(key: key, userDefaults: userDefaults)
//    }
//
//    public static func save(key: String, value: [Element]?, userDefaults: UserDefaults) {
//        guard let value = value else {
//            userDefaults.removeObject(forKey: key)
//            return
//        }
//
//        Element.saveArray(key: key, value: value, userDefaults: userDefaults)
//    }
//
//    public static func saveArray(key: String, value: [[Element]], userDefaults: UserDefaults) {
//        [Element].saveArray(key: key, value: value, userDefaults: userDefaults)
//    }
//}
//
//extension DefaultsStoreable where Self: Encodable {
//
//    public static func saveArray(key: String, value: [Self], userDefaults: UserDefaults) {
//        userDefaults.set(encodable: value, forKey: key)
//    }
//
//    public static func save(key: String, value: Self?, userDefaults: UserDefaults) {
//        guard let value = value else {
//            userDefaults.removeObject(forKey: key)
//            return
//        }
//
//        userDefaults.set(encodable: value, forKey: key)
//    }
//}
//
//extension DefaultsGettable where Self: Decodable {
//
//    public static func getArray(key: String, userDefaults: UserDefaults) -> [Self]? {
//        return userDefaults.decodable(forKey: key) as [Self]?
//    }
//
//    public static func get(key: String, userDefaults: UserDefaults) -> Self? {
//        return userDefaults.decodable(forKey: key) as Self?
//    }
//}
//
//extension DefaultsGettable where Self: NSCoding {
//
//    public static func get(key: String, userDefaults: UserDefaults) -> Self? {
//        return userDefaults.data(forKey: key).flatMap(NSKeyedUnarchiver.unarchiveObject) as? Self
//    }
//
//    public static func getArray(key: String, userDefaults: UserDefaults) -> [Self]? {
//        return userDefaults.data(forKey: key).flatMap(NSKeyedUnarchiver.unarchiveObject) as? [Self]
//    }
//}
//
//extension DefaultsStoreable where Self: NSCoding {
//
//    public static func save(key: String, value: Self?, userDefaults: UserDefaults) {
//        guard let value = value else {
//            userDefaults.removeObject(forKey: key)
//            return
//        }
//
//        userDefaults.set(NSKeyedArchiver.archivedData(withRootObject: value), forKey: key)
//    }
//
//    public static func saveArray(key: String, value: [Self], userDefaults: UserDefaults) {
//        userDefaults.set(NSKeyedArchiver.archivedData(withRootObject: value), forKey: key)
//    }
//}
//
//extension DefaultsGettable where Self: RawRepresentable {
//
//    public static func get(key: String, userDefaults: UserDefaults) -> Self? {
//        return userDefaults.object(forKey: key).flatMap { Self(rawValue: $0 as! Self.RawValue) }
//    }
//
//    public static func getArray(key: String, userDefaults: UserDefaults) -> [Self]? {
//        return userDefaults.array(forKey: key)?.compactMap { Self(rawValue: $0 as! Self.RawValue) }
//    }
//}
//
//extension DefaultsStoreable where Self: RawRepresentable {
//
//    public static func save(key: String, value: Self?, userDefaults: UserDefaults) {
//        guard let value = value?.rawValue else {
//            userDefaults.removeObject(forKey: key)
//            return
//        }
//
//        userDefaults.set(value, forKey: key)
//    }
//
//    public static func saveArray(key: String, value: [Self], userDefaults: UserDefaults) {
//        let raw = value.map { $0.rawValue }
//
//        userDefaults.set(raw, forKey: key)
//    }
//}
