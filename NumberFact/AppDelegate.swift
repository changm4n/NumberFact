import UIKit
import CombineRIBs
import Home

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  let appComponent: AppComponent = AppComponent()
  var launchRouter: LaunchRouting?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    self.startApplication()
    return true
  }
  
  private func startApplication() {
    let launchRouter = self.appComponent.homeBuildable.build()
    let window = UIWindow(frame: UIScreen.main.bounds)
    launchRouter.launch(from: window)
    self.window = window
    window.rootViewController = launchRouter.viewControllable.uiviewController
    window.makeKeyAndVisible()
    self.launchRouter = launchRouter
  }
}

