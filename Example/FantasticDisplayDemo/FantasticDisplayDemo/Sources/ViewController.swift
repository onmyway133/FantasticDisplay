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
        stackView.addArrangedSubview(makeButton(title: "HUD heart", selector: #selector(showHUDHeart)))
        stackView.addArrangedSubview(makeButton(title: "HUD star", selector: #selector(showHUDStar)))
        stackView.addArrangedSubview(makeButton(title: "Toast message", selector: #selector(showToastMessage)))
        stackView.addArrangedSubview(makeButton(title: "Hide", selector: #selector(hide)))

        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }

    func makeButton(title: String, selector: Selector) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .caption1)
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

    @objc func showHUDHeart() {
        FantasticDisplay.showHUD(type: .shape(.heart), on: view)
    }

    @objc func showHUDStar() {
        FantasticDisplay.showHUD(type: .shape(.star), on: view)
    }

    @objc func showToastMessage() {
        let text2 = "What you don't know is what you haven't learned. Contact github.com/onmyway133"
        FantasticDisplay.showToast(text: text2, on: view)
    }

    @objc func hide() {
        FantasticDisplay.hide()
    }
}

