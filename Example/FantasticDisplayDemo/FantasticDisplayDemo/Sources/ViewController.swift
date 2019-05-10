import UIKit
import FantasticDisplay

class ViewController: UIViewController {
    let imageView = UIImageView(image: UIImage(named: "wallpaper"))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(imageView)

        let button = UIButton(type: .system)
        button.setTitle("HUD", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)

        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        imageView.frame = view.bounds
    }

    @objc func buttonTouched() {
        let floatView = FloatView(contentView: HUDContainer(contentView: ProgressView()))
        floatView.show(on: view)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5, execute: {
            floatView.hide()
        })
    }
}

