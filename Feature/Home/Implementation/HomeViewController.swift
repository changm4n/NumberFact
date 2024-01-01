import UIKit
import CombineRIBs
import TinyConstraints

protocol HomePresentableListener: AnyObject {
  func presentableRemoved()
  func incrButtonTapped()
  func decrButtonTapped()
  func showFactButtonTapped()
}

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {

  weak var listener: HomePresentableListener?
  
  private var incrButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("+", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 30)
    return button
  }()
  
  private var decrButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("-", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 30)
    return button
  }()
  
  private var countLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 50)
    return label
  }()
  
  private var showFactButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Show Fact", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 40)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.setUI()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    if self.isBeingRemoved {
      self.listener?.presentableRemoved()
    }
  }
  
  private func setUI() {
    self.view.addSubview(incrButton)
    self.view.addSubview(decrButton)
    self.view.addSubview(countLabel)
    self.view.addSubview(showFactButton)
    
    self.countLabel.centerInSuperview()
    incrButton.addAction(.init(handler: { [weak self] _ in
      self?.listener?.incrButtonTapped()
    }), for: .touchUpInside)
    decrButton.addAction(.init(handler: { [weak self] _ in
      self?.listener?.decrButtonTapped()
    }), for: .touchUpInside)
    showFactButton.addAction(.init(handler: { [weak self] _ in
      self?.listener?.showFactButtonTapped()
    }), for: .touchUpInside)
    
    self.incrButton.size(.init(width: 50, height: 50))
    self.incrButton.leadingToTrailing(of: countLabel, offset: 16)
    self.incrButton.centerY(to: countLabel)

    self.decrButton.size(.init(width: 50, height: 50))
    self.decrButton.trailingToLeading(of: countLabel, offset: -16)
    self.decrButton.centerY(to: countLabel)
    
    self.showFactButton.centerX(to: countLabel)
    self.showFactButton.topToBottom(of: countLabel, offset: 20)
  }
  
  func updateCount(count: Int) {
    self.countLabel.text = "\(count)"
  }
}
