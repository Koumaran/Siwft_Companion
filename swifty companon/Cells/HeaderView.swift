//
//  HeaderView.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 20/04/2019.
//  Copyright © 2019 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	func setupImage(image: UIImage) {
		let iv = UIImageView(image: image)
		self.addSubview(iv)
		iv.translatesAutoresizingMaskIntoConstraints = false
		iv.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		iv.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
		iv.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
		iv.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
		iv.contentMode = .scaleAspectFit
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
