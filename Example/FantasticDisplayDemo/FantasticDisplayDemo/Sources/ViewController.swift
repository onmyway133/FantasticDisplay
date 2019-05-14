import UIKit
import FantasticDisplay

class ViewController: UIViewController {
    let imageView = UIImageView(image: UIImage(named: "wallpaper"))
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(imageView)

        stackView.axis = .vertical

        stackView.addArrangedSubview(makeButton(title: "HUD progress", selector: #selector(showHUDProgress)))
        stackView.addArrangedSubview(makeButton(title: "HUD success", selector: #selector(showHUDSuccess)))
        stackView.addArrangedSubview(makeButton(title: "HUD error", selector: #selector(showHUDError)))
        stackView.addArrangedSubview(makeButton(title: "Toast message", selector: #selector(showToastMessage)))
        stackView.addArrangedSubview(makeButton(title: "Hide", selector: #selector(showHUDProgress)))

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func makeButton(title: String, selector: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: selector, for: .touchUpInside)
        return button
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        imageView.frame = view.bounds
    }

    @objc func showHUDProgress() {
        FantasticDisplay.showHUD(type: .progress, on: view)
    }

    @objc func showHUDSuccess() {
        FantasticDisplay.showHUD(type: .success, on: view)
    }

    @objc func showHUDError() {
        FantasticDisplay.showHUD(type: .error, on: view)
    }

    @objc func showToastMessage() {
        let text2 = "What you don't know is what you haven't learned. Contact github.com/onmyway133"
        FantasticDisplay.showToast(text: text2, on: view)
    }

    @objc func hide() {
        FantasticDisplay.hide()
    }
}

