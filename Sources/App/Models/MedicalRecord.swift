import FluentSQLite
import Vapor
import Foundation

protocol MedicalRecordProtocol {
    var systolicDiastolic: String { set get }
    var heartRate: String { set get }
    var spo2: String { set get }
    var temperature: String { set get }
}

/// A single entry of a MedicalRecord list.
final class MedicalRecord: MedicalRecordProtocol, SQLiteUUIDModel {
    var id: UUID?

    var systolicDiastolic: String
    var heartRate: String
    var spo2: String
    var temperature: String

    /// Creates a new `MedicalRecord`.
    init(id: UUID, systolicDiastolic: String, heartRate: String, spo2: String, temperature: String) {
        self.id = id
        self.systolicDiastolic = systolicDiastolic
        self.heartRate = heartRate
        self.spo2 = spo2
        self.temperature = temperature
    }
}

/// Allows `MedicalRecord` to be used as a dynamic migration.
extension MedicalRecord: Migration { }

/// Allows `MedicalRecord` to be encoded to and decoded from HTTP messages.
extension MedicalRecord: Content { }

/// Allows `MedicalRecord` to be used as a dynamic parameter in route definitions.
extension MedicalRecord: Parameter { }
