import Foundation
import HTTPNetwork

public final class HTTPNetworkImp: HTTPNetwork {
  
  private let session: URLSession
  
  public init(session: URLSession) {
    self.session = session
  }
  
  public func get(_ url: URL) async throws -> Data {
    return try await session.data(from: url).0
  }
}
