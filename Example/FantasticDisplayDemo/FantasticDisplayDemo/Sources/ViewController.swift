import UIKit
import FantasticDisplay

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

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

    @objc func buttonTouched() {
        let contentView = UIView()
        contentView.backgroundColor = .yellow

        var options = Options()
        options.contentView = contentView

        let floatView = FloatView(options: options)
        floatView.show(on: view)
    }
}

