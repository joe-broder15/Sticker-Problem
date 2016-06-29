//
//  ViewController.swift
//  Sticker-Problem
//
//  Created by JoeB on 6/28/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePickerController = UIImagePickerController()
    
    @IBOutlet weak var imageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.dismissViewControllerAnimated(false, completion: nil)
        self.imageView.image = image
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func moustacheButton(sender: UIButton) {
		let alertController = UIAlertController(title: nil, message: "Choose type of Moustache", preferredStyle: .ActionSheet)
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
		alertController.addAction(cancelAction)
		
		let moustType1 = UIAlertAction(title: "Moustache type 1", style: .Default) { (action) in
			//let imageViewObject = UIImageView(frame:CGRectMake(60, 220, 212.5, 96.5))
			
			let mustache1 = Sticker(image: UIImage(named:"mustache1"))
			
			self.view.addSubview(mustache1)
		}
		
		let moustType2 = UIAlertAction(title: "Moustache type 2", style: .Default) { (action) in
			//let imageViewObject = UIImageView(frame:CGRectMake(50, 250, 271, 100))
			
			let mustache2 = Sticker(image: UIImage(named:"mustache2"))
			
			self.view.addSubview(mustache2)
		}
		
		let moustType3 = UIAlertAction(title: "Moustache type 3", style: .Default) { (action) in
			//let imageViewObject = UIImageView(frame:CGRectMake(50, 270, 266, 98))
			
			let mustache3 = Sticker(image: UIImage(named:"mustache3"))
			
			self.view.addSubview(mustache3)
		}
		
		alertController.addAction(moustType1)
		alertController.addAction(moustType2)
		alertController.addAction(moustType3)
		
		self.presentViewController(alertController, animated: true, completion: nil)

		

    }

    @IBAction func hatButton(sender: UIButton) {
		
		//let imageViewObject = UIImageView(frame:CGRectMake(0, 30, 332, 205))
		
		let hat1 = Sticker(image: UIImage(named:"hat1"))
		
		self.view.addSubview(hat1)
		
		
    }
    
    @IBAction func glassesButton(sender: UIButton) {
		//let imageViewObject = UIImageView(frame:CGRectMake(0, 150, 342, 144))
		
		let eyeglasses1 = Sticker(image: UIImage(named:"eyeglasses1"))
		
		self.view.addSubview(eyeglasses1)
    }

    @IBAction func takePhotoButton(sender: UIButton) {
        imagePickerController.sourceType = .Camera
        self.presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func selectPhotoButton(sender: UIButton) {
        imagePickerController.sourceType = .PhotoLibrary
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
}

