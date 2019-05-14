// FantasticDisplay iOS Playground

import UIKit
import FantasticDisplay

let hud1 = HUDContainer(contentView: SuccessView())
let hud2 = HUDContainer(contentView: ProgressView())
let hud3 = HUDContainer(contentView: ErrorView())

[hud1, hud2, hud3].forEach {
    $0.frame.size = CGSize(width: 150, height: 150)
    $0.startAnimation()
}

hud1
hud2
hud3
