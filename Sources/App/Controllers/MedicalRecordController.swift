import Vapor

/// Controlers basic CRUD operations on `MedicalRecord`s.
final class MedicalRecordController {
    /// Returns a list of all `MedicalRecord`s.
    func index(_ req: Request) throws -> Future<[MedicalRecord]> {
        return MedicalRecord.query(on: req).all()
    }

    /// Saves a decoded `MedicalRecord` to the database.
    func create(_ req: Request) throws -> Future<MedicalRecord> {
        return try req.content.decode(MedicalRecord.self).flatMap { medicalRecord in
            return medicalRecord.save(on: req)
        }
    }

    /// Deletes a parameterized `MedicalRecord`.
    func delete(_ req: Request) throws -> Future<HTTPStatus> {
        return try req.parameters.next(MedicalRecord.self).flatMap { medicalRecord in
            return medicalRecord.delete(on: req)
        }.transform(to: .ok)
    }
}
