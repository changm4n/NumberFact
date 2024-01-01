import CombineRIBs
import Home
import Detail

protocol HomeInteractable: Interactable, DetailListener {
  var router: HomeRouting? { get set }
}

protocol HomeViewControllable: ViewControllable {
  
}

protocol HomeRouterDependency {
  var detailBuildable: DetailBuildable { get }
}

final class HomeRouter: LaunchRouter<HomeInteractable, HomeViewControllable>, HomeRouting {
  
  private let dependency: HomeRouterDependency
  private var detail: ViewableRouting?
  
  init(interactor: HomeInteractable, viewController: HomeViewControllable, dependency: HomeRouterDependency) {
    self.dependency = dependency
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
  
  func attachDetail(count: Int) {
    guard self.detail == nil else { return }
    let router = self.dependency.detailBuildable.build(withListener: self.interactor, count: count)
    self.detail = router
    self.attachChild(router)
    self.viewControllable.presentViewControllable(router.viewControllable, animated: true)
  }
  
  func detachDetail() {
    guard let router = self.detail else { return }
    self.detail = nil
    self.detachChild(router)
    self.viewControllable.dismissViewControllableIfNeeded(router.viewControllable, animated: true)
  }
  
}
