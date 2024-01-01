import UIKit
import CombineRIBs
import TinyConstraints

protocol DetailPresentableListener: AnyObject {
  func presentableRemoved()
  func viewWillAppear() async
}

final class DetailViewController: UIViewController, DetailPresentable, DetailViewControllable {

  weak var listener: DetailPresentableListener?
  private var factLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 30)
    label.numberOfLines = 0
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setUI()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    if self.isBeingRemoved {
      self.listener?.presentableRemoved()
    }
  }
  
  override func viewIsAppearing(_ animated: Bool) {
    super.viewIsAppearing(animated)
    Task { await self.listener?.viewWillAppear() }
  }
  
  private func setUI() {
    self.view.backgroundColor = .white
    
    self.view.addSubview(factLabel)
    self.factLabel.centerInSuperview()
    self.factLabel.horizontalToSuperview(insets: .horizontal(16))
  }
  
  func updateLabel(text: String) {
    self.factLabel.text = text
  }
}
