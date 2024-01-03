import Foundation
import CombineRIBs
import SharedPackage
import Detail
import DetailTestSupport

@testable import HomeImpl

final class HomeDependencyMock: HomeDependency, HomeInteractorDependency {
  var detailBuildable: DetailBuildable = DetailBuildableMock()
}

final class HomePresentableMock: HomePresentable {
  var listener: HomePresentableListener?
  
  var updateCountCallCount: Int = 0
  var updateCountValue: Int = 0
  func updateCount(count: Int) {
    self.updateCountValue = count
    self.updateCountCallCount += 1
  }
}

final class HomeRoutingMock: ViewableRoutingMock, HomeRouting {
  
  var attachDetailCallCount: Int = 0
  func attachDetail(count: Int) {
    self.attachDetailCallCount += 1
  }
  
  var detachDetailCallCount: Int = 0
  func detachDetail() {
    self.detachDetailCallCount += 1
  }
}
