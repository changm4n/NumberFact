import CombineRIBs
import Detail
import Usecase

public protocol DetailDependency: Dependency {
  var fetchFactUsecase: FetchFactusecase { get }
}

final class DetailComponent: Component<DetailDependency>, DetailInteractorDependency, DetailRouterDependency {
  var count: Int
  var fetchFactUsecase: FetchFactusecase { self.dependency.fetchFactUsecase }
  init(dependency: DetailDependency, count: Int) {
    self.count = count
    super.init(dependency: dependency)
  }
}

// MARK: - Builder

public final class DetailBuilder: Builder<DetailDependency>, DetailBuildable {
  
  public override init(dependency: DetailDependency) {
    super.init(dependency: dependency)
  }
  
  public func build(withListener listener: DetailListener, count: Int) -> ViewableRouting {
    let component = DetailComponent(dependency: self.dependency, count: count)
    let viewController = DetailViewController()
    let interactor = DetailInteractor(presenter: viewController, dependency: component)
    interactor.listener = listener
    return DetailRouter(interactor: interactor, viewController: viewController, dependency: component)
  }
}
