import Combine
import Foundation

public protocol HTTPNetwork {
  func get(_ url: URL) async throws -> Data
}
