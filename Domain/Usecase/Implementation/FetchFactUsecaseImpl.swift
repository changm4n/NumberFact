import Foundation
import Usecase
import HTTPNetwork

public final class FetchFactUsecaseImpl: FetchFactusecase {
  
  private let network: HTTPNetwork
  public init(network: HTTPNetwork) {
    self.network = network
  }
  
  public func fetch(count: Int) async throws -> String? {
    let data = try await self.network.get(URL(string: "http://numbersapi.com/\(count)/math")!)
    return String(data: data, encoding: .utf8)
  }
  
}
