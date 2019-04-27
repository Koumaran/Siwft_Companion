//
//  UINavigationBar.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 12/03/2019.
//  Copyright © 2019 Jegathas Sivanesan. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationBar {
	func installBlurEffect() {
		isTranslucent = true
		setBackgroundImage(UIImage(), for: .default)
		let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
		var blurFrame = bounds
		blurFrame.size.height += statusBarHeight
		blurFrame.origin.y -= statusBarHeight
		let blurView  = UIVisualEffectView(effect: UIBlurEffect(style: .light))
		blurView.isUserInteractionEnabled = false
		blurView.frame = blurFrame
		blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		addSubview(blurView)
		blurView.layer.zPosition = -1
	}
}
