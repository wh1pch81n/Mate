//
//  MateDuties.swift
//  Mate
//
//  Created by Derrick  Ho on 9/16/16.
//  Copyright © 2016 Derrick  Ho. All rights reserved.
//

import UIKit

open class Mate {
	open func salute() {
		print("Eye Eye Sir!")
	}
	public init() {
		
	}
}

@IBDesignable
open class View: UIView {
	@IBOutlet weak var label: UILabel!
	
	override public init(frame: CGRect) {
		super.init(frame: frame)
		setUp()
	}
	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setUp()
	}
	
	open func setUp() {
		let bundle = Bundle(for: type(of: self))
		let nib = UINib(nibName: nibName, bundle: bundle)
		let v = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
		
		addSubview(v)
		v.translatesAutoresizingMaskIntoConstraints = false
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["v":v]))
		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["v":v]))
		
		self.label.text = nibName
	}
	
	open var nibName: String {
		return String(describing: type(of: self))
	}
}
