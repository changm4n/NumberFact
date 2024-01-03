import Foundation
import CombineRIBs
import Detail
import SharedPackage

public final class DetailBuildableMock: DetailBuildable {
  
  public var buildCallCount: Int = 0
  public func build(withListener listener: DetailListener, count: Int) -> ViewableRouting {
    self.buildCallCount += 1
    return ViewableRoutingMock(interactable: Interactor(),
                               viewControllable: ViewControllableMock())
  }
  
  public init() {
    
  }
}
