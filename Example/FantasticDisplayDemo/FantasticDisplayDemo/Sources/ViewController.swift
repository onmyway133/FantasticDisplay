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
        let hudContainer = HUDContainer()

        var options = Options()
        options.contentView = hudContainer

        let floatView = FloatView(options: options)
        floatView.show(on: view)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5, execute: {
            floatView.hide()
        })
    }
}

