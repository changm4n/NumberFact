import Foundation

public protocol FetchFactusecase {
  func fetch(count: Int) async throws -> String?
}
