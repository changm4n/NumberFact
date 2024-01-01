import CombineRIBs
import Detail
protocol DetailInteractable: Interactable {
  var router: DetailRouting? { get set }
  var listener: DetailListener? { get set }
}

protocol DetailViewControllable: ViewControllable {
  
}

protocol DetailRouterDependency {
  
}

final class DetailRouter: ViewableRouter<DetailInteractable, DetailViewControllable>, DetailRouting {
  
  private let dependency: DetailRouterDependency
  
  init(interactor: DetailInteractable, viewController: DetailViewControllable, dependency: DetailRouterDependency) {
    self.dependency = dependency
    super.init(interactor: interactor, viewController: viewController)
    interactor.router = self
  }
}
