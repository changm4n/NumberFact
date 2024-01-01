import Home
import HomeImpl
import Detail
import DetailImpl
import Usecase
import UsecaseImpl
import HTTPNetwork
import HTTPNetworkImpl

final class AppComponent: HomeDependency, DetailDependency {
  lazy var homeBuildable: HomeBuildable = HomeBuilder(dependency: self)
  lazy var detailBuildable: DetailBuildable = DetailBuilder(dependency: self)
  
  let fetchFactUsecase: FetchFactusecase
  let httpNetwork: HTTPNetwork
  
  init() {
    let httpNetwork = HTTPNetworkImp(session: .shared)
    self.httpNetwork = httpNetwork
    self.fetchFactUsecase = FetchFactUsecaseImpl(network: httpNetwork)
  }
}
