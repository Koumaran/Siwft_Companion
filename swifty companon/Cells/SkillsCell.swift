//
//  SkillsCell.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 31/05/2019.
//  Copyright © 2019 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class SkillsCell: UICollectionViewCell {

	@IBOutlet weak var skillsName: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		let round = CAShapeLayer()
		let roundPath = UIBezierPath(arcCenter: self.center, radius: self.frame.width / 2, startAngle: 0, endAngle: .pi * 2, clockwise: true)
		round.path = roundPath.cgPath
		round.strokeEnd = 1
		round.strokeColor = UIColor.green.cgColor
		self.layer.addSublayer(round)
    }
	
	func setupSkills(skill: Skills) {
		skillsName.text = skill.name
	}

}
