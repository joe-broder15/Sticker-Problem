//
//  Sticker.swift
//  Sticker-Problem
//
//  Created by Parth Shah on 29/06/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class Sticker: UIImageView {

	override init(image: UIImage?){
		super.init(image: image)
		self.image = image
		self.userInteractionEnabled = true
		//#selector is to select the method, before it was just a string that was passed in
		let pan = UIPanGestureRecognizer(target: self,
		                                 action: #selector(self.handlePan(_:))) //_: way to pass in the thing that called it: UIPanGestureRecogizer
		
		let rotate = UIRotationGestureRecognizer(target: self, action: #selector(self.handleRotate(_:)))
		
		let pinch = UIPinchGestureRecognizer(target: self, action: #selector(self.handlePinch(_:))) //_: way to pass in the thing that called it: UIPanGestureRecogizer
		
		self.addGestureRecognizer(pinch)
		self.addGestureRecognizer(pan)
		self.addGestureRecognizer(rotate)
	}
	
	//Required for any UIImageView class
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder) //or super.init(image:nil)
	}
	
	func handlePan(panGestureRecognizer: UIPanGestureRecognizer!){
			//Get the spot it is now
			let translation = panGestureRecognizer.translationInView(panGestureRecognizer.view)
			
			if let view = panGestureRecognizer.view{
				let affinerTransformTranslate = CGAffineTransformTranslate(view.transform, translation.x, translation.y)
				view.transform = affinerTransformTranslate
				panGestureRecognizer.setTranslation(CGPointZero, inView: view)
			}else{
				print("No View")
			}
		
	}
	
	func handleRotate(rotateGestureRecognizer: UIRotationGestureRecognizer!){
		if let view = rotateGestureRecognizer.view {
			view.transform = CGAffineTransformRotate(view.transform, rotateGestureRecognizer.rotation)
			rotateGestureRecognizer.rotation = 0
		}
	}
	
	func handlePinch(pinchGestureRecognizer: UIPinchGestureRecognizer){
		if let view = pinchGestureRecognizer.view {
			view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale)
			pinchGestureRecognizer.scale = 1
			
		}
	}
	
	

}
