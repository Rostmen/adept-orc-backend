import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    // Example of configuring a controller
    let controller = MedicalRecordController()
    router.get("medical_records", use: controller.index)
    router.post("medical_records", use: controller.create)
    router.delete("medical_records", MedicalRecord.parameter, use: controller.delete)
}
