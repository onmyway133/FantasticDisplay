import UIKit
import FantasticDisplay

class ViewController: UIViewController {
    let imageView = UIImageView(image: UIImage(named: "wallpaper"))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(imageView)

        let showButton = UIButton(type: .system)
        showButton.setTitle("Show", for: .normal)
        showButton.setTitleColor(.black, for: .normal)
        showButton.addTarget(self, action: #selector(showButtonTouched), for: .touchUpInside)

        view.addSubview(showButton)
        showButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        let hideButton = UIButton(type: .system)
        hideButton.setTitle("Hide", for: .normal)
        hideButton.setTitleColor(.black, for: .normal)
        hideButton.addTarget(self, action: #selector(hideButtonTouched), for: .touchUpInside)

        view.addSubview(hideButton)
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hideButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hideButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200)
        ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        imageView.frame = view.bounds
    }

    @objc func showButtonTouched() {
        FantasticDisplay.showHUD(type: .error, on: view)
    }

    @objc func hideButtonTouched() {
        FantasticDisplay.hide()
    }
}

