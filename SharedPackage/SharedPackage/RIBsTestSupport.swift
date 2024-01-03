import Foundation
import UIKit
import CombineRIBs
import Combine

open class ViewableRoutingMock: ViewableRouting {
  // Variables
  public var viewControllable: ViewControllable
  public var interactable: Interactable { didSet { interactableSetCallCount += 1 } }
  public var interactableSetCallCount = 0
  public var children: [Routing] = [Routing]() { didSet { childrenSetCallCount += 1 } }
  public var childrenSetCallCount = 0
  public var lifecycleSubject = PassthroughSubject<RouterLifecycle, Never>() {
    didSet {
      lifecycleSubjectSetCallCount += 1
    }
  }
  public var lifecycleSubjectSetCallCount = 0
  public var lifecycle: AnyPublisher<RouterLifecycle, Never> { return lifecycleSubject.eraseToAnyPublisher() }

  // Function Handlers
  public var loadHandler: (() -> Void)?
  public var loadCallCount: Int = 0
  public var attachChildHandler: ((_ child: Routing) -> Void)?
  public var attachChildCallCount: Int = 0
  public var detachChildHandler: ((_ child: Routing) -> Void)?
  public var detachChildCallCount: Int = 0

  public init(
    interactable: Interactable,
    viewControllable: ViewControllable
  ) {
    self.interactable = interactable
    self.viewControllable = viewControllable
  }

  public func load() {
    loadCallCount += 1
    if let loadHandler = loadHandler {
      return loadHandler()
    }
  }

  public func attachChild(_ child: Routing) {
    attachChildCallCount += 1
    if let attachChildHandler = attachChildHandler {
      return attachChildHandler(child)
    }
  }

  public func detachChild(_ child: Routing) {
    detachChildCallCount += 1
    if let detachChildHandler = detachChildHandler {
      return detachChildHandler(child)
    }
  }
}

public final class ViewControllableMock: UIViewController, ViewControllable {
  
  public init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public var presentCallCount = 0
  public override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
    presentCallCount += 1
  }
  
  public var dismissCallCount = 0
  public override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
    dismissCallCount += 1
  }

}
